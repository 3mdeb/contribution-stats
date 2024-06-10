# SPDX-FileCopyrightText: 2023 3mdeb <contact@3mdeb.com>
#
# SPDX-License-Identifier: MIT

echo "Initialize repositories..."

DEFINITION="${args[--definition]}"

# Function to load repository definitions from a YAML file
load_repos_from_yaml() {
	local repo_directory="repo-def"

	# Check if the DEFINITION variable is set and non-empty
	if [[ -z "$DEFINITION" ]]; then
		echo "The DEFINITION variable is not set. Please specify a YAML file name."
		return 1
	fi

	# Find the full path to the desired definition YAML file
	local definition_file=$(find "$repo_directory" -type f -name "$DEFINITION.yaml" | head -n 1)

	# Check if the definition file was found
	if [[ -z "$definition_file" ]]; then
		echo "No YAML file named $DEFINITION.yaml found in $repo_directory."
		return 1
	fi

	# Declare the global associative array
	declare -g -A REPOS

	tmp=$(yaml_load "$definition_file")

	echo $tmp

	for i in $tmp; do
		# each $i has format reponame="URL"
		key=$(echo "$i" | cut -d= -f1)               # Extract the key up to the '='
		value=$(echo "$i" | cut -d= -f2 | tr -d '"') # Extract the value, remove enclosing quotes

		REPOS["$key"]="$value"
	done

	#Optionally: Display the loaded repository URLs
	for repo in "${!REPOS[@]}"; do
		echo "[\"$repo\"] = \"${REPOS[$repo]}\""
	done
}

load_repos_from_yaml

exit

echo "Syncing repositories..."

mkdir -p "${REPOS_DIR}"

if pushd "${REPOS_DIR}" &>/dev/null; then
	for repo in "${!REPOS[@]}"; do
		_dir="$repo"
		_url="${REPOS[$repo]}"

		echo $_dir
		if [ ! -d "$_dir" ]; then
			git clone "$_url" "$_dir"
		else
			(
				cd "$_dir" || exit
				git fetch origin
			)
		fi
	done
	popd &>/dev/null
fi
