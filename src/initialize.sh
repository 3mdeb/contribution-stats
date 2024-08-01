#
# SPDX-FileCopyrightText: 2023 3mdeb <contact@3mdeb.com>
#
# SPDX-License-Identifier: MIT

## Code here runs inside the initialize() function
## Use it for anything that you need to run before any other function, like
## setting environment variables:
## CONFIG_FILE=settings.ini
##
## Feel free to empty (but not delete) this file.
#

# vim formula for semiautomatic conversion of repositories into required format:
# s,https://gitlab.com/3mdeb/\(.*\),["\1"]="https://gitlab.com/3mdeb/\1",

REPOS_DIR="repos"
