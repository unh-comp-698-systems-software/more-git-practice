#!/bin/bash

word () {
	COUNT=${1:-1}
	shuf -n 1000 /usr/share/dict/american-english | grep -v "'" | head -n $COUNT
}

commit_message () {
	word 3
}

current_branch () {
	git rev-parse --abbrev-ref HEAD
}

add_commit () {
	COUNT=${1:-1}
	mkdir -p $(current_branch)
	for i in $(seq 1 $COUNT); do
		FILE=$(new_file_name)
		echo $(word 10) >> "$(current_branch)/$FILE"
		git add "$(current_branch)/$FILE"
		git commit -m "$(commit_message)"
	done
}

commit_file () {
	FILE=$1
	MSG=${2:-$(commit_message)}
	git add $FILE
	git commit -m "$MSG"
}

create_merge_conflict_both_add_file () {
	BRANCH1=${1:-$(new_branch_name)}
	BRANCH2=${2:-$(new_branch_name)}

	FILE="$(new_file_name)"
	git checkout -b $BRANCH1
	git checkout -b $BRANCH2
	word 10 > $FILE
	commit_file $FILE "Creating file ${FILE}"
	git checkout $BRANCH1
	word 5 > $FILE
	commit_file $FILE "Creating file ${FILE}"
	>&2 echo "branches ($BRANCH1) and ($BRANCH2) both added $FILE"
}

create_merge_conflict_end_of_existing_file () {
	BRANCH1=${1:-$(new_branch_name)}
	BRANCH2=${2:-$(new_branch_name)}

	FILE="$(new_file_name)"
	git checkout -b $BRANCH1
	word 10 > $FILE
	commit_file $FILE "Creating file ${FILE}"
	git checkout -b $BRANCH2
	word 3 >> $FILE
	commit_file $FILE "Adding lines to the end of ${FILE}"
	git checkout $BRANCH1
	word 2 >> $FILE
	commit_file $FILE "Adding lines to the end of ${FILE}"
	>&2 echo "branches ($BRANCH1) and ($BRANCH2) both edited the end of $FILE"
}

new_file_name () {
	FILE="$(word).txt"
	while true; do
		git for-each-ref --format="%(refname:short)" refs/heads/$1\* | xargs -I {} git ls-tree -r {} --name-only | sort | uniq | grep $FILE
		if [ "$?" -eq "1" ]; then
			echo $FILE
			return
		fi
		FILE="$(word).txt"
	done
}

new_branch_name () {
	BRANCH=$(word)
	while true; do
		git branch | grep " $BRANCH$"
		if [ "$?" -eq "1" ]; then
			echo $BRANCH
			return
		fi
		BRANCH=$(word)
	done
}
