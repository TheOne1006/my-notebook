# LoRA


## 概念

### Low-Rank Adaptation（低秩适用）

- 一种微调扩散模型的方式
- 意义：降低训练门槛、扩宽了产出的使用模型
- 与 Dreambooth 方式的区别？
- 搭配 checkpoint 使用

### models/Lora 目录




### 功能

- 特定形象的描摹
- 对特定视觉风格的实现
- 某种特点元素 容易画面, (eg: 服饰、姿势)

## 下载的地址


## 三种方式调用 LoRa

### 方法一 提示词

-  尖括号`<>` + `Lora` + 文件名 + 权重
- eg: `<Lora:KeQing3in1:0.5>`

### 方法二 附加模型选单

- 选项 -> Lora 点击选中目标模型

### 方法三 Additional Networks

- 需要扩展: Koohya-ss Additional Networks
- x生图 - 可折叠选单
- 文件地址：不同于之前，在 models/Lora 中，需要将其添加到配置中
- 支持最多 5 个


### 一般权重 0~1


## LoRA 的应用方向


#### 人物形象 Character

- 赛博 coser = 真实系大模型 + 角色 LoRA

#### 画风 Style
#### 概念 Concept
#### 服饰 Cloth/Costume
#### 物体、特定元素 Object



