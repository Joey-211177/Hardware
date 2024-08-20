# Cadence CIS-OL数据库配置教程

[toc]





<center>📅2024/05/30 By ENJOEY~</center>



## 写在前面

>   为免去初学者在学习使用Cadence画原理图与PCB时需要做大量的准备工作，如全网翻找数据手册，瞪大眼睛制作焊盘，抓耳挠腮制作封装等一系列蜜汁操作，笔者在工作之余为Cadence开发了一款线上的CIS系统（以下简称为`CIS-OL`），包含**Orcad符号库**和**Allegro封装库**，并**带有3D模型**，元件分类清楚，以不同的参数加以区分，打算长期维护，有兴趣的小伙伴可以私信我进群免费体验，下面介绍具体的接入方法。
>
>   
>
>   ps：笔者使用的是Cadence16.6版本进行的测试，更高版本的暂时没有试过，有用高版本的热心小伙伴也可以帮忙测试一下，爱你哟😘
>
>   
>
>   <font color=#10d0ff>2024-07-10	近期测试后发现，其他版本的焊盘和封装需要使用PCB DB Doctor升级到对应版本的才可以正常使用，因此打算分版本，制作多个在线库，以适配小伙伴们不同版本的Cadence</font>



---

---



## 一、Cadence软件安装（待完成）

> ps：已经安装过Cadence的小伙伴可以跳过这一节



<div STYLE="page-break-after: always;"></div>

## 二、CIS-OL访问配置

