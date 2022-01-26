#!/usr/bin/env bash
##############################################################################
# makepdf.sh: A simple bash script to produce pdfs for OpenIndiana Docs
#
# Copyright (C) 2017  Benny Lyons: benny.lyons@gmx.net
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at https://illumos.org/license/
# 
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at https://illumos.org/license/
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Contributor(s):
#

#
# This variable holds all supported formats
#
SUPPORTED_FORMATS="pdf epub"

#
# If you would top add a subdirectory with files that should be built, add the
# subdirectory here; or use the -d option
#
# Processing these directories in docs by default:
#     books - Needs HTML in markdown to be fixed, so do not include
#     contrib
#     dev
#     handbook
#     handbook/community
#     misc
PROCESS_THESE_DIRECTORIES="contrib dev handbook handbook/community misc"




help()
{
    cat<<EOF
    Usage: $0 <options> 

    Simple script to produce pdf and epub formats for OpenIndiana Docs
    The epub format is experimental.

    Without any options, all files ending in .md in the following
    directories are converted:
        books
        contrib
        dev
        handbook
        handbook/community
        misc

    All files produced will be placed in a new directory denoted 
    according to the output format, i.e., ./pdf or ./epub

    REQUIREMENTS
    On a Debian system, you must install the following packages:
        $ sudo pip install pandoc
        $ sudo pip install mkdocs-pandoc
        $ sudo apt-get install texlive-full
        $ sudo apt-get install texlive-xetex

    OPTIONS
    -d <subdir>  convert all files in this subdirectory
    -f <filename> only convert this filename
       Default: convert everything
    -h this help
    -t <pdf || epub> output type either pdf or epub
       Default: pdf
    -s <web || opensolaris> output style either web or opensolaris (only applicable to pdf)
       Default: pdf

    EXAMPLES
    Convert all files in the contrib sub-dir:
        makepdf.sh -d contrib
    Convert getting-started.md:
        makepdf.sh -f ./docs/contrib/getting-started.md
    Produce epub:
        makepdf.sh -t epub -f ./docs/contrib/getting-started.md
EOF
}

get_file_basename ()
{
        this_file=$1
        this_file="${this_file##*/}"
        echo "${this_file%.*}"
}

get_file_ext ()
{
        this_file=$1
        echo "${this_file##*.}"
}

get_file_path()
{
        this_file=$1
        echo $(dirname "$infile")
}

get_out_rel_path_file()
{
        input_basename="$1"
        format="$2"

        out_rel_path_file=""

        out_rel_path_file="./"$format"/"$input_basename"."$format
}




#
# pandoc 2.8 was released on 2019-11-22 which is the first
# version to support LaTex in the header-includes variable
# For backward compatibility, we'd like to support older
# pandoc versions, but would prefer new features
is_pandoc_version_new()
{
        pandoc_version_match="^pandoc ([0-9]+)\.([0-9]+).*$"

        if [[ $(pandoc --version) =~ $pandoc_version_match ]]; then
            if [ "${BASH_REMATCH[1]}" -gt "2" ]; then
                echo "true"
            elif [ "${BASH_REMATCH[1]}" -eq "2" ] && [ "${BASH_REMATCH[2]}" -ge "8" ]; then
                echo "true"
            else
                echo "false"
            fi
        else
                echo "false"
        fi
}


do_conversion_epub()
{
        this_basename="$1"
        this_format="$2"
        
        if [ "$this_format" != "epub" ]; then
                echo >&2 -n "SERIOUS ERROR: trying to process for epub, but "
                echo >&2 "requested format is not epub"
                exit 1
        fi

        this_title=$this_basename

        get_out_rel_path_file "$this_basename" "$this_format"
        
        $(pandoc -t epub --toc -f markdown+grid_tables+table_captions --metadata title="$this_title" -o $out_rel_path_file $input_basename".md"  --pdf-engine=xelatex)
        
}


do_conversion_with_older_pandoc()
{
        this_basename="$1"
        this_format="$2"

        if [ "$this_format" != "pdf" ]; then
                echo >&2 -n "SERIOUS ERROR: trying to process for pdf using"
                echo >&2 "older pandoc, but requested format is not pdf"
                exit 1
        fi

        
        get_out_rel_path_file "$this_basename" "$this_format"

        $(pandoc --toc -f markdown+grid_tables+table_captions \
                 -o $output_path_file $input_basename".md" \
                 --pdf-engine=xelatex)
}

do_conversion_pdf()
{
        this_basename="$1"
        this_format="$2"
        this_style="$3"

        if [ "$this_format" != "pdf" ]; then
                echo >&2 -n "SERIOUS ERROR: trying to process for pdf, but "
                echo >&2 "requested format is not pdf"
                exit 1
        fi

        get_out_rel_path_file "$this_basename" "$this_format"
        
        if [ "$this_style" == "opensolaris" ]; then
                $(pandoc --pdf-engine=xelatex \
                         --lua-filter $OLDPWD/pandoc/filter-sb.lua \
                         --metadata-file $OLDPWD/pandoc/config-sb.yaml \
                         -o $out_rel_path_file $input_basename".md")
        elif [ "$this_style" == "web" ]; then
                $(pandoc --pdf-engine=xelatex \
                         --lua-filter $OLDPWD/pandoc/filter-web.lua \
                         --metadata-file $OLDPWD/pandoc/config-web.yaml \
                         -o $out_rel_path_file $input_basename".md")
        
        else
                echo "ERROR: can only process one of these styles: opensolaris or web"
                exit 1
        fi
}


