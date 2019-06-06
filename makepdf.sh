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

help()
{
    cat<<EOF
    Usage: $0 <options> 

    Simple script to produce pdf for OpenIndiana Docs

    Without any options, all files ending in .md in the following
    directories are converted:
        books
        contrib
        dev
        handbook
        misc

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

    EXAMPLES
    Convert all files in the contrib sub-dir:
        makepdf.sh -d contrib
    Convert getting-started.md:
        makepdf.sh -f ./docs/contrib/getting-started.md
EOF
}

get_file_basename ()
{
        this_file=$1
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

do_conversion()
{
        input=$1
        output=$2
        $(pandoc --toc -f markdown+grid_tables+table_captions -o $output $input  --latex-engine=xelatex)
}



main ()
{
        #
        # Command Line Options
        #
        while getopts "hd:f:" opt; do
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


        # Required packages ok?
        type pandoc >/dev/null 2>&1 || {
                echo >&2 "ERROR: require package pandoc, please install pandoc."
                exit 1; }


        # -f <filename>
        # Only a single file
        if [ -n "$infile" ]; then
                # File must be present
                if [ -f "$infile" ]; then
                        this_path=$(get_file_path $infile)
                        file_basename=$(get_file_basename $infile)
                        pdf_outfile=$file_basename".pdf"
                        $(do_conversion $infile $pdf_outfile)
                        printf "\n"
                        echo "    OUTPUT: " $pdf_outfile
                        printf "\n"
                fi

                exit 0
        fi

        
        # -d <subdirectory>
        # An entire subdirectory
        if [ -n "$indir" ]; then
                # Directory must be present
                if [ -d "$indir" ]; then
                        this_dir="$indir"
                elif [ -d "./docs/$indir" ]; then
                        this_dir="./docs/$indir"
                else
                        printf "\n"
                        echo "ERROR: cannot find directory: " $indir
                        exit 1
                fi

                echo "  Writing output to this directory: " $this_dir
                infiles=$(ls $this_dir)
                
                for infile in $infiles; do
                        file_basename=$(get_file_basename $infile)
                        pdf_outfile=$this_dir"/"$file_basename".pdf"
                        this_infile=$this_dir"/"$infile
                        $(do_conversion $this_infile $pdf_outfile)
                        echo "    Generating: " $file_basename".pdf"
                done
                exit 0
        fi

        # Default: do all directories
        
        # Only these directories in docs:
        #     books
        #     contrib
        #     dev
        #     handbook
        #     misc
        dirspath=docs
        dirs="books contrib"
        for dir in $dirs; do
                this_path=$dirspath"/"$dir
                echo "-------------------------"
                echo "Output to this directory: " $this_path
                these_files=$(ls $this_path)
                for this_file in $these_files; do
                        file_basename=$(get_file_basename $this_file)
                        file_ext=$(get_file_ext $this_file)

                        path_file_basename="./"$this_path"/"$file_basename
                        pdf_outfile=$path_file_basename".pdf"
                        this_infile=$path_file_basename".md"
                        # Only process *md files
                        if [ "$file_ext" == "md" ]; then
                                $(do_conversion $this_infile $pdf_outfile)
                                echo "    Generating: " $file_basename".pdf"
                        fi
                done
        done
}

# Execute this script
main $@


