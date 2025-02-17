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

load_repos_from_yaml() {
    local repo_directory="repo-def"

    # Check if the DEFINITION variable is set and non-empty
    if [[ -z "$DEFINITION" ]]; then
        echo "The DEFINITION variable is not set. Please specify a YAML file name."
        return 1
    fi

    # Declare the global associative array
    declare -g -A REPOS

    if [[ "$DEFINITION" == "all" ]]; then
        # Process all YAML files in the directory
        local yaml_files=("$repo_directory"/*.yaml)
        if [[ ${#yaml_files[@]} -eq 0 ]]; then
            echo "No YAML files found in $repo_directory."
            return 1
        fi

        for file in "${yaml_files[@]}"; do
            while IFS=" " read -r key value; do
                REPOS["$key"]="$value"
            done < <(yq -r '. | to_entries[] | "\(.key) \(.value)"' "$file")
        done
    else
        # Find the full path to the specified definition YAML file
        local definition_file=$(find "$repo_directory" -type f -name "$DEFINITION.yaml" | head -n 1)

        # Check if the definition file was found
        if [[ -z "$definition_file" ]]; then
            echo "No YAML file named $DEFINITION.yaml found in $repo_directory."
            return 1
        fi

        # Use yq to parse the YAML file and populate the REPOS array
        while IFS=" " read -r key value; do
            REPOS["$key"]="$value"
        done < <(yq -r '. | to_entries[] | "\(.key) \(.value)"' "$definition_file")
    fi

    # Optionally: Display the loaded repository URLs
    for repo in "${!REPOS[@]}"; do
        echo "[\"$repo\"] = \"${REPOS[$repo]}\""
    done
}
