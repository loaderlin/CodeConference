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

用于日常开发，存放最新的开发版。

- release

当认为现在在master分支的代码已经是一个成熟的release版本时，这意味着：

1. 第一，它包括所有新的功能和必要的修复；
2. 第二，它已经被彻底的测试过了。

如果上述两点都满足，那就是时候开始生成一个新的release

> master分支被称作为长期分支。他们会存活在项目的整个生命周期中。而其他的分支，例如针对发行的分支(release)，仅仅只是临时存在的。它们是根据需要来创建的，当它们完成了自己的任务之后就会被删除掉。

### 版本管理各个分支的使用场景

举个栗子

中燃项目：每周二下午，下班前将上周修复的BUG和已完成的功能清单所有代码打包发布到EUT测试服务器上，让客户测试。这时就是从master分支创建并切换release分支上，以日期命名。

周三中午发布代码到生产服务器上。如果这时出现了上周已完成的功能出现错误(或已修复的BUG通过了自测但用户测试还是复现错误)，这时必须在release分支中修复，修复完成后，合并到master分支，并发布到生产服务器。

release分支通过测试后，合并到master分支中，继续在master分支上开发

这样既保证了在master分支上开发新功能，又不影响release分支版本的发布

### TortoiseSVN操作流程

在已有项目master分支中，创建release分支

![创建新分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/create_branch.png)

![创建release分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/create_release.png)

新建文件夹，存放release分支项目

![切换分支](https://raw.githubusercontent.com/loaderlin/CodeConference/master/img/checkout_release.png)

若发布后一段时间（这次发布起至下次发布止）出现错误，则在该分支中做修复。最后合并到master分支

--- 

未完待续