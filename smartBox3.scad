smallThickness = 0.5;
largeThickness = 2;
hugeThickness = 3;


gridLength = 10;
gridWidth = 10;
gridHeight = 5;

gridBottomHeight = 8;
gridTopHeight = gridHeight - gridBottomHeight;

//--------------------------------------------------------
outsideBox();
grids();
translate([3*gridLength,0,0])  grids();
translate([6*gridLength,0,0])outsideBox();
translate([9*gridLength,0,0])  grid();


//--------------------------------------------------------
module outsideBox()
{
    
    difference()
    {
        difference()
        {
            translate([0,-largeThickness,-hugeThickness])
            cube([2*gridLength,7*gridWidth+2*largeThickness,gridHeight+2*hugeThickness]);
            
            cube([2*gridLength+ 1,7*gridWidth+1,gridHeight+1]);
        }
        translate([-2*largeThickness,0,0])
        cube([4*gridLength,7*gridWidth,gridHeight]);
    }
    
    
}



module grids()
{
    translate([gridLength*0,gridWidth*0,0]) grid();
    translate([gridLength*0,gridWidth*1,0]) grid();
    translate([gridLength*0,gridWidth*2,0]) grid();
    translate([gridLength*0,gridWidth*3,0]) grid();
    translate([gridLength*0,gridWidth*4,0]) grid();
    translate([gridLength*0,gridWidth*5,0]) grid();
    translate([gridLength*0,gridWidth*6,0]) grid();
    
    
    translate([gridLength*1,gridWidth*0,0]) grid();
    translate([gridLength*1,gridWidth*1,0]) grid();
    translate([gridLength*1,gridWidth*2,0]) grid();
    translate([gridLength*1,gridWidth*3,0]) grid();
    translate([gridLength*1,gridWidth*4,0]) grid();
    translate([gridLength*1,gridWidth*5,0]) grid();
    translate([gridLength*1,gridWidth*6,0]) grid();
}



module grid()
{
    difference()
    {
        cube([gridLength,gridWidth,gridHeight]);
        translate([smallThickness,smallThickness,smallThickness])
        cube([gridLength- 2*smallThickness,gridWidth- 2*smallThickness,gridHeight]);
    }
}


module gridBottom()
{
    gridBottomCube();
    scale(0.99)
        gridTopHole();
}

module gridTop()
{
    difference()
    {
        gridTopCube();
        gridTopHole();
        gridTopHole();
    }
}
module gridBottomCube()
{
    translate([0,0,0.5*gridBottomHeight])
        cube([gridLength,gridWidth,gridBottomHeight],center = true);
}       


module gridTopCube()
{
    translate([0,0,gridBottomHeight+ 0.5*gridTopHeight])
        cube([gridLength,gridWidth,gridTopHeight],center = true);
}
module gridTopHole()
{
    translate([0,0,gridBottomHeight+ 0.5*(gridTopHeight- smallThickness)])
        cube([gridLength - 2*smallThickness,gridWidth- 2*smallThickness,gridTopHeight- smallThickness],center = true);
}
     
module gridTop()
{
    difference()
    {
        cube([gridLength,gridWidth,gridTopHeight],center = true);
        translate([0,0, -smallThickness])
            cube([gridLength - smallThickness,gridWidth - smallThickness,gridTopHeight],center = true);
    }
}
        

