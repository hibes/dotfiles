#!/bin/bash
# Cleanup docker files: untagged containers and images.
#
# Use `docker-cleanup -n` for a dry run to see what would be deleted.

##### variables
#######################################################



##### functions
#######################################################

usage() {
  echo -e "Cleanup docker files: remove untagged containers and images.\n" \
          "Usage: $(basename $0) [options]\n" \
          "\tOPTIONS:\n" \
          "\t\t-h, --help\n" \
          "\t\tPrint this help information\n"\
          "\t\t-p, --print\n" \
          "\t\tPrint variables used in logic, helpful for debugging.\n" \
          "\t\t-t, --test\n" \
          "\t\tA dry run to show what will be deleted.\n"
  exit 1
}


# read passed in options
TEMP=`getopt -o hpt --long help,print,test -n 'docker-cleanup.sh' -- "$@"`
eval set -- "$TEMP"

# extract options and their arguments into variables.
while true ; do
  case "$1" in
    -t|--test) M_TEST=true ; shift ;;
    -h|--help) M_HELP=true ; shift ;;

    -n|--no-cache) M_CACHE=--no-cache ; shift ;;
    -i|--img-name)
      case "$2" in
        "") shift 2 ;;
        *) M_IMG_NAME=$2 ; shift 2 ;;
      esac ;;
    -d|--doc)
      case "$2" in
        "") shift 2 ;;
        *) M_DOC=$(echo ${2:1}) ; shift 2 ;;
      esac ;;
    -p|--print) M_PRINT=true ; shift ;;
    --) shift ; break ;;
    *) usage; ;;
  esac
done

if [ ! -z "$M_HELP" ]; then
  usage
fi

set_defaults(){
  # set an initial value for the flags
  M_HELP=${M_HELP:-}
  M_TEST=${M_HELP:-false}
  M_PRINT=${M_PRINT:-}
}

echo_variables(){
  #Useful for debugging
  echo M_PRINT: $M_PRINT
  echo M_HELP: $M_HELP
  echo M_TEST: $M_TEST
}


untagged_containers() {
	# Print containers using untagged images: $1 is used with awk's print: 0=line, 1=column 1.
	# NOTE: "[0-9a-f]{12}" does not work with GNU Awk 3.1.7 (RHEL6).
	#       Ref: https://github.com/blueyed/dotfiles/commit/a14f0b4b#commitcomment-6736470
	docker ps -a | tail -n +2 | awk '$2 ~ "^[0-9a-f]+$" {print $'$1'}'
}

untagged_images() {
	# Print untagged images: $1 is used with awk's print: 0=line, 3=column 3.
	# NOTE: intermediate images (via -a) seem to only cause
	# "Error: Conflict, foobarid wasn't deleted" messages.
	# Might be useful sometimes when Docker messed things up?!
	# docker images -a | awk '$1 == "<none>" {print $'$1'}'
	docker images | tail -n +2 | awk '$1 == "<none>" {print $'$1'}'
}



##### logic
#######################################################
# Call set defaults after getopt logic so that $1 $2 etc refers to non-option arguments
set_defaults $*

# Dry-run.
if [ -z "$TEST" ]; then
	echo "=== Containers with uncommitted images: ==="
	untagged_containers 0
	echo

	echo "=== Uncommitted images: ==="
	untagged_images 0

	exit
fi
if [ -n "$1" ]; then
	echo "Cleanup docker files: remove untagged containers and images."
	echo "Usage: ${0##*/} [-n]"
	echo "   -n: dry run: display what would get removed."
	exit 1
fi

# Remove containers with untagged images.
echo "Removing containers:" >&2
untagged_containers 1 | xargs docker rm --volumes=true -f

# Remove untagged images
echo "Removing images:" >&2
untagged_images 3 | xargs docker rmi
