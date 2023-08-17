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

    Simple script to currently produce pdf and epub formats for 
    OpenIndiana Docs. The epub format is experimental.


    OPTIONS
    -d <subdir>  convert all files in this subdirectory.
       Only all files in subdir are converted, no files in 
       subdirs of subdir are converted.   
    -f <filename> only convert filename
       Default: convert everything
    -h this help
    -t <pdf || epub> output type either pdf or epub
       Default: pdf
    -s <web || opensolaris> output style either web or opensolaris (only applicable to pdf)
       Default: web
    -v verbose provides more verbose output

    For more help, rerun with -vh

EOF
}


help_verbose()
{
    cat<<EOF
    Usage: $0 <options> 

    Simple script to produce pdf and epub formats for OpenIndiana Docs
    The epub format is experimental.

    Without any options, all files ending in .md in the direcxtories listed 
    in the variable PROCESS_THESE_DIRECTORIES will be processed.

    All files produced will be placed in a new directory denoted 
    according to the output format, i.e., ./pdf or ./epub in the top-level
    directory.

    REQUIREMENTS
    On a Debian system, you must install the following packages:
        $ sudo pip install pandoc
        $ sudo pip install mkdocs-pandoc
        $ sudo apt-get install texlive-full
        $ sudo apt-get install texlive-xetex

    OPTIONS
    -d <subdir>  convert all files in this subdirectory.
       Only all files in subdir are converted, no files in 
       subdirs of subdir are converted.   
    -f <filename> only convert filename
       Default: convert everything
    -h this help
    -t <pdf || epub> output type either pdf or epub
       Default: pdf
    -s <web || opensolaris> 2 different styles are currently supported
       for pdf: web or opensolaris. 
       Default: web
    -v verbose output

    ENVIRONMENT
    PROCESS_THESE_DIRECTORIES this variable coontains a list of directories.
                              Running $0 without any options will convert
                              all files ending in .md in these directories.

    EXAMPLES
    Convert all files in the contrib sub-dir:
        makepdf.sh -d contrib
    Convert getting-started.md:
        makepdf.sh -f ./docs/contrib/getting-started.md
    Produce epub with extra output:
        makepdf.sh -vt epub -f ./docs/contrib/getting-started.md
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


make_dir()
{
        this_path="$1"

        if [ ! -z "$this_path" ]; then
                if [ ! -d $this_path ]; then
                        mkdir -p $this_path
                        if [ ! -d "$out_path" ]; then
                                echo >&2 "ERROR: cannot create directory at: "$this_path
                                exit 1
                        fi
                fi
        fi
}


get_root()
{
        root_dir=""

        root_dir=$(pwd)
        if [ "$?" -ne "0" ]; then
                echo "ERROR: severe error. Could not get current path"
                exit $?
        fi
}


# Currently relative paths are specified in some documents
# to load Openindiana.png. The relative paths appear to
# take precedence over --resource-path option to pandoc
# As a workaround we add softlinks
do_workaround()
{
        if [ ! -f $root_dir/Openindiana.png ]; then
                $(ln -s $root_dir/docs/Openindiana.png $root_dir/Openindiana.png)
        fi
        if [ "$?" -ne "0" ]; then
                echo "ERROR: severe error. Could not generate link"
                exit $?
        fi
        if [ ! -f $root_dir/docs/handbook/Openindiana.png ]; then
                $(ln -s $root_dir/docs/Openindiana.png $root_dir/docs/handbook/Openindiana.png)
        fi
        if [ "$?" -ne "0" ]; then
                echo "ERROR: severe error. Could not generate link"
                exit $?
        fi
}


undo_workaround()
{
        $(rm $root_dir/Openindiana.png)
        if [ "$?" -ne "0" ]; then
                echo "ERROR: severe error. Could not remove link"
                exit $?
        fi
        $(rm $root_dir/docs/handbook/Openindiana.png)
        if [ "$?" -ne "0" ]; then
                echo "ERROR: severe error. Could not remove link"
                exit $?
        fi
}


clean_up()
{
        undo_workaround
}


get_full_path_outputfile()
{
        input_basename="$1"
        this_top_level_dir="$2"
        this_out_dir_stub="$3"
        this_format="$4"

        
        local prefix="./docs/"
        local this_outdir=""
        
        if [ -z "$input_basename" ]; then
                echo "Error: severe developer error: input_basename"
                exit 1
        fi
        if [ -z "$this_top_level_dir" ]; then
                echo "top_level_dir: "$this_top_level_dir
                echo "Error: severe developer error: top-level-dir not set"
                exit 1
        fi
        if [ -z "$this_out_dir_stub" ]; then
                echo "Error: severe developer error: this_out_dir_stub not set"
                exit 1
        fi
        if [ -z "$this_format" ]; then
                echo "Error: severe developer error: this_format not set"
                exit 1
        fi
        
        this_out_dir_stub_rm_prefix=${this_out_dir_stub#"$prefix"}
        this_outdir="$this_top_level_dir"/"$format"/"$this_out_dir_stub_rm_prefix"
        
        make_dir "$this_outdir"
                
        out_full_path_outputfile=$this_outdir"/"$input_basename"."$format
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
        the_output="$2"
        this_format="$3"
        
        if [ "$this_format" != "epub" ]; then
                echo >&2 -n "SERIOUS ERROR: trying to process for epub, but "
                echo >&2 "requested format is not epub"
                exit 1
        fi

        this_title=$this_basename

        
        $(pandoc -t epub --toc \
                 --epub-cover-image=../Openindiana.png \
                 -f markdown+grid_tables+table_captions \
                 --metadata title="$this_title" \
                 --metadata-file $OLDPWD/pandoc/config-sb.yaml \
                 --lua-filter $OLDPWD/pandoc/filter-sb.lua \
                 -o $the_output $this_basename".md"  --pdf-engine=xelatex)
        if [ "$?" -ne "0" ]; then
                echo "..." $root_dir
                echo "ERROR: severe error from poandoc" 
                exit $?
        fi

}


do_conversion_with_older_pandoc()
{
        this_basename="$1"
        this_output="$2"
        this_format="$3"

        if [ "$this_format" != "pdf" ]; then
                echo >&2 -n "SERIOUS ERROR: trying to process for pdf using"
                echo >&2 "older pandoc, but requested format is not pdf"
                exit 1
        fi

        
        #get_full_path_outputfile "$this_basename" "$this_format"

        $(pandoc --toc -f markdown+grid_tables+table_captions \
                 -o $this_output $this_basename".md" \
                 --pdf-engine=xelatex)
}

do_conversion_pdf()
{
        this_basename="$1"
        this_output="$2"
        this_format="$3"
        this_style="$4"

        if [ "$this_format" != "pdf" ]; then
                echo >&2 -n "SERIOUS ERROR: trying to process for pdf, but "
                echo >&2 "requested format is not pdf"
                exit 1
        fi

        
        if [ "$this_style" == "opensolaris" ]; then
                this_suffix="sb"
        elif [ "$this_style" == "web" ]; then
                this_suffix="web"
        fi

        # sed required to remove '!!!' annotation and indentation from note/warning blocks
        # This needs to be done prior to processing by Pandoc because it otherwise treats the
        # indentation as a code block and this cannot be reversed internally in Pandoc
        $(sed -E '/^!!! .*$/d ; s/^    (.*)$/\1/' \
                $this_basename".md" | \
        pandoc --pdf-engine=xelatex \
                --lua-filter $OLDPWD/pandoc/filter-$this_suffix.lua \
                --metadata-file $OLDPWD/pandoc/config-$this_suffix.yaml \
                -o $this_output)
}


do_conversion()
{
        input_basename="$1"
        this_top_level_dir="$2"
        this_out_dir_stub="$3"
        format="$4"
        style="$5"

        local this_outpath=""
        
        get_full_path_outputfile "$input_basename" "$this_top_level_dir" \
                                 "$this_out_dir_stub" "$format"
        
        if [ -z "$out_full_path_outputfile" ]; then
                echo "Error: severe developer error: out_full_path_outputfile not set"
                exit 1
        fi
        
        if [ "$format" == "epub" ]; then
                do_conversion_epub "$input_basename" "$out_full_path_outputfile" \
                                   "$format"

                
        elif [ "$format" == "pdf" ]; then               
                if [ "$(is_pandoc_version_new)" == "false" ]; then
                        # This call for backward compatibility 
                        do_conversion_with_older_pandoc "$input_basename" \
                                                        "$out_full_path_outputfile" \
                                                        "$format"
                else
                        do_conversion_pdf "$input_basename" \
                                          "$out_full_path_outputfile" \
                                          "$format" "$style"
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


is_dir_valid()
{
        input_dir="$1"
        is_dir_valid_result="False"

        if [ -d "$indir" ]; then
                is_dir_valid_result="True"
        elif [ -d "./docs/$in_dir" ]; then
                is_dir_valid_result="True"
        fi
}


make_out_toplevel_dir()
{
        the_output_format=$1
        the_output_dir=$2

        if [ -z "$the_output_dir" ]; then
                echo "Error: severe developer error: top-level-dir not set: the_output_dir"
                exit 1
        fi
        
        is_format_valid $the_output_format
        if [ "$is_format_valid_result" == "False" ]; then
                echo >&2 "ERROR: -t only supports the following formats: "
                for  i in $SUPPORTED_FORMATS  ; do
                        echo "    "$i
                done
                exit 1
        fi
        
        out_path="$the_output_dir""/""${the_output_format}/"
        mkdir -p $out_path
        if [ ! -d "$out_path" ]; then
                echo >&2 "ERROR: cannot create directory at: "$out_path
                exit 1
        fi

}





main ()
{
        #
        # Command Line Options
        #
        optverbose="False"
        opthelp="False"
        while getopts "hd:f:t:s:v" opt; do
	        case $opt in
                        d)
                                indir=$OPTARG
                                ;;
                        f)
                                infile=$OPTARG
                                ;;
                        h)
                                opthelp="True"
                                ;;
                        t)
                                outformat=$OPTARG
                                ;;
                        s)
                                outstyle=$OPTARG
                                ;;
                        v)
                                optverbose="True"
                                ;;
                        \?)
                                echo "Don't know this option"
                                exit 0
                                ;;
		esac
	done


        if [ "$opthelp" == "True" ]; then
                if [ "$optverbose" == "True" ]; then
                        help_verbose
                else
                        help
                fi
                exit 0
        fi
        
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


        # Get and set top-level dir
        get_root



        # workaround
        do_workaround
        
        #
        # -f <filename>
        # Only a single file
        #
        if [ -n "$infile" ]; then
                # File must be present
                if [ -f "$infile" ]; then
                        this_path=$(get_file_path $infile)
                        file_basename=$(get_file_basename $infile)

                        make_out_toplevel_dir "$outformat" "$root_dir"
                        cd $this_path

                        do_conversion  $file_basename $root_dir $this_path $outformat $outstyle
                else
                    printf "\n"
                    echo "ERROR: cannot find file: " $infile
                    clean_up
                    exit 1
                fi
                clean_up
                cd - > /dev/null
                exit 0
        fi

        
        #
        # -d <subdirectory> or all directories
        # An entire subdirectory
        #

        if [ -n "$indir" ]; then
                is_dir_valid "$indir" 
                if [ "$is_dir_valid_result" == "False" ]; then
                        echo "ERROR: not a directory: "$indir
                        echo "       The argument to -d must be a directory"
                        clean_up
                        exit 1
                else
                        PROCESS_THESE_DIRECTORIES="$indir"
                fi
        fi
        
        for  in_dir in $PROCESS_THESE_DIRECTORIES; do
                if [ "$optverbose" == "True" ]; then
                        echo "====Processing directory: $in_dir ===="
                fi
                
                
                # Directory must be present
                if [ -d "$in_dir" ]; then
                        this_path="$in_dir"
                elif [ -d "./docs/$in_dir" ]; then
                        this_path="./docs/$in_dir"
                else
                        printf "\n"
                        echo "ERROR: cannot find directory: " $in_dir
                        clean_up
                        exit 1
                fi

                make_out_toplevel_dir "$outformat" "$root_dir"
                if [ "$optverbose" == "True" ]; then
                        echo "  Writing output to this directory: " $out_path$in_dir
                fi

                
                infiles=$(ls "$this_path")

                cd $this_path
                for infile in $infiles; do
                        file_basename=$(get_file_basename $infile)
                        file_ext=$(get_file_ext $infile)
                        
                        # Only process *md files
                        if [ "$file_ext" == "md" ]; then
                                if [ "$optverbose" == "True" ]; then
                                        echo "    Generating: " $file_basename"."$outformat
                                fi
                                $(do_conversion $file_basename $root_dir $this_path $outformat $outstyle)
                                if [ "$?" -ne "0" ]; then
                                        echo "ERROR: severe error. Could not get current path"
                                        clean_up
                                        exit $?
                                fi
                        fi
                done
                cd $OLDPWD
        done
        clean_up
        cd - > /dev/null
        
}

# Execute this script
main $@


