<h1 align="center">ArknightsResource</h1>
<p align="center">
<a href="/README.md" target="_blank"> English </a> | <a href="/README_CN.md" target="_blank">中文</a>
</p>

### Note: For gamedata only, please refer to [ArknightsGamedataPure](https://github.com/closure-studio/ArknightsGamedataPure)

> 2025.04.13 Repository Update: Deprecated incremental image uploads in favor of LFS mode.
>
> 2025.04.13H Temporary Unavailability Notice: Forgot GitHub's 1GB LFS limit while accustomed to HuggingFace :(. Rolled back to standard git file mode after bug fixes in the afternoon. This force operation may require users to re-clone the repository. Our apologies for the inconvenience.

# **0x00 Legal Notice**  

### **All files contained in this project are copyrighted by Hypergryph Network Technology Co., Ltd. This project is solely for educational and research purposes. Please contact us for any copyright concerns.**  

## **0x01 Project Description**  

Arknights gamedata and resource parser  
Automated gamedata & resource parsing system powered by ArkResourceAutoUpdateBot

## **0x02 Directory Structure**  

| Directory        | Type       | Description                                                               |
|------------------|------------|---------------------------------------------------------------------------|
| avatar           | Avatars    | Contains DEFAULT avatar set and ASSISTANT portrait set (operator profile) |
| avgs             | Story AVG  | All story AVG backgrounds, NPCs (Note 1), and items                       |
| brand            | Apparel    | Clothing brand icons                                                      |
| camplogo         | Factions   | Operator faction icons                                                    |
| charpack         | Full Art   | Operator full illustrations (b-suffixed for low-res)                      |
| charpor          | Portraits  | Operator busts (for profile/gacha simulator)                              |
| clue             | Clues      | Seven clue icons                                                          |
| enemy            | Enemies    | Enemy gallery (square format)                                             |
| gacha            | Gacha      | Gacha banners (*_full for originals, other for simulator)                 |
| gamedata         | Game Data  | Core gamedata (Note 2)                                                    |
| items            | Items      | Framed item icons                                                         |
| kvimg            | Promo Art  | Costume display images                                                    |
| mapreview        | Maps       | PRTS map previews                                                         |
| medal            | Medals     | Medal sets (Note 3)                                                       |
| skills           | Skills     | Operator skill icons (square)                                             |
| spine            | Spine      | Operator spine files (atlas/skel/material.png) (Note 4)                   |
| map_camera_views | CameraView | Map camera positioning (Note 5)                                           |
 
- 注5：map_camera_views中summary.json为全解析数据，maps.json为适配[MaaResource](https://github.com/MaaAssistantArknights/MaaResource)的[地图信息](https://github.com/MaaAssistantArknights/MaaResource/tree/main/resource/Arknights-Tile-Pos)处理的数据文件，可以使用[levels_split_gen.py](https://github.com/yuanyan3060/ArknightsGameResource/blob/main/levels_split_gen.py)和gamedata生成对应关卡数据用于MAA作战数据
- Note 1: avg/npcs/summary.json contains consolidated NPC data
- Note 2: Official CN server data, compatible with flatbuffer format (v2.0.01+)
- Note 3: /raw for original medal sets, /group for merged sets
- Note 4: Spine PNGs are pre-optimized for Spine viewer (fixed the abnormal image size issue)
- Note 5: summary.json contains full parsed data, maps.json is formatted for [MaaResource](https://github.com/MaaAssistantArknights/MaaResource)'s [pos tile data](https://github.com/MaaAssistantArknights/MaaResource/tree/main/resource/Arknights-Tile-Pos). Use [levels_split_gen.py](https://github.com/yuanyan3060/ArknightsGameResource/blob/main/levels_split_gen.py) with gamedata to generate MAA combat data.

## **0x03 Roadmap**
> The current dataset generally meets the requirements. For any additional needs in the future, please feel free to submit new issues.

## **0x04 Special Thanks**
- [Closure Studio](https://github.com/closure-studio/) ~~Behold my 512GB beast~~
- [OpenArknightsFBS](https://github.com/MooncellWiki/OpenArknightsFBS) ~~For quick diff references~~
- [MaaAssistantArknights](https://github.com/MaaAssistantArknights/MaaAssistantArknights) ~~Docta, go take a rest~~
- [ArknightsGameResource](https://github.com/yuanyan3060/ArknightsGameResource) ~~It's Teddy, we're doomed (lol)~~
- [DICE-LAB](https://github.com/DICE-LAB-SYX) ~~Slacking off~~