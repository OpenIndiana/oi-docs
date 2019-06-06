#! /usr/bin/env python3
import logging
import threading

from html.parser import HTMLParser
from urllib.request import urlopen, Request
from urllib.parse import urlparse, urljoin
from enum import Enum


class Result(Enum):
    GOOD = 0
    BAD = 1
    ERROR = 2
    WARN = 3

SITE_URL = "http://docs.openindiana.org/"
ACCEPTED_PROTOCOLS = ["http", "https", "ftp"]

log = logging.getLogger(__name__)
logging.basicConfig(
    format='%(levelname)s %(message)s',
    level=logging.INFO,
)


def _to_absolute_url(url, base):
    """
    Retrieve the absolute URL of a relative link within a web page.
    :param str url: the relative URL
    :param str base: the base URL
    :return: the absolute URL if existed
    """
    protocol = urlparse(url)[0]
    if protocol == "":
        return urljoin(base, url)
    elif protocol in ACCEPTED_PROTOCOLS:
        return url
    else:
        return None


class LinkGetter(HTMLParser):

    def __init__(self, base, *args, **kwargs):
        HTMLParser.__init__(self, *args, **kwargs)
        self.base = base    # the base URL
        self.links = set()  # a set of URLs within the web page

    def handle_starttag(self, tag, attrs):
        if tag == 'a':
            for key, value in attrs:
                if key == 'href':
                    url = _to_absolute_url(value, self.base)
                    if url:
                        self.links.add(url)


def check(url):
    """
    Validate the all the resources within the url.

    :param url: the URL string to the page.
    :return:
    """
    log.info("Base URL: %s", url)
    links = {url}   # collection of all URLs we have visited
    result = {}     # given a URL, it will tell us whether that link is good
    lock = threading.Lock()

    def _check(url, base):
        # log.debug("Checking: %s", url)
        try:
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7',
            }
            request = Request(url, headers=headers)
            response = urlopen(request)
        except Exception as ex:
            log.debug("Exception while opening URL: %s", ex)
            return Result.ERROR

        to_external_site = lambda link, base: link[:len(base)] != base
        if to_external_site(url, base):
            # if we receive the response externally, that means the link is alive
            return Result.GOOD
        else:
            # we're still in the same site
            # log.debug("Downloading %s", url)
            charset = response.headers.get_param('charset')
            # Can't get the charset
            if charset == None:
                log.debug("Cannot get character set for %s", url)
                return Result.WARN
            data = response.read()
            data = data.strip().decode(charset)
                
            content_type = response.info().get('Content-Type')
            content_type = content_type.split(';')[0] if content_type else None

            if content_type == 'text/html':
                # parse for links
                try:
                    parser = LinkGetter(response.geturl())
                    parser.feed(data)
                    parser.close()
                    with lock:
                        links.update(i for i in parser.links if i not in result.keys())
                except Exception as ex:
                    log.error("Exception: %s", ex)
                    return Result.BAD

            return Result.GOOD

    from concurrent.futures import ThreadPoolExecutor
    executor = ThreadPoolExecutor(max_workers=8)
    while links:
        with lock:
            link = links.pop()

        if link in result:
            continue

        executor.submit(result.setdefault(link, _check(link, url)))
        if result[link] != Result.GOOD:
            log.warn("Bad link: %s - %s", link, result[link])
    log.info("Done validation")


def main():
    # parser = optparse.OptionParser()
    # options, args = parser.parse_args()
    # if not args:
    #     log.error("Where's my url?")
    #     exit(1)
    # check(args[0])
    log.setLevel(logging.DEBUG)
    check(SITE_URL)

if __name__ == "__main__":
    main()
