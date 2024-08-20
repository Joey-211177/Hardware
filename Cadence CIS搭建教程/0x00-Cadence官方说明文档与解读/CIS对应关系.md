**part_number**

**value**

**part_type**

**schematic_part**

**pcb_footprint**

pspice model，这个模型暂时用不到，可以不选



公用字段定义和含义

-   Part number，公司内的元器件编号

-   Part Type，元件类型

-   Value，元件值：比如电容容值，电阻阻值

-   Description，描述：详细描述元件型号

-   Schematic Part，原理图符号的标识 (格式 : 库名称 + “\” + 元件名称), 这个字符串要和capture原理图库一致，写错了，放数据库元件时，就没有原理图符号。

    e.g. DTOA\AD390 这是1个元件，是DTOA目录下的AD390元件
    e.g. OPAMP\AD811/SO16 一个元件，目录和元件的分隔符号是’/‘或’‘都可以
    e.g. 74HC374,SN74HC374 这是2个元件，即2个元件都用这1个原理图符号，2个元件用’,'号隔开

    其实2个元件可以搞2个原理图符号，不必共用1个原理图符号。

-   Allegro PCB Footprint，PCB封装名称，这个名称不能像原理图元件属性那样，用库+""+元件名称 来表示。必须直接写封装名称。如果封装找不到，需要自己加载对应的PCB库。或指定库路径。

-   PSpice，仿真模型符号
-   Manufacturer Part Number，原厂物料编号/原厂器件型号/制造商元件编号，e.g. LM2902M
-   Manufacturer，元件厂商名称/制造商名称
-   Distributor Part Number，经销商元件编号
-   Distributor，销售商名称
-   Price，元件购买价格
-   Rating，元件额定值，工作电流，电压，功率
-   Tolerance，元件的公差或要求的精度，e.g. 精度1%
-   Availability，元件可用性/是否可以买到/供货周期
-   Datasheet，该元件对应的数据表文档位置名称。
-   ActivepartsID，活动元件ID (不理解这个字段啥意思)

![image-20240410212047538](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202404102120611.png)

---

为啥这些字段是必须的呢，其中Pspice仿真模型可以不进行设置，

part_number，唯一的物料编号

part_type，物料类型，如薄膜电阻，表贴电阻，MLCC电容

Schematic Part，原理图符号的标识 (格式 : 库名称 + “\” + 元件名称), 这个字符串要传到capture中要用的，写错了，放数据库元件时，就没有原理图符号。

Value，元件值(e.g. 260R)

PCB Footprint，PCB封装名称。这个名称不能像原理图元件属性那样，用库+""+元件名称 来表示。必须直接写封装名称。如果封装找不到，需要自己加载对应的PCB库。或指定库路径。//原理图和PCB就要这样关联





>   You can configure CIS to transfer additional table property names when you place or link database parts on schematic pages. 
>   您可以将CIS配置为在原理图页面上放置或链接数据库部件时传输其他表属性名称。
>   For table property names that you set to be transferred to designs, you can also set the Orcad Property Name, which defines the name of the property when it is transferred to a placed part. 
>   对于已设置为转移到设计中的表属性名，还可以设置Orcad属性名，它定义了将属性转移到放置部分时的名称。
>   Select the table property names to be transferred, change the Orcad property names if desired, and then click the Next button.
>   选择要传输的表属性名，根据需要更改Orcad属性名，然后单击Next按钮。
>
>   **ACCESS数据库的数据属性与Orcad的属性对应关系**



>   Browsable properties are used to store references to datasheets, drawings, and other documents. 
>   可浏览属性用于存储对数据表、图纸和其他文档的引用。
>   If you set database properties as browsable, CIS allows you to open the referenced files while browsing your part database or viewing bills of materials. 
>   如果您将数据库属性设置为可浏览的，则CIS允许您在浏览零件数据库或查看物料清单时打开引用文件。
>   Select browsable properties, and then click the Next button.
>   选择可浏览的属性，然后单击Next按钮。
>
>   **可以链接到数据手册的目录**



>   When linking database parts, CIS uses the keyed property values of placed parts to find part matches in the database. 
>   在链接数据库部件时，CIS使用所放置部件的键值来查找数据库中的部件匹配项。
>   Normally, only the Value property is set as keyed. 
>   通常，只有Value属性被设置为键。
>   Set keyed properties, and then click the Finish button.
>   设置关键属性，然后单击Finish按钮。