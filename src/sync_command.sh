# SPDX-FileCopyrightText: 2023 3mdeb <contact@3mdeb.com>
#
# SPDX-License-Identifier: MIT

echo "Syncing repositories..."

mkdir -p "${REPOS_DIR}"

if pushd "${REPOS_DIR}" &> /dev/null; then
    for repo in "${!REPOS[@]}"; do
        _dir="$repo"
        _url="${REPOS[$repo]}"

        echo $_dir
        if [ ! -d "$_dir" ]; then
            git clone "$_url" "$_dir"
        else
            ( cd "$_dir" || exit; git fetch origin )
        fi
    done
    popd &> /dev/null
fi
