git merge -X theirs master

# https://stackoverflow.com/questions/2862590/how-to-replace-master-branch-in-git-entirely-from-another-branch
git branch -m master old-master
git branch -m check_curvefit master
git push -f origin master
