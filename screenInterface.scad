/*------------------------------variables--------------------------------------------*/
inLength = 159;
inWidth = 119;


outLength = 188;
outWidth = 144;

screenLength = 165;
screenWidth = 98;
screenThickness = 15;

sideDistance = 34;
upDownDistance = 20;

inOutDistance = 33;

backThickness = 15;
bevelRadius = 5;

cameraWidth = 22;
cameraHeight = 23;
/*--------------------------------main--------------------------------------------*/
//screen();
rotate([-90,0,0])
difference()
{
    whole();
//    translate([0,0,53])
//        cube([cameraLength,200,cameraLength],center = true);
//    
    translate([0,0,58])
        cube([cameraWidth,200,cameraHeight],center = true);
    
    translate([100,0,0])cube(200,center = true);
    translate([0,0,100])cube(200,center = true);
}

/*-------------------------------modules----------------------------------------------*/

module whole()
{
    difference()
    {
        union()
        {
            front();
            back();
        }
        translate([0,0,-3])screen();
        translate([0,0,-3])
        cube([screenLength-15,260,screenWidth-10],center = true);
    }
}

module back(){
    translate([0,backThickness-1,0]) 
    rotate([90,0,0])
        linear_extrude(height = backThickness)
                minkowski()
                {
                  square([inLength-2*bevelRadius, inWidth-2*bevelRadius], center = true);
                  circle(r=bevelRadius);
                }
}
module front()
{
    rotate([90,0,0])
    linear_extrude(height = inOutDistance, scale = [outLength/inLength,outWidth/inWidth])
        minkowski()
        {
          square([inLength-2*bevelRadius, inWidth-2*bevelRadius], center = true);
          circle(r=bevelRadius);
        }
}
module screen()
{
    translate([0,-(inOutDistance-screenThickness/2+1),0]) 
    cube([screenLength,screenThickness,screenWidth],center = true);
}

        