说明：
Vim配置自动加载，使用pathogen管理Vim插件
1. pathogen自身作为一个插件是一个git的submodule
2. 其他插件安装到bundle中，作为一个子模块目录即可

```shell
git submodule add https://github.com/altercation/vim-colors-solarized.git bundle/vim-colors-solarized
```

3. 下载与安装
sh ./deploy.sh

```
git submodule init 
git submodule update
```

4. 删除
rm -rf bundle/插件名
git rm -r bundle/插件名

