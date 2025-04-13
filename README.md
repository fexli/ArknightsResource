# ArknightsResource  
> 2025.04.13 仓库维护说明：弃用旧版图像资源增量上传，变更为lfs模式。
>
> 2025.04.13H 仓库临时不可用说明：用久了huggingface忘记github的LFS有1GB限制了。。13日中~下午修完bug后回滚回正常的git file模式。 因该操作为force操作，因此可能需要各位用户重新clone，为此抱歉（）

## **0x00 声明**  

### **本项目所涉及的所有项目内文件版权均属上海鹰角网络科技有限公司所有，项目建立仅用于学习交流，若侵权请联系。**  

### **All files involved in this project are copyrighted by Hypergryph Network Technology co., Ltd. The project is only established for learning and communication purposes. If any infringement occurs, please contact us.**  

## **0x01 说明**  

《明日方舟》游戏数据与常用资源解析  
基于ArkResourceAutoUpdateBot的自动化游戏数据&常用资源解析  

## **0x02 目录解释**  

|目录|类型| 说明                                        |
|----|----|-------------------------------------------|
|avatar|头像源文件| 包含DEFAULT默认头像集和ASSISTANT助手头像集(干员简介页)      |
|avgs|AVG背景图| 包含全部AVG、BG、NPC(*)、剧情Items等图像源文件           |
|brand|服装品牌| 服装品牌图标                                    |
|camplogo|阵营| 干员阵营所属图标                                  |
|charpack|干员立绘| 干员立绘(其中带b为低分辨率图)                          |
|charpor|干员半身像| 干员半身像(干员页、抽卡模拟)                           |
|clue|线索图像| 七个线索图像                                    |
|enemy|敌人图鉴| 敌人图鉴(正方形)                                 |
|gacha|卡池图鉴| 卡池图像(分为_full整图和解析抽卡图，用于抽卡模拟器)             |
|gamedata|游戏基础数据| 游戏gamedata(**)                            |
|items|物品| 带框游戏物品图标                                  |
|kvimg|KV广告图| 服装展示图像                                    |
|mapreview|地图预览图| PRTS地图预览图                                 |
|medal|蚀刻章| 蚀刻章与蚀刻章组图(***)                            |
|skills|技能图标| 干员技能图标(正方形)                               |
|spine|干员spine| 干员spine文件，包括atlas/skel/material.png（****） |

注：  
- \*:avg/npcs中包含summary.json为全部npc合并文件介绍，导出有bug临时禁用
- \*\*:gamedata为官服数据，已适配新版(2.0.01及以后)flatbuffer全部数据
- \*\*\*:蚀刻章下分为raw蚀刻章套组图、group合并后的蚀刻章套组图
- \*\*\*\*:spine中png的图像大小已经过处理，可以直接导入Spine查看器使用

## **0x03 后续计划**

- 修复avgs npc face数据
- 支持enemy spine
- 支持recruit更新
- ???...