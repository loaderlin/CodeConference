# CodeConference
发布相关配置


# 引言

版本控制就是对软件开发过程中所创建的配置对象不同版本进行管理，保证任何时间都可以取到正确的版本以及版本的组合。

版本控制的主要功能是记录开发过程中的每一次修改，让开发的工作可以随时检查过往历史记录和获得正确版本，是系统的成长记录。

# 目的

本文档的编制是为了规范发布人员、研发人员、测试人员对软件产品版本的管理。

# 范围

本文档为发布人员、研发人员、测试人员提供有关版本管理规范的相关内容，包括：

- 版本各个分支的简介和使用场景
- TortoiseSVN操作流程

## 版本管理

### 版本管理各个分支的简介

- master 

存放对外发布的版本，任何时候在这个分支拿到的，都是稳定的分布版；

不直接提交改动到master分支上也是很多工作流程的一个共同的规则。

- develop(dev)

用于日常开发，存放最新的开发版。

汇集所有已经完成的功能，并等待被整合到 master 分支中。

- hotfix

对master/release分支做内测或公测时，可能会出现一些BUG，这种情况下，切换出hotfix分支进行修复。

- release

当认为现在在develop分支的代码已经是一个成熟的release版本时，这意味着：

1. 第一，它包括所有新的功能和必要的修复；
2. 第二，它已经被彻底的测试过了。

如果上述两点都满足，那就是时候开始生成一个新的release


> master和develop这俩个分支被称作为长期分支。他们会存活在项目的整个生命周期中。而其他的分支，例如针对生产修复BUG的分支(hotfix)，针对发行的分支(release)，仅仅只是临时存在的。它们是根据需要来创建的，当它们完成了自己的任务之后就会被删除掉。

### 版本管理各个分支的使用场景

举个栗子

中燃项目：每周二下午，下班前将上周修复的BUG和已完成的功能清单所有代码打包发布到EUT测试服务器上，让客户测试。这时就是从develop分支创建并切换release分支上，以日期命名。

周三中午发布代码到生产服务器上。如果这时出现了上周已完成的功能出现错误(或已修复的BUG通过了自测但用户测试还是复现错误)，这时从release分支创建并切换到新的分支(hotfix)，在hotfix分支修复BUG，修复完成后，合并到release分支(删除hotfix分支)，延后发布到生产环境。

release分支通过测试后，合并到develop分支中，继续在develop分支上开发

这样既保证了在develop分支上开发新功能，又不影响release分支版本的发布

### TortoiseSVN操作流程

[TortoiseSVN打分支、合并分支、切换分支](https://blog.csdn.net/justry_deng/article/details/82259470)

[SVN（TortoiseSVN）详细教程（四）--创建分支合并相互操作](https://blog.csdn.net/u013354805/article/details/48491427)

### 参考文献

[Linux服务器上搭建svn服务器](https://www.jianshu.com/p/e7037e010635)


[Linux搭建SVN 服务器](https://my.oschina.net/lionel45/blog/298305)

[搭建SVN服务器详细教程](https://blog.csdn.net/daobantutu/article/details/60467185)

[git-flow的工作流程-GitTower](https://www.git-tower.com/learn/git/ebook/cn/command-line/advanced-topics/git-flow)

[Git 工作流程](http://www.ruanyifeng.com/blog/2015/12/git-workflow.html)

