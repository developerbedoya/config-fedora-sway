#!/bin/bash

OUTPUT="$(basename "${BASH_SOURCE[0]}" .sh).org"

print_body() {
    dnf history userinstalled | awk 'BEGIN { print "| Package Name | Architecture | Version |"; print "|--------------+--------------+---------|"; } { print "| " $1 " | " $2 " | " $3 " |" }' >> $OUTPUT
    echo '' >> $OUTPUT
}

print_header() {
    [ ! -e $OUTPUT ] || rm $OUTPUT
    echo '* Package list, generated automatically by the following command:' >> $OUTPUT
    echo '' >> $OUTPUT
    echo '#+BEGIN_SRC bash' >> $OUTPUT
    declare -f print_body | tail -n +3 | head -n -2 | sed 's/^[ \t]*//' | sed 's/>> \$OUTPUT;\s*$//g' >> $OUTPUT
    echo '#+END_SRC' >> $OUTPUT
    echo '' >> $OUTPUT
}

print_header && print_body
