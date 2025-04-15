<h1 align="center">ArknightsResource</h1>
<p align="center">
<a href="/README.md" target="_blank"> English </a> | <a href="/README_CN.md" target="_blank">中文</a>
</p>

### 注：若只需要获取gamedata数据，可参考[ArknightsGamedataPure](https://github.com/closure-studio/ArknightsGamedataPure)

> 2025.04.13 仓库维护说明：弃用旧版图像资源增量上传，变更为lfs模式。
>
> 2025.04.13H 仓库临时不可用说明：用久了huggingface忘记github的LFS有1GB限制了。。13日中~下午修完bug后回滚回正常的git file模式。 因该操作为force操作，因此可能需要各位用户重新clone，为此抱歉（）

## **0x00 声明**  

### **本项目所涉及的所有项目内文件版权均属上海鹰角网络科技有限公司所有，项目建立仅用于学习交流，若侵权请联系。**  

## **0x01 说明**  

《明日方舟》游戏数据与常用资源解析  
基于ArkResourceAutoUpdateBot的自动化游戏数据&常用资源解析  

## **0x02 目录解释**  

|目录| 类型      | 说明                                      |
|----|---------|-----------------------------------------|
|avatar| 头像源文件   | 包含DEFAULT默认头像集和ASSISTANT助手头像集(干员简介页)    |
|avgs| AVG背景图  | 包含全部AVG、BG、NPC（注1）、剧情Items等图像源文件        |
|brand| 服装品牌    | 服装品牌图标                                  |
|camplogo| 阵营      | 干员阵营所属图标                                |
|charpack| 干员立绘    | 干员立绘(其中带b为低分辨率图)                        |
|charpor| 干员半身像   | 干员半身像(干员页、抽卡模拟)                         |
|clue| 线索图像    | 七个线索图像                                  |
|enemy| 敌人图鉴    | 敌人图鉴(正方形)                               |
|gacha| 卡池图鉴    | 卡池图像(分为_full整图和解析抽卡图，用于抽卡模拟器)           |
|gamedata| 游戏基础数据  | 游戏gamedata（注2）                          |
|items| 物品      | 带框游戏物品图标                                |
|kvimg| KV广告图   | 服装展示图像                                  |
|mapreview| 地图预览图   | PRTS地图预览图                               |
|medal| 蚀刻章     | 蚀刻章与蚀刻章组图（注3）                           |
|skills| 技能图标    | 干员技能图标(正方形)                             |
|spine| 干员spine | 干员spine文件，包括atlas/skel/material.png（注4） |
|map_camera_views| 地图观测定位  | 地图相机位置（注5）                              |
 
- 注1：avg/npcs中包含summary.json为全部npc合并文件介绍
- 注2：gamedata为官方国服数据，已适配新版(2.0.01及以后)flatbuffer全部数据
- 注3：蚀刻章下分为raw蚀刻章套组图、group合并后的蚀刻章套组图
- 注4：spine中png的图像大小已经过处理，可以直接导入Spine查看器使用
- 注5：map_camera_views中summary.json为全解析数据，maps.json为适配[MaaResource](https://github.com/MaaAssistantArknights/MaaResource)的[地图信息](https://github.com/MaaAssistantArknights/MaaResource/tree/main/resource/Arknights-Tile-Pos)处理的数据文件，可以使用[levels_split_gen.py](https://github.com/yuanyan3060/ArknightsGameResource/blob/main/levels_split_gen.py)和gamedata生成对应关卡数据用于MAA作战数据
## **0x03 后续计划**
> 目前数据已基本满足需求，后续如有任何新需求也欢迎提issue

- 内置levels_split_gen.py生成leveldata与overview
- 支持enemy spine
- 支持recruit更新
- ???...

## **0x04 Special Thanks**
- [Closure Studio](https://github.com/closure-studio/) ~~快看我512G大母鸡~~
- [OpenArknightsFBS](https://github.com/MooncellWiki/OpenArknightsFBS) ~~偷懒的时候直接抄一抄diff~~
- [MaaAssistantArknights](https://github.com/MaaAssistantArknights/MaaAssistantArknights) ~~博士，快去睡觉~~
- [ArknightsGameResource](https://github.com/yuanyan3060/ArknightsGameResource) ~~是泰迪，我们丸辣(雾)~~
- [DICE-LAB](https://github.com/DICE-LAB-SYX) ~~摸鱼中~~