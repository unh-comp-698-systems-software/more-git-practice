#!/bin/bash

. helpers.sh


A=$(new_branch_name)
B=$(new_branch_name)
C=$(new_branch_name)
D=$(new_branch_name)
E=$(new_branch_name)
F=$(new_branch_name)
G=$(new_branch_name)
H=$(new_branch_name)

echo "Branch A: $A"
echo "Branch B: $B"
echo "Branch C: $C"
echo "Branch D: $D"
echo "Branch E: $E"
echo "Branch F: $F"
echo "Branch G: $G"
echo "Branch H: $H"

git checkout master
git checkout -b $A
add_commit
add_commit
git tag 1.4.1
add_commit
add_commit
add_commit
add_commit
add_commit
git tag 1.4.2

git checkout master
git checkout -b $B
add_commit
add_commit
git checkout master
git checkout -b $C
add_commit

git checkout master
create_merge_conflict_both_add_file $D $E
git checkout $D
add_commit

git checkout master
create_merge_conflict_end_of_existing_file $F $G
git checkout $F
add_commit
git checkout $G
add_commit

git checkout master
git checkout -b $H
add_commit
FILE="$(new_file_name)"
word 10 > $FILE
commit_file $FILE
word 10 >> $FILE
commit_file $FILE "Undo this commit"
add_commit
add_commit