>   Cadence CIS数据库使用MySQL管理，挂载在阿里云服务器上，通过固定的ip访问
>
>   OrCAD、Allegro库文件也存储在阿里云服务器，通过**「 *FTP*」**的方式共享给用户，权限为只读
>
>   笔者以win10系统为例，具体的软件需求如下：
>
>   - **安装MySQL-Connector-ODBC，**[🔗下载地址](https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.37-win32.msi) <font color=#d0d0d0>（按住<kbd>Ctrl</kbd>单击链接即可下载）</font>
>   - **安装RaiDrive，**[🔗下载地址](https://app.raidrive.com/download/raidrive/release/RaiDrive_2023.9.209_x64.msi) <font color=#d0d0d0>（按住<kbd>Ctrl</kbd>单击链接即可下载）</font>
>



---



### 2.1	MySQL-Connector-ODBC

>   这个是为了连接CIS数据源cis_demo



#### 安装MySQL驱动

双击`mysql-connector-odbc-8.0.37-win32.msi`

在弹出的“Setup Wizard”安装向导对话框中按照下列顺序安装即可



**1、**点击<kbd>Next</kbd>

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407132300075.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="200"/></center>

---

**2、**点选*“I accept the terms in the license agreement”*，点击<kbd>Next</kbd>

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407132300181.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="200"/></center>

<div STYLE="page-break-after: always;"></div>

**3、**默认点选***"Typical"***，点击<kbd>Next</kbd>

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407132300490.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="200"/></center>

---

**4、**点击<kbd>Install</kbd>

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407132303208.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="200"/></center>
---

**5、**安装中，会弹出“用户账户控制”对话框，点击<kbd>是</kbd>

<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407132303951.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="180"/></center></td>	<!--<center>标签将图片居中-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407132253777.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="180"/></center></td>
</tr>
</table> 

---

**6、**安装完成，点击<kbd>Finish</kbd>

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407132303602.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="200"/></center>
#### 配置ODBC数据源

<kbd>Windows</kbd>+<kbd>S</kbd>，🔍搜索框中输入*“ODBC”*，点击打开**ODBC Data Sources(32-bit)**

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407151002678.png"
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="400"/></center>
---

**1、**在弹出的对话框**"ODBC数据源管理程序（32位）"**中选择**「系统DSN」**选项，点击<kbd>添加(D)...</kbd>

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407152127731.png"
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="400"/></center>
<div STYLE="page-break-after: always;"></div>

**2、**在弹出的对话框**“创建新数据源”**中选择  ==MySQL ODBC 8.0 <font color=red>ANSI</font> Driver==  

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407152128555.png"
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="400"/></center>
---

**3、**会弹出对话框**“MySQL Connector/ODBC Data Source Configuration”**

<center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407152217630.png"
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="400"/></center>

<div STYLE="page-break-after: always;"></div>

**4、**现进行如下配置，其中 *Database* 可在下拉选项中选择  **<font color=green>cis_demo</font>**

点击<kbd>Details >></kbd>，显示更多，将**「Connection 」**选项下的`Character Set`字符集设置为  <font color=red>gb2312</font>

最后点击<kbd>Test</kbd>进行测试，Test Result测试结果显示*“Connection Successful”*即表示连接成功



<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407152212913.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="350"/></center></td>	<!--<center>标签将图片居中-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407152210797.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="350"/></center></td>
</tr>
</table>



```mysql
#数据源名
#这里填什么，Cadence CIS里的Data Source就显示什么（后面具体配置时再展开）
#必须以字母开头且不能有空格以及特殊符号，否则CIS无法成功加载
#推荐使用「字母+下划线+字母」的组合来给数据源命名
#如「公司英文简称_database」
Data Source Name:	cis_demo

#描述，可以理解为备注，可有可无，填写一些提示信息用以区分数据来源、数据用途等
Descripttion:		For Cadence

TCP/IP Server:		47.122.21.161		#MySQL服务器ip地址
Port:				3306				#端口号，默认为3306
User:				cis_demo			#用户名
Password:			K2R5KRK73B4maFGj	#密码
DataBase:			cis_demo			#数据库名

#字符集，必须选择gb2312,否则中文会乱码甚至会导致Cadence无法加载数据库
Character Set:		gb2312
```


<div STYLE="page-break-after: always;"></div>

### 2.2	RaiDrive

>   这个是为了访问库文件



#### 安装RaiDrive

双击`RaiDrive_2023.9.209_x64.msi`

按照下列顺序进行安装即可



**1、**点击<kbd>安装</kbd>

**2、**安装中，会弹出“用户账户控制”对话框，点击<kbd>是</kbd>

<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170100879.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="110"/></center></td>	<!--<center>标签将图片居中-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170106882.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="110"/></center></td>
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170107364.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="110"/></center></td>
</tr>
</table> 


---

**3、**安装完成后，会弹出"启动RaiDriver"对话框，点击<kbd>确定</kbd>

**4、**在弹出的“用户账户控制”对话框中，点击<kbd>是</kbd>

ps：首次安装时会弹出的“Windows安全中心”对话框中，点击<kbd>安装</kbd>，**<font color=gray>这是一个驱动程序</font>**

<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170138694.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="110"/></center></td>	<!--<center>标签将图片居中-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170117605.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="110"/></center></td>
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170117767.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="110"/></center></td>
</tr>
</table> 


---

**5、**出现如下界面，即代表RaiDrive安装完成

<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170121419.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="280"/></center></td>	<!--<center>标签将图片居中-->
</tr>
</table> 

#### 配置RaiDrive

> 在线库相关文件存储在服务器上，通过 *FTP* 的方式共享，权限为只读
>
> 现通过配置RaiDrive将 *FTP* 挂载到电脑的盘符**「X」**



**请按照下列顺序进行配置**



**1、**点击右上角的<kbd>⊕添加</kbd>，会弹出默认配置界面→<font color=gray>**「新虚拟驱动器」**</font>

<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170158469.png"		
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="240"/></center></td>	<!--<center>标签将图片居中-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170204932.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="240"/></center></td>
</tr>
</table> 
---

**2、**在服务类型选项中选择**「NAS」**，子选项中选择**「 🗋 FTP」**，会提示<font color=red>“请输入主机名称或ip地址”</font>，现进行如下配置：

- 虚拟驱动器	**「X」**
- <kbd>勾选</kbd>	启动RaiDrive后自动连接
- <kbd>勾选</kbd>	只读（*这里只是为了误写入不报错，本身权限就是只读的*）
- 地址	**<font color=gray>ftp://</font><font color=red>47.122.21.161</font><font color=gray>:21</font>**

-   账户	**<font color=green>cis_demo</font>**

- 密码	**<font color=green>K2R5KRK73B4maFGj</font>**

<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170201944.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="240"/></center></td>	<!--<center>标签将图片居中-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170230732.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="240"/></center></td>
</tr>
</table> 
 其余的默认，然后点击<kbd>连接</kbd>即可，会自动打开虚拟驱动器**「X」**并展示其内容

<div STYLE="page-break-after: always;"></div>

**3、**为获得更好的体验，现进行配置优化

在挂载好的FTP右侧图标中，点击<kbd>断开连接</kbd>，点击<kbd>设置</kbd>，点击<kbd>属性</kbd>，展开**「高级设置」**

- 容量	1GB（虚拟驱动器默认容量较大，这里是为了提升加载速度，并无实际意义）
- <kbd>勾选</kbd>	文件预览^较慢^
- <kbd>勾选</kbd>	立即获取文件属性^较慢^
- <kbd>勾选</kbd>	维护文件和文件夹的“修改日期”^较慢^

<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170245862.png"	
		alt="第一张图片显示不出时显示的文字"
		width="auto" height="240"/></center></td>	<!--<center>标签将图片居中-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407170255910.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="240"/></center></td>
</tr>
</table> 
<center>然后点击下方的<kbd>应用</kbd>，再点击<kbd>连接</kbd>即可，至此RaiDrive配置工作完成</center>

---

### 2.3	OrCAD Capture「CIS <u>C</u>onfiguration」

>   CIS配置步骤如下：

<table frame=void>	<!--使用table标签，且frame=void消除外边框-->
<tr><!--<tr>一行的内容<\tr>，<td>一个格子的内容<\td>-->
    <td><center>打开Capture软件<kbd>↖︎</kbd></center></td>	<!--<center>标签将图片居中-->
<td><center>
    	<img src="https://st211177.oss-cn-nanjing.aliyuncs.com/img/202407171623971.png"
		alt="第二张图片显示不出时显示的文字"
		width="auto" height="100"/></center></td>
</tr>
</table> 







### 2.4	Allegro Paths















