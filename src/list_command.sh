# SPDX-FileCopyrightText: 2023 3mdeb <contact@3mdeb.com>
#
# SPDX-License-Identifier: MIT

START_DATE="${args[--date]}"
REPO="${args[--repo]}"
OUTPUT_FILE=$(readlink -f "${args[--out]}")

list_single_repo() {
    _repo="${1}"

    if pushd "${REPOS_DIR}/${_repo}" &> /dev/null; then
        # Each commit will be presented in a similar pattern:
        #
        #__COMMIT_START__
        # b2f5a22c4a3f;Karol Zmyslowski;karol.zmyslowski@3mdeb.com;04/21/2023;util/inteltool: Add support for Jasper Lake
        # util/inteltool: Add support for Jasper Lake
        #
        # Tested on: Intel N5105 (Jasperlake Family, Intel Celeron processor)
        # Based on Intel Pentium Silver and Intel Celeron Processor Datasheet,
        #         vol. 2 of 2 revision 001 (DOC# 634545)
        #
        # Change-Id: If4134bd03f5544b5845cde998ee526e5ddd5b51d
        # Signed-off-by: Karol Zmyslowski <karol.zmyslowski@3mdeb.com>
        # Reviewed-on: https://review.coreboot.org/c/coreboot/+/73934
        # Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
        # Reviewed-by: Michał Żygowski <michal.zygowski@3mdeb.com>
        #
        # __COMMIT_END__
        #  6 files changed, 682 insertions(+)
        #
        LOG_FORMAT="__COMMIT_START__%n%h;%aN;%ae;%cd;%s%n%B%n__COMMIT_END__"
        DATE_FORMAT="%m/%d/%Y"

        echo "Listing contributions for: ${_repo}, after: ${START_DATE}"

        # Use git log with a custom format to extract necessary information
        # and then filter by 3mdeb.com email domain. If 3mdeb.com domain is present,
        # process via awk to extract insertions/deletaions numbers. Additionally,
        # extract the link do Gerrit, if "Reviewed-on:" tag was present in the commit
        # body.
        git log --pretty=format:"${LOG_FORMAT}" \
                --date=format:"${DATE_FORMAT}" \
                --author=@3mdeb.com \
                --shortstat \
                --no-merges \
                --after=${START_DATE} \
                --all |
        awk -F'[;]' -v repo="${_repo}" '
            /__COMMIT_START__/ {
                getline
                commit = $1
                author = $2
                date = $4
                subject = $5
                reviewed_on = ""
                getline
                while ($0 != "__COMMIT_END__") {
                    if (match($0, /Reviewed-on: (.*)/, m)) {
                        reviewed_on = m[1]
                    }
                    getline
                }
                next
            }
            /files? changed/ {
                if (match($0, /([0-9]+) insertion/, m)) insertions = m[1]
                if (match($0, /([0-9]+) deletion/, m)) deletions = m[1]
                printf "%s;%s;%s;%s;%s;%d;%d;%s\n", commit, author, date, repo, reviewed_on, insertions, deletions, subject
                insertions = deletions = 0
                reviewed_on = ""
            }
        ' >> "${OUTPUT_FILE}"

        # Example output entry looks like follows:
        # 97fe17ff5984;Sergii Dmytruk;11/19/2022;https://review.coreboot.org/c/coreboot/+/68746;30;6
        #
        popd &> /dev/null
    fi
}

list_all_repos() {
   for repo in "${!REPOS[@]}"; do
       _dir="$repo"
       _url="${REPOS[$repo]}"

       list_single_repo "${_dir}"
   done
}

rm -f "${OUTPUT_FILE}"

if [ -z "${REPO}" ]; then
    echo "Listing contributions for all tracked repositories..."
    list_all_repos
else
    echo "Listing contributions for only selected repository: ${REPO}..."
    list_single_repo "${REPO}"
fi
