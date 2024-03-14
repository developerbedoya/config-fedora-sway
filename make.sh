#!/bin/bash
echo "Generating flatpak list... " && ./flatpak-list.sh
echo "Generating package list... " && ./package-list.sh
echo "Generating repository list... " && ./repo-list.sh
