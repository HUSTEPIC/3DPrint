smallThickness = 2;
largeThickness = 3;

boardThickness = 25;



holeRadius = 1.5;
longHoleRadius = 1.5;
boardHeight = 5;

topOffset = 5*holeRadius +0;
topThickness = 3;


gridLength = 30;
gridWidth = 2*(topOffset + boardHeight) +1;
gridHeight = 12;




clickLength = 5;
clickWidth = 2;
clickDepth = 1;



gridNumber = 7;

top = true;
bottom = true;
longHole = false;
//--------------------------------------------------------


    difference()
    {
        gridsRow(gridNumber);
        //longHole();
    }



if(bottom == true)
{
    difference()
    {
        translate([gridLength,0,0])  
        middleBoard(gridNumber);
        
        longHole();
        
            $fn=50;
    
        translate([gridLength+boardThickness-5.1,
        gridNumber*(gridWidth-smallThickness)+4*smallThickness,
        gridHeight-boardHeight/2])
        
        rotate ([90,0,0])
        
        cylinder(r=longHoleRadius,
        h=(gridWidth+6*smallThickness)*gridNumber);
    }

}


translate([boardThickness + 2*gridLength,0,0]) mirror([1,0,0]) 
        difference()
    {
        gridsRow(gridNumber);
        //longHole();
    }
    

sideGrids();

if (longHole ==true)
{
    longHole();
    translate([10,0,0])
    longHole();}




//--------------------------------------------------------
module outsideBox()
{
    cube([,,]);
}


module longHole()
{
    $fn=50;
    
    translate([gridLength+5.1,
    gridNumber*(gridWidth-smallThickness)+4*smallThickness,
    gridHeight-boardHeight/2])
    
    rotate ([90,0,0])
    
    cylinder(r=longHoleRadius,
    h=(gridWidth+6*smallThickness)*gridNumber);
}
//holes for one grid
module boardHoles()
{
    $fn=50;
    cylinder(r=holeRadius,h=gridHeight+1);
}
     
module middleBoard(gridNumber)
{
    for(i=[0:gridNumber-1])
    {
        translate([gridLength*0,(gridWidth-smallThickness)*i,gridHeight -boardHeight])
        difference()
        {
            cube([boardThickness,gridWidth,boardHeight]);
            translate([holeRadius,holeRadius+3,-0.5]) boardHoles();
            translate([- holeRadius +boardThickness,gridWidth - holeRadius-3,-0.5]) boardHoles();
        }
    }
    
}

module gridBottom()
{
    difference()
    {
        difference()
        {
            cube([gridLength,gridWidth,gridHeight]);
            
            translate([smallThickness,smallThickness,smallThickness])
            cube([gridLength- 2*smallThickness,gridWidth- 2*smallThickness,gridHeight]);
        }
        
        
        
            translate([0,(gridWidth-smallThickness)/2-clickWidth,gridHeight/2]) cube([clickDepth,clickLength,clickWidth]);
    }
}
module gridTop()
{
    translate([0,smallThickness/2,gridHeight])
    cube([gridLength+topOffset,gridWidth - smallThickness,topThickness]);
    
    translate([-smallThickness, 0,0])
            cube([smallThickness,gridWidth ,gridHeight +topThickness ]);
            
            translate([0,(gridWidth-smallThickness)/2-clickWidth,gridHeight/2])         cube([clickDepth -0.1,clickLength-0.5,clickWidth-0.5]);
}

module grid()
{
    
    if(top == true)
    rotate([0,0,0]) gridTop();
    
    
    if(bottom == true)
    gridBottom();
}


//a row of grids
module gridsRow(gridNumber)
{
    if(gridNumber >2)
    {
        for(i=[1:gridNumber-2])
        {
            translate([gridLength*0,(gridWidth-smallThickness)*i,0])
            grid();
        }
    }
    

}


module sideTop()
{

    difference()
    {
        union()
        {
            translate([0,0,gridHeight])
            cube([gridLength+topOffset,gridWidth ,topThickness]);
            
            translate([gridLength,-3,gridHeight - boardHeight])
            cube([topOffset,largeThickness,boardHeight+topThickness]);
            
            translate([-smallThickness, 0,0])
            cube([smallThickness,gridWidth ,gridHeight +topThickness ]);
            
            translate([0,(gridWidth-smallThickness)/2-clickWidth,gridHeight/2])         cube([clickDepth -0.1,clickLength-0.5,clickWidth-0.5]);
        }   
        longHole();
    }
    
}
module sideGrid()
{
    if(bottom == true)
   gridBottom();
    if(top == true)
   sideTop();
}
module sideGrids()
{
    sideGrid();
    
    translate([boardThickness + 2*gridLength,0,0]) mirror([1,0,0]) sideGrid(); 
    
    translate([0,(gridWidth-smallThickness)*gridNumber+smallThickness,0]) mirror([0,1,0]) sideGrid(); 
    
    translate([boardThickness + 2*gridLength,(gridWidth-smallThickness)*gridNumber+smallThickness,0]) mirror([1,0,0]) mirror([0,1,0]) sideGrid(); 
}




