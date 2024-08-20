# **从国产嘉立创EDA移植3D封装到[Cadence Allegro]**



> 我们不制作3D模型，我们是互联网的搬运工。——X夫山泉
>
> 3D模型文件的获取途径并不唯一，可以是元件供应商的官网，也可以是3D资源库等，本文简单介绍了如何将嘉立创的3D模型移植到Cadence Allegro的元件封装中。
>
> 2024/01/03



## 一、嘉立创EDA专业版

> 这是一款免费的国产EDA软件，有丰富的元件库并带有3D模型，可以在线使用，这里更推荐下载到本地使用，方便后续移植3D封装到Allegro。

[点击访问🚀国产嘉立创EDA - 一个用心为中国人定制的电路板开发平台 (lceda.cn)](https://pro.lceda.cn/)

### 软件下载

![image-20240103181607581](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401031816929.png)

<center>▲点击下载客户端</center>

---

![image-20240103181947180](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401031819263.png)

<center>▲ 下载Windows版【嘉立创EDA专业版】</center>

---

### 注册激活

> 可以看官方教程，这里不再赘述—>[点击访问🚀立创EDA专业版-使用教程 (lceda.cn)](https://prodocs.lceda.cn/cn/faq/client/index.html)

---

### 如何导出3D模型

► 新建工程

![image-20240104202055890](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042020958.png)

---

<div STYLE="page-break-after: always;"></div>

► 默认保存

![image-20240104202321301](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042023425.png)

---

► 打开原理图

![image-20240104202845157](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042028252.png)

---

<div STYLE="page-break-after: always;"></div>

► 放置器件

![image-20240104213135906](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042131011.png)

---

►在弹出窗口中选择你要的器件，点击【放置】

PS：可根据条件筛选，引脚/尺寸等参数符合原理图库现有封装参数即可，找不到的话可以到元件供应商的官网碰碰运气

![image-20240104214342396](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042143499.png)

---

<div STYLE="page-break-after: always;"></div>

►更新/转换原理图到PCB

![image-20240104215344704](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042153799.png)

---

►点击3D预览，在此之前，可以点击【工具】——【测量距离】，核实一下引脚的间距，避免做无用功

![image-20240104215952448](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042159554.png)

---

<div STYLE="page-break-after: always;"></div>

►导出3D文件，在弹出菜单中点击【导出】，**文件类型默认为STEP**

![image-20240104220756747](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042207856.png)

---

---

## 二、SOLIDWORKS_20xx

### 软件下载

> 下面是软件链接和教程，这里我安装的是2021版本的

[SolidWorks 2018安装教程 (qq.com)](https://mp.weixin.qq.com/s/DSvh3Hj00rOusU6Y78q6zg)

[SolidWorks 2019安装教程 (qq.com)](https://mp.weixin.qq.com/s/eVcnTJrHj_QgJSTXXkM-Bw)

[SolidWorks 2020安装教程 (qq.com)](https://mp.weixin.qq.com/s/gYV8FJyK7M-P0XgDapmmDA)

[SolidWorks 2021安装教程 (qq.com)](https://mp.weixin.qq.com/s/Gih3RTgYWvDLB-F_dHkYpg)



PS：不一定是SW，用其他能够编辑3D模型，且能够导出STEP AP214格式的软件也可以实现。

试过Fusion360，它出的step格式的3D文件Cadence识别不了，因此不推荐。

---

<div STYLE="page-break-after: always;"></div>

### 操作步骤

►打开刚刚下载好的3D封装

![image-20240104222439711](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042224759.png)

---

►选择操作对象【3D_PCB1_xxxx-xx-xx】，右键点击，在弹出的菜单中选择【断开链接】——【断开零部件链接】

![image-20240104223750831](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042237932.png)

---

<div STYLE="page-break-after: always;"></div>

►展开3D模型后，右键点击【（固定）Board<1>】，在弹出菜单中点击【删除】——【仅删除选定的零部件】——【是】，即可去除来自嘉立创EDA的3D模型自带的PCB底板，得到独立的元件模型

![image-20240104224933843](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042249942.png)

---

►点击【另存为】

![image-20240104225805313](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042258415.png)

---

►在弹出的菜单中将【保存类型】设置为`STEP AP214`格式

这是目前Cadence16.6支持的格式，可以同时将模型的颜色也一起渲染出来，效果更好

3D模型的命名可以根据封装的属性来，比如具体的元件类型，芯片封装方式，引脚数目，引脚间距等，方便后期维护（增补同封装不同参数的其他元件）

```c
Connector_96pin_254_male.step//如96pin公连接器，引脚间距2.54mm
```

![image-20240104225929738](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042259787.png)

---

---

## 三、Allegro

> 这里我要关联3D模型的元件封装是RESAD2000W80L1200D500P，单独拿出来演示一下
>
> RES表示电阻
>
> A_不太理解，略过
>
> D2000表示引脚间距20.00mm
>
> W80表示引脚的φ尺寸为00.80mm，即0.8mm
>
> L1200表示电阻元件长度为12.00mm
>
> D500表示电阻元件的φ尺寸为05.00mm，即5mm
>
> P_不太理解，略过

<div STYLE="page-break-after: always;"></div>

### 模型映射

►打开目标封装

![image-20240104233842240](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042338322.png)

---

►打开Setup设置，选择子菜单Step Package Mapping模型封装映射

![image-20240104235851486](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401042358514.png)

---

<div STYLE="page-break-after: always;"></div>►在弹出菜单里双击需要关联在一起的STEP模型文件

```c
Primary STEP model：resad2000w80l1200d500p=>xxxx.STEP//这一步需要提前设置好库路径
```

![image-20240105001306826](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401050013866.png)

黑色预览框上方是Symbol的PlaceBound区域，下方是allegro渲染的是STEP格式的3D模型

- View：可以切换不同视角，看模型是否是封装对齐
- Transparent：可以选择让Symbol或STEP透明化，即不显示，这个不关键
- Overlay：可以将其叠放在一起，建议勾选，方便关联时调整
- HideBoard：隐藏绿色的Board区域，建议勾选，方便关联时调整
- STEP color：显示模型颜色，建议勾选

**根据情况调整Map STEP Model子选项框下的XYZ旋转角度与偏移量，使Symbol与STEP对齐，这一步非常重要！！！**然后点击Save保存！！！然后点击Save保存！！！然后点击Save保存！！！

---

►点击Allegro 3D Viewer查看最终效果，符合预期即可

![image-20240105002150885](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401050021924.png)

---

<div STYLE="page-break-after: always;"></div>

### 封装保存

> 同其他封装制作步骤一样，也需要保存器件封装的必要文件

►File->Creat Symbol->xxxx.psm

![image-20240105002856796](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401050028837.png)

---

►File->Creat Device->Device Type=IC，点击OK-->xxxx.txt

![image-20240105003248272](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401050032307.png)

---

<div STYLE="page-break-after: always;"></div>

►最后再点击保存，将以下三个文件放入库中即可实现3D封装效果

![image-20240105004241418](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202401050042465.png)

