# 拉指定分支
git clone -b develop git@github.com:HireTeamMate/ranking-engine.git
git clone -b shpf/aisourcing git@github.com:HireTeamMate/ranking-engine.git

# 已有分支拉新分支, remote branch
# 新建分支
git checkout -b new_branch
git push origin new_branch
git pull origin new_branch
git push --set_upstream origin new_branch

# 删除分支
删除本地分支
git branch -d branch_name  > not fully merged 
git branch -D branch_name
删除远程分支
git fetch --prune
git branch -a
git push origin --delete (origin/)test # 不需要origin


# bug 分支, 重复的bugfix
git cherry-pick 4c805e2

# feature 分支, 
git switch -c feature-vulcan
    Switched to a new branch 'feature-vulcan'

git add
git status
git commit

git switch dev
# 弃一个没有被合并过的分支，可以通过git branch -D <name>强行删除


# 开发过程中, 定期更新
git pull --rebase origin develop
# conflict == > 解决冲突
git add .
git rebase --continue
git push -f

<!-- 多人合作 -->
# others 创建本地dev分支
git checkout -b dev origin/dev
git add
git commit
git push origin dev

# myself 后推送
git branch --set-upstream-to=origin/dev dev
    branch 'dev' set up to track remote branch 'dev' from 'origin'.
git pull    (confict solve)
git commit -m "fix ..."
git push origin dev

<!-- 
查看远程库信息，使用git remote -v；
本地新建的分支如果不推送到远程，对其他人就是不可见的；
从本地推送分支，使用git push origin branch-name，如果推送失败，先用git pull抓取远程的新提交；
在本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branch-name，本地和远程分支的名称最好一致；
建立本地分支和远程分支的关联，使用git branch --set-upstream branch-name origin/branch-name；
从远程抓取分支，使用git pull，如果有冲突，要先处理冲突。
-->

<!-- Rebase -->


# release tag 基础上修改
1) 根据tag创建分支
    git checkout -b branchname tags/v0.3.7

2) 提交更改的code 
	git add .
	git commit -m "Fix included"
    或者使用 cherry-pick 合并一个commit
	git cherry-pick  {commitid}
	
3) 删除本地tag，并重新创建该tag
	git tag -d {tagname}
	git tag {tagname}

4) 删除远程tag，并push code重新生成远程tag
	git push origin --delete {tagname} // deletes original remote tag
	git push origin {tagname} // creates new remote tag
		
5)  Update local repository with the updated tag
	git fetch --tags


# 合并 多个commit
git rebase -i HEAD~3
git push -f 



# 合并 间隔的commit
git rebase -i commitID (被merge的id)
# vim
pick commitID
s (需要提前的)
# 
git rebase --continue