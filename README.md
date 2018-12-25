# 3DPrint
3D models for the robot
# 参考链接
[官方文档](http://www.openscad.org/documentation.html?version=2015.03)
[官方文档之——代码](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language)
# 如何快速上手
打开openSCAD后界面如下：
![](https://img2018.cnblogs.com/blog/1341972/201812/1341972-20181218154406840-758938810.png)

选择其中的examples，从basic看起。配合[官方文档](http://www.openscad.org/documentation.html?version=2015.03)中的first step部分，和[官方文档——代码写法](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language)即可很快上手。
# 概述
- 默认界面左边是代码，右边是预览图
- Ctrl + D 可注释选中行（从edit菜单栏中得知）
- 以下按钮预览（鼠标停留可显示文字preview）
![](https://img2018.cnblogs.com/blog/1341972/201812/1341972-20181213144411732-24512483.png)

# 命令
## 几何体
```
cube(10);  //边长为10的正方体，锚点在其一角
cube([2,3,4]); //长宽高分别为2，3，4的长方体，锚点在其一角
cube(15, center=true);  //边长为15的正方体，锚点在其中心

sphere(10); //半径为10的球体

polygon( points=[[0,0],[8,4],[4,8],[4,12],[12,16],[0,20]] ); //这几个点顺次连接构成的几何体
```
## 几何变换
```
translate([-24,0,0])  //平移
union()  //并
intersection //交
difference() // 差
hull()  //凸包，详情请百度
```

例子：
![几何变换的例子](https://img2018.cnblogs.com/blog/1341972/201812/1341972-20181213145216069-1456481909.png)



## linear Extrude
```
linear_extrude(
height = fanwidth, 
center = true, 
convexity = 10, 
twist = -fanrot,
 slices = 20,
 scale = 1.0, 
$fn = 16) {...}
```

## minkowski()  （倒角，圆角，bevel）

### 例一：minkowski()直接用于三维物体
```
height = 10;
length = 10;
width = 20;
bevelRadius = 2;

$fn=50;
cube([length-2*bevelRadius, width-2*bevelRadius,height]);
cylinder(r=bevelRadius,h=height);

translate([20,0,0])
    minkowski()
    {
      cube([length-2*bevelRadius, width-2*bevelRadius,height/2]);
      cylinder(r=bevelRadius,h=height/2);
    }
```
![](https://img2018.cnblogs.com/blog/1341972/201812/1341972-20181218160015199-2101413085.png)![](https://img2018.cnblogs.com/blog/1341972/201812/1341972-20181218160034950-99424690.png)![](https://img2018.cnblogs.com/blog/1341972/201812/1341972-20181218160047839-1272543514.png)





### 例二：minkowski()用于二维物体（之后可以叠加linear Extrude）
```
height = 10;
length = 10;
width = 20;
bevelRadius = 2;
linear_extrude(height = height)
    square([length-2*bevelRadius, width-2*bevelRadius]);
linear_extrude(height = height)
          circle(r=bevelRadius);
          
$fn=50;

translate([20,0,0])
linear_extrude(height = height)
        minkowski()
        {
          square([length-2*bevelRadius, width-2*bevelRadius]);
          circle(r=bevelRadius);
        }
```
效果和例一相同
## projection()
```
projection(cut = true)
          import("projection.stl");

```
## rotate_extrude()
绕z轴旋转360°

## 文字
[官方文档——text用法](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#Text)


```
text(letter, 
       size=size*22/30,
       font="Bitstream Vera Sans",
       halign="center",
       valign="center");
```




## echo（字符串变量）；
会在右边控制台console中第三行左右显示

![echo](https://img2018.cnblogs.com/blog/1341972/201812/1341972-20181213153046242-1548123248.png)
## 导入其他文件
### import("xxx.stl");
```
import("projection.stl");  //
```
### use <xxx.scad>
```
use <logo.scad>  //Imports the Logo() module from logo.scad into this namespace
Logo();
```

## 特殊显示（透明与高亮）
```
cube(15,center = true);
translate([0, 0, 20]){
    %cube(15,center = true);  //% 是透明
}
    
translate([0, 0, -20]){
    #cube(15,center = true);  //#是高亮
}
```

效果如图：
![透明与高亮效果图](https://img2018.cnblogs.com/blog/1341972/201812/1341972-20181213161858996-746050106.png)

## 特殊变量
### 分辨率：$fa, $fs and $fn
The $fa, $fs and $fn special variables control the number of facets used to generate an arc:

- **$fa** is the **minimum angle** for a fragment. Even a huge circle does not have more fragments than 360 divided by this number. The default value is 12 (i.e. 30 fragments for a full circle). The minimum allowed value is 0.01. Any attempt to set a lower value will cause a warning.

- **$fs** is the **minimum size** of a fragment. Because of this variable very small circles have a smaller number of fragments than specified using $fa. The default value is 2. The minimum allowed value is 0.01. Any attempt to set a lower value will cause a warning.

- $fn is usually 0. When this variable has a value greater than zero, the other two variables are ignored and full circle is rendered using this number of fragments. The default value is 0.

### 初始视角 $vpr, $vpt and $vpd
-   $vpr shows rotation
-   $vpt shows translation (i.e. won't be affected by rotate and zoom)
-   $vpd shows the camera distance [_Note:  Requires version  **2015.03**_]
