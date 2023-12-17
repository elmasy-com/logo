#!/bin/bash

set -e

create_readme() {

    echo "# logo" > "README.md"
    echo ""  >> "README.md"
    echo "![Elmasy Logo](/logo/blue_transparent_256.png \"Elmasy Logo\")"  >> "README.md"
    echo "" >> "README.md"

    echo "## cover"  >> "README.md"
    echo ""  >> "README.md"
    echo "OG / Twitter cover images."  >> "README.md"
    echo ""  >> "README.md"

    for FILE in cover/*
    do
        if [ "$FILE" == "README.md" ]
        then
            continue
        fi

        echo "- $(/usr/bin/file $FILE)" >> "README.md"

    done

    echo "## logo"  >> "README.md"
    echo ""  >> "README.md"
    echo "Square logos"  >> "README.md"
    echo ""  >> "README.md"

    for FILE in logo/*
    do
        if [ "$FILE" == "README.md" ]
        then
            continue
        fi

        echo "- $(/usr/bin/file $FILE)" >> "README.md"

    done
}

print_help() {

    echo "Usage: $0 <command>"
    echo ""
    echo "Commands:"
    echo "  readme  Create README files in directories"
    echo "  help    Print help"
}

case "$1" in
    "readme")
        create_readme
        ;;
    "help")
        print_help
        ;;
    "")
        print_help
        exit 1
        ;;
    *)
        echo "Invalid command: \"$1\""
        print_help
        exit 1
        ;;
esac