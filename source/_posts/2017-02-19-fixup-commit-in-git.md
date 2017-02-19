---
title: Fixup a commit in git
tags: [git]
categories: [development]
description: How to fixup an already created commit with current modifications

---

Usually ( always ;) ) during development you realize that you would like to change something inherent a commit that you have already created.

Maybe you find an error, a typo or you just want to add something...

In such a case you can follow this procedure:

Add your changes to the staging area

`git add --all`

Take the hash of the commit you want to fixup from the logs

`git log --grep="My commit message"`

```
commit 049a19c......
Author: Gianluigi 'cocciagialla' Mammarella <cocciagialla@gmail.com>
Date:   Sun Feb 19 11:00:23 2017 +0100

My commit message
```

and then

`git commit --fixup 049a19c`

Now you have to rebase and squash your history.

To limit the commits showed in the rebase editor, find the hash of the previous commit of the which one you want to fix up,
here the hash will be `e4b0049`

`git rebase -i --autosquash e4b0049`

This command will open the editor and lists all your commits under till to `e4b0049`.

If you want to change the commit message, in the editor, type `reword` in place to `pick` and save and exit.
The editor will be reopened with the commit message that you can then edit. Save the editor again and exit

If you don't want to change the commit message, save and exit from the editor without any modification.

In the end you have to push (forcing) your modifications

`git push -f origin BRANCH_NAME`

As you are rewriting the branch's history, this procedure should be done ONLY on your development branches,
never do it on shared ones because another developer on the same branch would have great difficulty.

If you are developing your feature on only-your branch instead, then this is a GREAT way to keep commit ordered and consistent.