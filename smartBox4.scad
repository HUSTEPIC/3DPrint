smallThickness = 1;
largeThickness = 2;
hugeThickness = 3;
boardThickness = 13;

gridLength = 20;
gridWidth = 20;
gridHeight = 10;
boardHeight = 3;


holeRadius = 1.5;

gridNumber = 1;
//--------------------------------------------------------
//outsideBox();

//translate([3*gridLength,0,0])  grids();
//translate([6*gridLength,0,0])outsideBox();
//translate([9*gridLength,0,0])  grid();
rotate( [0,0,0])
{
grids(gridNumber);
#translate([gridLength,0,0])  middleBoard(gridNumber);
translate([gridLength+boardThickness,0,0])grids(gridNumber);
$fn=50;
}



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


//a row of grids
module grids(gridNumber)
{
    for(i=[0:gridNumber-1])
    {
        translate([gridLength*0,gridWidth*i,0]) grid();
    }
//    translate([gridLength*0,gridWidth*0,0]) grid();
//    translate([gridLength*0,gridWidth*1,0]) grid();
//    translate([gridLength*0,gridWidth*2,0]) grid();
//    translate([gridLength*0,gridWidth*3,0]) grid();
//    translate([gridLength*0,gridWidth*4,0]) grid();
//    translate([gridLength*0,gridWidth*5,0]) grid();
//    translate([gridLength*0,gridWidth*6,0]) grid();
    
    
//    translate([gridLength*1,gridWidth*0,0]) grid();
//    translate([gridLength*1,gridWidth*1,0]) grid();
//    translate([gridLength*1,gridWidth*2,0]) grid();
//    translate([gridLength*1,gridWidth*3,0]) grid();
//    translate([gridLength*1,gridWidth*4,0]) grid();
//    translate([gridLength*1,gridWidth*5,0]) grid();
//    translate([gridLength*1,gridWidth*6,0]) grid();
}

module middleBoard(gridNumber)
{
    for(i=[0:gridNumber-1])
    {
        translate([gridLength*0,gridWidth*i,gridHeight -boardHeight])
        difference()
        {
            cube([boardThickness,gridWidth,boardHeight]);
            translate([holeRadius,holeRadius+1,-0.5]) boardHoles();
            translate([- holeRadius +boardThickness,gridWidth - holeRadius-1,-0.5]) boardHoles();
        }
    }
    
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

//holes for one grid
module boardHoles()
{
    cylinder(r=holeRadius,h=gridHeight+1);
}
     


