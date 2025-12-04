#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

make -f /usr/share/selinux/devel/Makefile qbittorrent.pp
semodule -v -i qbittorrent.pp
semodule -B
restorecon -FRv /usr
