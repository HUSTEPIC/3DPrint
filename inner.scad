/*
长84，宽75
高12，20
以长所在的方向为x轴，宽所在的方向为y轴，
*/


/*--------------------global variables-----------------------*/
thickness = 2;
length = 84;
width = 75;

protecter_height = 49;
protecter_longer_raduis = 120;
protecter_shorter_raduis = 120;
protecter_thickness = 1.5;

extra = 3 ; 
/*------------------------test area-------------------------*/

 
//translate([0,0,-3]) board();
protecter();
translate([0,0,-3])
            scale([1.1,1.5,1.1])
                down_bulge_tall();


/*--------------------------main----------------------------*/



/*--------------------------modules----------------------------*/

module protecter()
{
    $fn = 100;
   
    difference()
    {
        ball(protecter_longer_raduis,protecter_shorter_raduis,protecter_height);
        //中间挖空
        ball(protecter_longer_raduis-protecter_thickness,
        protecter_shorter_raduis-protecter_thickness,
        protecter_height-protecter_thickness);
        //打四个孔
        holes();  
        
        translate([0,0,-3])
            scale([1.1,1.5,1.1])
                down_bulge_tall();
        
        
        
        
        
        //下方突起
//        #translate([(41-length/2),-80,0])cube([26,70,19]);  //下方两个最高突起
//        #translate([-(length/2-11),-80,thickness/2])cube([13,70,3]);//下方两个矮的突起
//        //右侧突起
//        translate([(length/2-4),-(width/2 ),thickness/2])cube([7,width,3]);
//        //左侧突起
//        translate([-(length/2),-(width/2 ),thickness/2])cube([5,width,7]); 
        
        
    }
}


module board()
{
    //main board and 4 holes in the corners
    difference(){
        cube([length,75,thickness],center = true);   //main board
        holes();
    } 
    //下方突起
    down_bulge_tall();
    down_bulge_short();
    
    //右侧突起
    right_bulge();
    //左侧突起
    left_bulge();
}
module holes()
{
    height = 100;
    translate([-(length/2-9),-(width/2 - 3),0]) cylinder (height,2,2,center = true); //左下的洞
    translate([-(length/2-9),(width/2 - 3),0]) cylinder (height,2,2,center = true);  //左上的洞
    translate([(length/2-15),(width/2 - 3),0]) cylinder (height,2,2,center = true);  //右上的洞
    translate([(length/2-15),-(width/2 - 3),0]) cylinder (height,2,2,center = true);  //右下的洞
}
module down_bulge_tall()
{
    translate([(41-length/2),-(width/2 - 2),thickness/2])cube([26,17,19]);  //下方两个最高突起
}
module down_bulge_short()
{
    translate([-(length/2-11),-(width/2 + 3),thickness/2])cube([13,7,3]);  //下方两个矮的突起
}
module right_bulge()
{
    translate([(length/2-4),-(width/2 ),thickness/2])cube([7,width,3]);
}
module left_bulge()
{
    translate([-(length/2),-(width/2 ),thickness/2])cube([5,width,7]);
}
module ball(x,y,z)
{
    resize(newsize=[x,y,z])
    sphere(1);
}