**Part Number**

>   Required to identify the part in association with the CIS Part_Number property type. This property is required by the part manager and the bill of materials report. CIS lets you enter more than one database part with the same number in the database. However, you should use a unique part number for each part and have no duplicate part entries in your database.
>
>   需要识别与CIS Part_Number属性类型相关联的部件。此属性是零件经理和物料清单报告所要求的。CIS允许您在数据库中输入多个具有相同编号的数据库部件。但是，您应该为每个部件使用唯一的部件号，并且在数据库中没有重复的部件条目。

---



**Part Type**

>   Identifies the part type. The Part Database Explorer uses this property to define the part database folder hierarchy. Use this property to facilitate part searches. Typical contents are resistor, resistor\fixed, capacitor, capacitor\electrolytic, IC, IC\Memory\SRAM, connector, and so on. The levels of the hierarchy are defined using the backslash (\) character (or any character you define in the configuration). You can define any number of levels in the hierarchy.
>
>   This property is also used by the Part ReferenceAssociations option. (See ["Defining part reference associations"](#1054216) . This property is case-sensitive. Make sure you use uppercase-lowercase conventions consistently when entering values for this property.
>
>   标识部件类型。零件数据库资源管理器使用此属性定义零件数据库文件夹层次结构。使用此属性可简化零件搜索。典型内容有电阻器、固定电阻器、电容、电解电容、IC、IC存储器、SRAM、连接器等。层次结构的级别是使用反斜杠(\)字符(或在配置中定义的任何字符)定义的。您可以在层次结构中定义任意数量的级别。
>
>   部件引用关联选项也使用此属性。(参见“定义部件引用关联”。此属性区分大小写。在为该属性输入值时，请确保始终使用大写-小写约定。

---



**SchematicPart (Symbol)**

>   The part name. This property is required to use thePlace Database Part command. Only the part name is necessary if the part is stored in the same directory as the custom schematic part libraries (.OLB files) that you configure in Capture. (See the OrCAD Capture User's Guide for more information about configuring part libraries.)
>
>   However, to make sure that you don't accidentally place an identically named part, you should include the library name, a backslash (\), and then the part name. Examples include:
>
>   DISCRETE\CAP
>   DISCRETE\DIODE
>   OPAMP\CMP01
>
>   In addition, you can use the explicit path so CIS canlocate an unconfigured library. For example:
>
>   C:\MYLIB\DISCRETE\CAP
>
>   **Caution:**Do not directly reference theschematic part libraries that are supplied with Capture CIS (resource libraries). Because the resource libraries in your installations of Capture CIS are often changed during upgrades to new software versions, the library names and paths in your database can be made invalid. Instead, create your own custom libraries by renaming the resource library files or copying individual parts from the resource libraries to your custom libraries.
>
>   部件名称。使用“放置数据库部件”命令需要此属性。如果部件存储在与自定义原理图部件库()相同的目录中，则只需要部件名称。您在Capture中配置的OLB文件。(有关配置零件库的更多信息，请参阅OrCAD Capture用户指南。)
>
>   但是，为了确保不会意外放置同名部件，您应该包括库名称、反斜杠(\)，然后是部件名称。例子包括:
>
>   离散\帽
>   离散\二极管
>   OPAMP \ CMP01
>
>   此外，您可以使用显式路径，以便CIS可以定位未配置的库。例如:
>
>   C: \ MYLIB \离散\帽
>
>   不要直接引用Capture CIS提供的原理图部件库(资源库)。由于在升级到新软件版本期间经常更改Capture CIS安装中的资源库，因此数据库中的库名称和路径可能无效。相反，您可以通过重命名资源库文件或将资源库中的各个部分复制到您的自定义库来创建自己的自定义库。

>   You can also assign multiple schematic part names to a single part. Use the same format as above for each name and separate each one with the multi-value delimiter (by default, a comma). For example:DISCRETE\CAPACITOR NON-POL, DISCRETE\CAP NP, DISCRETE\SMALL CAP
>
>   您还可以将多个原理图部件名称分配给单个部件。对每个名称使用与上述相同的格式，并用多值分隔符(默认情况下是逗号)分隔每个名称。例如:
>
>   分立\电容非pol，分立\ cap np，分立\小盘

>   The default value of the multi-value delimiter is a comma. However, when setting administrative preferences during database configuration, you can change the character CIS recognizes as the delimiter to a colon, semi-colon, question mark, or vertical bar. For information, see "Setting administrative preferences" .
>
>   多值分隔符的默认值是逗号。但是，在数据库配置期间设置管理首选项时，可以将CIS识别为分隔符的字符更改为冒号、分号、问号或竖条。有关信息，请参见“设置管理首选项”。

>   Then, when you update your design's part status, CIS can approve and make current a schematic part which has several acceptable names. Also, if a database part has several different valid schematic parts, you will be able to choose any one of them when you are placing parts from the database parts window. All the configured schematic parts for the database part will be available from a drop-down list under the Schematic Part property name.
>
>   然后，当您更新设计的零件状态时，CIS可以批准并制作具有多个可接受名称的原理图零件。另外，如果一个数据库部件有几个不同的有效原理图部件，那么当您从数据库部件窗口放置部件时，您将能够选择其中的任何一个。数据库部件的所有已配置的原理图部件都可以从schematic part属性名称下的下拉列表中获得。

>   CIS locates the Capture library using the following set of prioritized rules:
>
>   1.  Search the library at the explicit path, if provided.
>   2.  Search the first library listed in Capture.ini that has a matching library filename.
>   3.  Search all directories that contain configuredlibraries.
>
>   If no libraries are included specifically in your Capturedesign, CIS searches the LIBRARY directory in yourCapture installation directory.
>
>   CIS使用以下一组优先级规则定位Capture库:
>
>   1.  在显式路径搜索库(如果提供的话)。
>   2.  搜索Capture.ini中列出的具有匹配库文件名的第一个库。
>   3.  搜索包含已配置库的所有目录。
>
>   如果Capture设计中没有包含特定的库，则CIS会搜索Capture安装目录中的LIBRARY目录。

---



**Value**

>   The part value. Examples are 1.2K, 10.0uF, and74ALS374. CIS supports the use of common magnitude identifiers (such as K and uF).
>
>   The database query uses intelligent unit conversion to interpret common magnitude identifiers in part definitions, since entries in part databases are often inconsistent (for example, the Value for a 2.7K resistor can be 2.7K, 2,700, 2.70K, 2.700K, 2700.0, 0.0027M, etc.). Unit suffixes (such as F for farads or H for henries) are ignored in translation.
>
>   零件值。例如:1.2K、10.0uF、74ALS374。CIS支持使用常见的幅度标识符(如K和uF)。
>
>   数据库查询使用智能单位转换来解释部件定义中的常见量值标识符，因为部件数据库中的条目通常不一致(例如，2.7K电阻器的值可以是2.7K、2700、2.70K、2.700K、2700.0、0.0027M等)。单位后缀(如F代表farads或H代表henries)在翻译中被忽略。
>
>   CIS中支持的大小标识符包括
>
>   ![image-20240411112225446](https://st211177.oss-cn-nanjing.aliyuncs.com/img/image-20240411112225446.png)
>
>   



Availability，Number of the parts in stock at your company.Notrecommended

贵公司库存零件的数量。不推荐



Data Sheet，可以根据需要设置

>   The name of the detailed datasheet for this part. Select the Browsable check box in the configuration for CIS to automatically launch the appropriate browser for this property.
>
>   Examples include: 74ALS374.PDF,http://www.chipmaker.com/specs/74ALS374, and RES1K1/4W.DOC.
>
>   **Note:** CIS uses the PATH environment variable and the current working directory to find the specified document.
>
>   该部件的详细数据表名称。在CIS配置中选择Browsable复选框，以自动为该属性启动适当的浏览器。
>
>   例如:74ALS374.PDF、http://www.chipmaker.com/specs/74ALS374和RES1K1/4W.DOC。
>
>   你可以浏览任何你想要的格式。CIS使用在Windows注册表中分配给该文件扩展名的应用程序。扩展分配是在Windows资源管理器中管理的。有关更多信息，请参阅MS Windows文档。)例如，. doc条目可能导致CIS启动Microsoft Word, URL条目可能导致它启动默认的web浏览器。
>
>   注意:CIS使用PATH环境变量和当前工作目录来查找指定的文档。



**Description**，A brief description of the part.对该部件的简要描述。



维护自用数据库时不推荐以下属性，这需要庞大的数据库支撑，对于生产制造的管理是很不方便的，研发设计时只需要关注核心元件的可得性就可以了，尽量避免唯一供应商，多尝试pin to pin的元件

-   **Distributor**，Name of part distributor.经销商
-   **Distributor Part Number**,Part number used to order from the distributor.经销商元件编号
-   **Manufacturer**，Name of part manufacturer.制造商
-   **ManufacturerPart Number**，Part number used to order from the manufacturer.制造商元件编号



**PCB Footprint**

>   The PCB footprint name (from the footprint library)assigned to a part.
>
>   **Note:** Unlike Schematic Part property names, you cannot use directory paths for libraries with PCB footprint names. If you use a path with a PCB footprint name, the footprint will not display in the CIS explorer's footprint window.
>
>   You can assign multiple PCB footprints to a single part by entering them in the part's footprint field in your part database and separating each footprint name with the multi-value delimiter.
>
>   The default value of the multi-value delimiter is a comma. However, when setting administrative preferences during database configuration, you can change the character CIS recognizes as the delimiter to a colon, semi-colon, question mark, or vertical bar. For information, see ["Setting administrative preferences"](#1062068) .
>
>   Then, when you update your design's part status, CIS can approve and make current a schematic part which has several acceptable footprint names. Also, if a database part has several different valid PCB footprints, you will be able to choose any one of them when you are placing parts from the database parts window. All the configured PCB footprints for the database part will be available from a drop-down list under the PCB Footprint property name.
>
>   分配给零件的PCB足迹名称(来自足迹库)。
>
>   注意:与原理图部分属性名称不同，您不能为带有PCB占用空间名称的库使用目录路径。如果您使用带有PCB足迹名称的路径，则足迹将不会显示在CIS资源管理器的足迹窗口中。
>
>   您可以将多个PCB足迹分配给单个零件，方法是在零件数据库中的零件足迹字段中输入它们，并用多值分隔符分隔每个足迹名称。**意思是同一元件可以用多个封装**
>
>   多值分隔符的默认值是逗号。但是，在数据库配置期间设置管理首选项时，可以将CIS识别为分隔符的字符更改为冒号、分号、问号或竖条。有关信息，请参见“设置管理首选项”。
>
>   然后，当您更新设计的零件状态时，CIS可以批准并生成具有几个可接受的足迹名称的原理图零件。此外，如果一个数据库部件有几个不同的有效PCB足迹，当您从数据库部件窗口放置部件时，您将能够选择其中的任何一个。从PCB Footprint属性名称下的下拉列表中可以获得数据库部件的所有配置的PCB封装。



**Price**，Part price. Use this information when selecting parts to design for cost. Include this property in reports to get a cost roll-up of your design.

一部分的价格。在选择零件进行成本设计时使用此信息。在报告中包含此属性以获得设计的成本汇总。



Rating，The maximum rating for the part (for example, maximum voltage or power dissipation).

部件的最大额定值(例如，最大电压或最大功耗)。



**Tolerance**，The percent tolerance specified for the part.

为零件指定的公差百分比。**精度**





---

**Setting the field format**

>   CIS can work with database text and number format fields (known as the cell format in spreadsheets). As a general rule, set each database field (that is, each table column) to text format. CIS converts other database field formats, such as float, to text format when properties are transferred to placed parts.
>
>   **Note:** Use only ANSI SQL-92 compliant data types for your field formats. If you use non-compliant data types, CIS may misinterpret property values.
>
>   设置字段格式
>
>   CIS可以处理数据库文本和数字格式字段(在电子表格中称为单元格格式)。作为一般规则，将每个数据库字段(即每个表列)设置为文本格式。当属性被转移到放置的部分时，CIS将其他数据库字段格式(如float)转换为文本格式。
>
>   注意:仅使用符合ANSI SQL-92的数据类型作为字段格式。如果使用不兼容的数据类型，CIS可能会误解属性值。



**Using more than one table**

>   CIS can reference more than one table or worksheet in your part database. For example, you can group your parts into several tables according to type. That is, you can place resistors in one table, ICs in another, capacitors in another, and the remaining parts in a fourth table. When you're viewing database parts with CIS, each table has a unique view. You can arrange the column settings for each table independently, allowing you to view different properties for each table.
>
>   使用多个表
>
>   CIS可以在零件数据库中引用多个表或工作表。例如，您可以根据类型将部件分组到几个表中。也就是说，您可以将电阻放在一张表中，ic放在另一张表中，电容器放在另一张表中，其余部件放在第四个表中。当您使用CIS查看数据库部件时，每个表都有一个惟一的视图。您可以独立安排每个表的列设置，从而可以查看每个表的不同属性。



**Using related tables使用相关表**

>   CIS allows you to create and use relational tables in your parts database. These tables must have a one-to-many relationship with your part information (primary) tables. For example, the database may contain a Vendor table with multiple vendor / manufacture part numbers for one company part number in your Resistor table. This structure allows you to query for data across the primary and relational tables.
>
>   **Note:** It is not necessary for the parts database to contain relational tables. You can create and run CIS queries for parts from a flat table structure.
>
>   CIS允许您在零件数据库中创建和使用关系表。这些表必须与部件信息(主)表具有一对多关系。例如，数据库可能包含一个Vendor表，其中包含多个供应商/制造商零件号，用于电阻表中的一个公司零件号。这种结构允许您跨主表和关系表查询数据。
>
>   注意:部件数据库不需要包含关系表。您可以为平面表结构中的部件创建和运行CIS查询。
>
>   ![image-20240411131430452](https://st211177.oss-cn-nanjing.aliyuncs.com/img/image-20240411131430452.png)



**Creating a part database from an existing design**

根据现有设计创建零件数据库

You can also create a part database by extracting part properties from an existing Capture design using the CIS Bill of Materials command.

您还可以通过使用CIS Bill of Materials命令从现有的Capture设计中提取零件属性来创建零件数据库。

If your designs are created in another schematic capture program that creates bills of materials for part properties, you can still create a part database from an existing design. Follow the instructions supplied with the program to create the appropriate bill of materials file from your design. Then, use the bill of materials file to create a part database based on that design.

如果您的设计是在为零件属性创建物料清单的另一个原理图捕获程序中创建的，您仍然可以从现有设计中创建零件数据库。按照程序提供的说明，根据您的设计创建适当的物料清单文件。然后，使用物料清单文件创建基于该设计的零件数据库。

You can obtain a wizard from the Cadence web site that automates this process. The wizard also automatically derives schematic part and source library information for the placed parts in your Capture schematic. If you use the manual procedure detailed here, you will have to manually reference your placed parts to your libraries. To download the CIS wizard, visit[http://www.cadence.com\orcad](http://www.cadence.com/orcad).

您可以从Cadence网站获得一个向导，使此过程自动化。该向导还自动为Capture原理图中放置的部件派生原理图部件和源库信息。如果使用这里详细介绍的手动过程，则必须手动将放置的部件引用到库中。要下载CIS向导，请访问http://www.cadence.com\orcad。

Consider the example in the following illustration. The lists a typical set of properties to extract from the design.考虑下面插图中的示例。列表中要提取的一组典型属性

序号，编号，元件位号，元件描述，元件值，元件数量

![](https://st211177.oss-cn-nanjing.aliyuncs.com/img/Final6_BOM_Wind.gif)

In the Output Format list, CIS lists a number of properties that will be extracted to the bill of materials. You can add to this list by selecting properties from the Select Properties list and clicking the Add button. You can remove properties from the Output Format list by selecting them and clicking the Remove button.

在Output Format列表中，CIS列出了一些将被提取到物料清单中的属性。您可以通过从“选择属性”列表中选择属性并单击“添加”按钮来添加到此列表。可以通过选择属性并单击remove按钮从Output Format列表中删除这些属性。

When you click OK in the Standard Bill of Materials dialog box, CIS creates a file with the property information for all the parts in the design. You can directly import this file into your database.

当您在“标准物料清单”对话框中单击“确定”时，CIS将创建一个文件，其中包含设计中所有部件的属性信息。您可以直接将该文件导入数据库。

**Note:** Your database should have a unique part number for each part and no duplicate part entries. Although some database applications will not import more than one occurrence of a keyed property, you may need to eliminate duplicate part entries manually. To do this, sort the database by part number, then delete duplicate entries using your database or spreadsheet program.

注意:你的数据库应该有一个唯一的零件编号，每个零件没有重复的零件条目。尽管某些数据库应用程序不会导入多个键值属性，但您可能需要手动消除重复的部件条目。为此，请按零件编号对数据库进行排序，然后使用数据库或电子表格程序删除重复条目。



**Setting up the ODBC data source，设置ODBC数据源**

Before you can set the CIS configuration, you must define the open database connectivity (ODBC) data source for your database. CIS interfaces to your part database using a defined ODBC data source name. A data source consists of a database filename and an associated ODBC driver with which to access it. If you are setting up a client-server database, the data source also references the database server. You define the data source name, assign the database file name, and specify the ODBC driver using the 32-bit ODBC Windows control panel.

在设置CIS配置之前，必须为数据库定义开放数据库连接(ODBC)数据源。使用已定义的ODBC数据源名称与零件数据库进行CIS接口。数据源由数据库文件名和用于访问它的相关ODBC驱动程序组成。如果您正在设置客户机-服务器数据库，则数据源也会引用数据库服务器。您可以使用32位ODBC Windows控制面板定义数据源名称、分配数据库文件名并指定ODBC驱动程序。

You must define the data source on each user's system. When you do so, use the same data source name. This allows users to share the same configuration file.

您必须在每个用户的系统上定义数据源。这样做时，请使用相同的数据源名称。这允许用户共享相同的配置文件。

**Note:** If your workgroup is sharing a configuration file, make sure to write-protect the file.

To set the data source for the local database, do the following:

注意:如果您的工作组正在共享配置文件，请确保对该文件进行写保护。**[意思就是允许只读，不允许修改]**

要设置本地数据库的数据源，请执行以下操作:

1.  From the Windows Start Menu, choose *Control Panel*.

**Note:** If you are using the 64-bit Windows machine, run the odbcad32.exe application from the`C:\windows\syswow64` directory path, and follow the steps from [Step 3](#1053889).

在Windows开始菜单中选择“控制面板”。
注意:如果您使用的是64位Windows机器，请从C:\ Windows \syswow64目录路径运行odbcad32.exe应用程序，并按照步骤3中的步骤操作。



Choose System and Security - Adminstrative Tools - Data Source (ODBC), if you have selected View by drop-down list box as Category.Or

如果选择“按下拉列表框查看”作为类别，则选择“系统和安全-管理工具-数据源(ODBC)”。或

Choose *Adminstrative Tools - Data Source (ODBC),* if you have selected View by drop-down list box as Large icons or Small icons.

如果选择了“通过下拉列表框查看”作为大图标或小图标，则选择“管理工具-数据源(ODBC)”。

**Note:** If you are using the Windows XP operating system, choose *Performance and Maintenance - Administrative* *Tools - Data Sources (ODBC).*

注意:如果您使用的是Windows XP操作系统，请选择“性能与维护-管理工具-数据源(ODBC)”。





Data Source

显示数据库名称



Browse

从列出的源中选择数据库以显示其属性。



Tables

选择数据库中的零件表。CIS自动创建TMPPRTS表来保存临时部件。





Configuration

显示所选表的属性。每行表示一个部件属性。每一列是属性的一个特征。



Transfer to Design

>   Check to have Capture CIS copy this property to the placed part when you place or link the part.选中以使Capture CIS在放置或链接部件时将此属性复制到放置的部件。





![image-20240608142251453](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202406081422522.png)



---

**PSpice Model**

![image-20240609203725486](https://st211177.oss-cn-nanjing.aliyuncs.com/img/202406092037610.png)