do_conversion()
{
        input_basename="$1"
        format="$2"
        style="$3"

        
        if [ "$format" == "epub" ]; then
                do_conversion_epub "$input_basename" "$format"

                
        elif [ "$format" == "pdf" ]; then               
                if [ "$(is_pandoc_version_new)" == "false" ]; then
                        # This call for backward compatibility 
                        do_conversion_with_older_pandoc "$input_basename" "$format"
                        
                else
                        do_conversion_pdf "$input_basename" "$format" "$style"
                fi
        fi
}


# This function sets is_format_valid_result = True || False
# True: users select a valid format
# False: users select an invalid format
is_format_valid()
{
        input_format=$1
        is_format_valid_result="False"
        
        for  i in $SUPPORTED_FORMATS  ; do
                if [ "${i}" == "$input_format" ]; then
                        is_format_valid_result="True"
                fi
        done
}


make_out_dir()
{
        the_output_format=$1
        path_to_input=$2
        
        is_format_valid $the_output_format
        if [ "$is_format_valid_result" == "False" ]; then
                echo >&2 "ERROR: -t only supports the following formats: "
                for  i in $SUPPORTED_FORMATS  ; do
                        echo "    "$i
                done
                exit 1
        fi
        
        out_path=$(pwd)"/"$path_to_input"/${the_output_format}/"
        mkdir -p $out_path
        if [ ! -d "$out_path" ]; then
                echo >&2 "ERROR: cannot create director at: "$out_path
                exit 1
        fi

        echo "  Writing output to this directory: " $out_path
}





main ()
{
        #
        # Command Line Options
        #
        while getopts "hd:f:t:s:" opt; do
	        case $opt in
                        d)
                                indir=$OPTARG
                                ;;
                        f)
                                infile=$OPTARG
                                ;;
                        h)
                                help
                                exit 0
                                ;;
                        t)
                                outformat=$OPTARG
                                ;;
                        s)
                                outstyle=$OPTARG
                                ;;
                        \?)
                                echo "Don't know this option"
                                exit 0
                                ;;
		esac
	done


        if [[ -n "$indir" && -n "$infile" ]]; then
                echo "ERROR: specify -d OR -f, but not both"
                exit 1
        fi

        
        if [ ! -n "$outformat" ]; then
                outformat="pdf" # Default format
        fi   
        is_format_valid $outformat
        if [ "$is_format_valid_result" == "False" ]; then
                echo >&2 "ERROR: -t only supports the following formats: "
                for  i in $SUPPORTED_FORMATS  ; do
                        echo "    "$i
                done
                exit 1
        fi

        if [ ! -n "$outstyle" ]; then
                outstyle="web" # Default style
        elif [ "$outstyle" != "web" ] && [ "$outstyle" != "opensolaris" ] ; then
                echo >&2 "ERROR: -s can only be web or opensolaris"
                exit 1
        fi



        # Required packages ok?
        type pandoc >/dev/null 2>&1 || {
                echo >&2 "ERROR: require package pandoc, please install pandoc."
                exit 1; }

        # Older versions of pandoc work, but we'd prefer the newer
        # features.
        # Issue a warning if an older version of pandoc is in use
        if [ "$(is_pandoc_version_new)" == "false" ]; then
                echo "WARNING: you are using an older version of pandoc"
        fi


        
        #
        # -f <filename>
        # Only a single file
        #
        if [ -n "$infile" ]; then
                # File must be present
                if [ -f "$infile" ]; then
                        this_path=$(get_file_path $infile)
                        file_basename=$(get_file_basename $infile)

                        make_out_dir "$outformat" "$this_path"
                        
                        cd $this_path
                        do_conversion  $file_basename $outformat $outstyle
                else
                    printf "\n"
                    echo "ERROR: cannot find file: " $infile
                    exit 1
                fi
                cd - > /dev/null
                exit 0
        fi


        
        #
        # -d <subdirectory> or all directories
        # An entire subdirectory
        #
        for  in_dir in $PROCESS_THESE_DIRECTORIES; do        
                echo "====Processing directory: $in_dir ===="
        
                if [ -n "$indir" ]; then
                        if [ "$indir" != "$in_dir" ]; then
                                continue
                        fi
                fi
                        
                # Directory must be present
                if [ -d "$in_dir" ]; then
                        this_path="$in_dir"
                elif [ -d "./docs/$in_dir" ]; then
                        this_path="./docs/$in_dir"
                else
                        echo "this_path" $this_path
                        printf "\n"
                        echo "ERROR: cannot find directory: " $in_dir
                        exit 1
                fi


                make_out_dir "$outformat" "$this_path"
                
                infiles=$(ls "$this_path")
                cd $this_path
                for infile in $infiles; do
                        file_basename=$(get_file_basename $infile)
                        file_ext=$(get_file_ext $infile)
                        
                        # Only process *md files
                        if [ "$file_ext" == "md" ]; then
                                echo "    Generating: " $file_basename"."$outformat
                                $(do_conversion $file_basename $outformat $outstyle)
                        fi
                done
                cd $OLDPWD
        done       
        cd - > /dev/null
        
}

# Execute this script
main $@


