![logo](http://i.imgur.com/Z4iPSgQ.png) GNVM - Node.js 多版本管理器
================================
[![ci][ci-badge]][ci-link]
[![Version][version-badge]][version-link]

从 [Kenshin/gnvm](https://github.com/Kenshin/gnvm "") fork 而来。
#### `GNVM` 是一个简单的 `Windows` 下 Node.js 多版本管理器，类似的 `nvm` `nvmw` `nodist` 。
```
c:\> gnvm install latest 1.0.0-x86 1.0.0-x64 5.0.0
Start download Node.js versions [5.10.1, 1.0.0, 1.0.0-x86, 5.0.0].
5.10.1: 18% [=========>__________________________________________] 4s
 1.0.0: 80% [==========================================>_________] 40s
1.0...: 50% [==========================>_________________________] 30s
 5.0.1: 100% [==================================================>] 20s
End download.

c:\> gnvm ls
5.1.1 -- latest
1.0.0
1.0.0 -- x86
5.0.0 -- global

c:\> gnvm use latest
Set success, current Node.js version is 5.10.0.

c:\> gnvm update latest
Update success, current Node.js latest version is 5.10.0.
```

特色
---
* 单文件，不依赖于任何环境。
* 下载即用，无需配置。
* 彩色日志输出。
* 支持多线程下载。
* 内置 [TAOBAO](http://npm.taobao.org/mirrors/node), [TUNA](https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/), [OpenTuna](https://opentuna.cn/nodejs-release/), [USTC](https://mirrors.ustc.edu.cn/node/), 方便切换，也支持自定义。
* 支持 `NPM` 下载/安装/配置。

文档
---
[English](https://github.com/fallenwood/gnvm/blob/master/README.en.md)

下载
---
* [Github](https://github.com/fallenwood/gnvm/releases "")

安装
---
* 不存在 Node.js 环境
  > 下载并解压缩 `gnvm.exe` 保存到任意文件夹，并将此文件夹加入到环境变量 `Path` 。

* 存在 Node.js 环境
  > 下载并解压缩 `gnvm.exe` 保存到 `Node.js` 所在的文件夹。

验证
---
* 在 `cmd` 下，输入 `gnvm version`，输出 `版本说明` 则配置成功。

功能
---
```
config       配置 .gnvmrc
use          使用某个本地已存在的 Node.js 版本
ls           输出 [local] [remote] Node.js 版本
install      下载/安装任意已知版本的 Node.js
uninstall    删除任意本地已存在的 Node.js
update       下载 Node.js latest 版本并更新到 .gnvmrc 里面
npm          NPM 下载/安装/删除 管理
session      临时设定本地某个已存在的 Node.js 为 全局 Node.js
search       查询并且输出符合查询条件的 Node.js 版本详细信息的列表
node-version 输出 [global] [latest] Node.js 版本
reg          设定 .gnvmrc 属性值 [noderoot] 为 环境变量 [NODE_HOME]，并加入到 Path 中
version      查看 gnvm 版本
```
![功能一览](http://i.imgur.com/E7MvvQv.png)

术语
---
* `global`   当前使用的 `Node.js` 。
* `latest`   稳定版本的 `Node.js` 。
* `session`  当前 `cmd` 所对应的环境。（临时环境）
* `.gnvmrc`  `gnvm`配置文件，无需手动建立，其中保存了 `本地` / `远程` Node.js 版本信息等。
    - `registry` 下载 `node.exe` 所对应的库，默认为 [DEFAULT](http://nodejs.org/dist/)，可以更换为 [TAOBAO](http://npm.taobao.org/mirrors/node)，也支持自定义。（**自定义库的结构需要保持一致。**）
    - `noderoot` 保存了全局 `Node.js` 所在的目录。（也是 `gnvm.exe` 所在的目录。）

入门指南
---
> `gnvm.exe` 是一个单文件 exe，无需任何配置，直接使用。

**.gnvmrc**

```
globalversion: 5.0.1
latestversion: 5.10.1
noderoot: /Users/kenshin/Work/28-GO/01-work/src/gnvm
registry: http://npm.taobao.org/mirrors/node/
```

**更换更快的库 registry**
  > `gnvm.exe` 内建了 [DEFAULT](http://nodejs.org/dist/) 和 [TAOBAO](http://npm.taobao.org/mirrors/node) 两个库。

```
gnvm config registry TAOBAO
```

**安装 多个 Node.js**
  > 安装任意版本的 Node.js 包括： 自动匹配 `latest` version 以及 选择 32 / 64 位，例如 `x.xx.xx-x64` 。

```
gnvm install latest 1.0.0-x86 1.0.0-x64 5.0.0
```

**卸载本地任意 Node.js 版本**
```
gnvm uninstall latest 1.0.0-x86 1.0.0-x64 5.0.0
```

**切换本地存在的任意版本 Node.js**
```
gnvm use 5.10.1
```

**列出本地已存在的全部 Node.js 版本**
```
c:\> gnvm ls
5.1.1 -- latest
1.0.0
1.0.0 -- x86
5.0.0 -- global
```

**更新本地的 Node.js latest 版本**
```
gnvm update latest
```

**安装 NPM**
  > `gnvm` 支持安装 `npm`, 例如：下载最新版的 npm version ，使用 `gnvm npm latest` 。

```
gnvm npm latest
```

**查询 Node.js 版本**
  > 可以使用关键字 `*` 或者 正则表达式 `/regxp/`，例如： `gnvm search 5.*.*` 或者 `gnvm search /.10./` 。

```
c:\> gnvm search 5.*.*
Search Node.js version rules [5.x.x] from http://npm.taobao.org/mirrors/node/index.json, please wait.
+--------------------------------------------------+
| No.   date         node ver    exec      npm ver |
+--------------------------------------------------+
1     2016-04-05   5.10.1      x86 x64   3.8.3
2     2016-04-01   5.10.0      x86 x64   3.8.3
3     2016-03-22   5.9.1       x86 x64   3.7.3
4     2016-03-16   5.9.0       x86 x64   3.7.3
5     2016-03-09   5.8.0       x86 x64   3.7.3
6     2016-03-02   5.7.1       x86 x64   3.6.0
7     2016-02-23   5.7.0       x86 x64   3.6.0
+--------------------------------------------------+
```

例子
---
**1. 不存在 Node.js 环境时，下载 Node.js latest version 并设置为全局 Node.js 。**
```
c:\> gnvm config registry TAOBAO
Set success, registry new value is http://npm.taobao.org/mirrors/node/
c:\> gnvm install latest -g
Notice: local  latest version is unknown.
Notice: remote latest version is 5.10.1.
Start download Node.js versions [5.10.1].
5.10.1: 100% [==================================================>] 13s
End download.
Set success, latestversion new value is 5.10.1
Set success, global Node.js version is 5.10.1.
```

**2. 升级本地 Node.js latest 版本。**
```
c:\> gnvm config registry TAOBAO
Set success, registry new value is http://npm.taobao.org/mirrors/node/
c:\> gnvm update latest
Notice: local  Node.js latest version is 5.9.1.
Notice: remote Node.js latest version is 5.10.1 from http://npm.taobao.org/mirrors/node/.
Waring: remote latest version 5.10.1 > local latest version 5.9.1.
Waring: 5.10.1 folder exist.
Update success, Node.js latest version is 5.10.1.
```

**3. 查看本地 Node.js global and latest 版本。**
```
c:\> gnvm node-version
Node.js latest version is 5.10.1.
Node.js global version is 5.10.1.
```

**4. 验证 .gnvmrc registry 正确性。**
```
c:\> gnvm config registry test
Notice: gnvm config registry http://npm.taobao.org/mirrors/node/ valid ................... ok.
Notice: gnvm config registry http://npm.taobao.org/mirrors/node/index.json valid ......... ok.
```

**5. 本地不存在 NPM 时，安装当前 Node.js 版本对应的 NPM 版本。**
```
c:\ gnvm npm global
Waring: current path C:\xxx\xxx\nodejs\ not exist npm.
Notice: local    npm version is unknown
Notice: remote   npm version is 3.8.3
Notice: download 3.8.3 version [Y/n]? y
Start download new npm version v3.8.3.zip
v3.8.3.zip: 100% [==================================================>] 4s
Start unzip and install v3.8.3.zip zip file, please wait.
Set success, current npm version is 3.8.3.
c:\> npm -v
3.8.7
```

**6. 安装 NPM latest 版本。**
```
c:\ gnvm npm laltest
Notice: local    npm version is 3.7.3
Notice: remote   npm version is 3.8.7
Notice: download 3.8.7 version [Y/n]? y
Start download new npm version v3.8.7.zip
v3.8.7.zip: 100% [==================================================>] 3s
Start unzip and install v3.8.7.zip zip file, please wait.
Set success, current npm version is 3.8.7.
c:\> npm -v
3.8.7
```

依赖
---
* <https://github.com/Kenshin/cprint>
* <https://github.com/Kenshin/regedit>

第三方包
---
* <https://github.com/spf13/cobra>
* <https://github.com/tsuru/config>
* <https://github.com/pierrre/archivefile>
* <https://github.com/daviddengcn/go-colortext>
* <https://github.com/bitly/go-simplejson>

下一步
---
- [ ] 增加 `HTTP_PROXY` 。
- [ ] 自动升级，例如 `gnvm upgrad` .
- [ ] `gnvm.exe` 增加 `Chocolatey` 方案。
- [ ] 支持多系统。（ `MAC`, `Linux` ）

相关链接
---
* [更新日志](https://github.com/fallenwood/gnvm/blob/master/CHANGELOG.md)
* [反馈](https://github.com/fallenwood/gnvm/issues)

感谢
---
* 图标来自 <http://www.easyicon.net> 。
* 页面设计参考 [You-Get](https://you-get.org/) 。

许可
---
[![license-badge]][license-link]

<!-- Link -->
[ci-badge]:         https://github.com/fallenwood/gnvm/actions/workflows/master.yml/badge.svg
[ci-link]:          https://github.com/fallenwood/gnvm/actions/workflows/master.yml
[version-badge]:    https://img.shields.io/badge/lastest_version-0.2.2-blue.svg
[version-link]:     https://github.com/fallenwood/gnvm/releases
