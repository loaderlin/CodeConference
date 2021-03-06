# 引言

版本控制就是对软件开发过程中所创建的配置对象不同版本进行管理，保证任何时间都可以取到正确的版本以及版本的组合。

版本控制的主要功能是记录开发过程中的每一次修改，让开发的工作可以随时检查过往历史记录和获得正确版本，是系统的成长记录。

# 目的

本文档的编制是为了规范发布人员、研发人员、测试人员对软件产品版本的管理。

# 范围

本文档为发布人员、研发人员、测试人员提供有关版本管理规范的相关内容，包括：

- 版本各个分支的简介和使用场景
- TortoiseSVN操作流程

# 版本管理

## 版本管理各个分支的简介

- master 

用于日常开发，存放最新的开发版。

- release

当认为现在在master分支的代码已经是一个成熟的release版本（可以发布）时，这意味着：

1. 第一，它包括所有新的功能和必要的修复；
2. 第二，它已经被彻底的测试过了。

如果上述两点都满足，那就是时候开始生成一个新的release

> master分支被称作为长期分支。他们会存活在项目的整个生命周期中。而其他的分支，例如针对发行的分支(release)，仅仅只是临时存在的。它们是根据需要来创建的，当它们完成了自己的任务之后就会被删除掉。

## 版本管理各个分支的使用场景

举个栗子

中燃项目：每周二下午，下班前将上周修复的BUG和已完成的功能清单所有代码打包发布到UAT测试服务器上，让客户测试。这时就是从master分支创建并切换release分支上，以日期命名。

周三中午发布代码到生产服务器上。之后的一段时间（从这周三到下周二）出现以下情况时使用到该分支

- 如果这时出现了上周已完成的功能出现错误
- 已修复的BUG通过了自测但用户测试还是复现错误
- 客户要求的紧急需求，完成后立即发UAT服务器上进行测试
- 新的BUG修复清单，需要在下周三之前完成

这时代码必须提交到release分支中，并再次发布。

release分支通过测试后，合并到master分支中（发布到生产服务器中）。

**这样既保证了在master分支上开发新功能，又不影响release分支版本的发布**

温馨提示

> 提交master分支上的代码最好是这一段时间（这周三到下周二）内能完成的，不然可能会影响到下次发布

## TortoiseSVN操作流程

### 创建分支

在已有项目master分支中，创建release分支

![创建新分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/create_branch.png)

![创建release分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/create_release.png)

新建文件夹，存放release分支项目

![切换分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/checkout_release.png)

若发布后一段时间（这次发布起至下次发布止）出现错误，则在该分支中做修复。最后合并到master分支

### 合并分支 

选择目标分支合并到当前所处分支。

在下次发布之前，测试上一次发布的所有功能和修复所有Bug后，将release分支的代码合并到master分支中。

切换到master分支中

![合并分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/merge-branch.png)

下一步

![下一步合并分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/next-merge-branch.png)

选择目标分支

![目标分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/target-branch.png)

测试合并是否存在冲突(没有冲突选择合并【Merge按钮】)

![测试合并](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/test-merge.png)

- 有冲突的情况下，

![合并时有冲突](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/merge-conflicts.png)

采用VS Code编辑器打开冲突文件

![手动修改传统](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/text-merge-conflicts.png)

- 没有冲突的情况下，再将合并过来的代码提交到master分支上

![提交代码](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/svn-log.png)

参考文档

[TortoiseSVN打分支、合并分支、切换分支](https://blog.csdn.net/justry_deng/article/details/82259470)

[SVN（TortoiseSVN）详细教程（四）--创建分支合并相互操作](https://blog.csdn.net/u013354805/article/details/48491427)

### IDEA SVN操作流程

待Tom完善

### Eclipse SVN操作流程

待Irving完善