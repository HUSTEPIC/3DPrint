/*------------------------------variables--------------------------------------------*/
inLength = 163;
inWidth = 122;


outLength = 188;
outWidth = 144;

screenLength = 165;
screenWidth = 98;
screenThickness = 15;

sideDistance = 34;
upDownDistance = 20;

inOutDistance = 33;

backThickness = 30;
bevelRadius = 5;
/*--------------------------------main--------------------------------------------*/
//screen();
rotate([-90,0,0])
difference()
{
    whole();
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
        screen();
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

        