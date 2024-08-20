# Orcad原理图符号绘制

![image-20240622072213972](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202406220722014.png)

| New Part Properties       | Help                                                         |                                                              |               |
| :------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------- |
| Name                      | Specify the part's name. This is used as the default part value when the part is placed on a schematic page. Part names can be up to 31 characters long. | 指定零件名称。当零件被置于原理图页面时，该名称将作为默认零件值使用。零件名称最长可达 31 个字符。 | GD32F407VGT6  |
| Part Reference Prefix     | Specify the part reference prefix, such as "C" for capacitor or "R" for resistor. For example:<br /> C?1(capacitor) <br />R?1 (resistor) | 指定部件参考前缀，如 "C "表示电容器，"R "表示电阻器。例如：<br />C?1（电容器）<br />R?1（电阻器） | U1（R/L/C）   |
| PCB Footprint             | Specify the PCB name to be included for this part in the netlist. Contains a value for a device consisting of zero or more pads, other objects, and a name. | 指定网表中该零件要包含的 PCB 名称。包含由零个或多个焊盘、其他对象和名称组成的设备的值。 | LQFP100       |
| Creat Convert View        | Specify whether the part has a convert. You might use the convert to define a DeMorgan equivalent. A part with this option specified will have two views (**a normal and a convert**) you can switch between once the part is placed. | 指定零件是否有转换。您可以使用转换来定义 DeMorgan 等价物。指定了该选项的零件将有两个视图（**普通视图和转换视图**），您可以在放置零件后在两个视图之间切换。 |               |
| **Multiple-Part Package** | **Multiple-Part Package**                                    | 元件多部件封装                                               |               |
| Parts per Pkg             | If there are multiple parts in the package, specify the number of parts in the package. | 如果封装中有多个部件，请指定封装中部件的数量。               | U1A，U1B，U1C |
| Package Type              | If the part is a package, specify whether all the parts in the package have the same graphical representation (**homogeneous)** or different graphical representations (**heterogeneous**). <br /><br />***Note:*** *The package type can only be set at creation time. These options are not available when you edit the part later.<br /> You should not cut and paste parts between homogeneous and heterogeneous packages.* | 如果零件是一个封装，则指定封装中的所有零件是具有相同的图形表示法（**同构**）还是具有不同的图形表示法（**异构**）。<br /><br /> ***注意***：*封装类型只能在创建时设置。以后编辑零件时将无法使用这些选项。<br />不应在同构符号和异构符号之间剪切和粘贴部件。* |               |
| Part Numbering            | If the part is a multiple-part package, specify whether parts in the package are identified by letter or number. For example: <br />U?A (**alphabetic**) <br />U?1 (**numeric**) | 如果元件是多部件封装，请指定元件用字母还是数字标识，例如<br />U?A (**字母标识**) <br />U?1 (**数字标识**) |               |

