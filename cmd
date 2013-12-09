add from local

git reset --hard head^
git reset head file.md
git remote add origin https://github.com/shinchen/Sword2.git
git push -u origin master
git checkout -b dev

http://www.worldhello.net/gotgithub/04-work-with-others/010-fork-and-pull.html
git remote add gotgithub https://github.com/gotgithub/gotgit.git
git remote -v
git fetch gotgithub
git branch -a
git merge gotgithub/master
git log --graph -2
git push
