//import controlP5.*;

//ControlP5 jControl;
// Following parameters are input from user interface:
/*
String Name = "XXX";
int Extraversion=3;      // (0)=SeveralCircles, (1-2)=BlackAndVoilet, (3-4)=Composition8, (5-6)=OnWhiteII
int Neuroticism=3;       // 0:very unstable ... 6:very stable
int Openness=3;          // 0:closed and cold ... 6:very open and hospitable
int Agreeableness=3;     // 0:not easy-going ... 6:very easy going
int Conscientiousness=3; // 0:chaotic, undisciplined ... 6:very ordered and disciplined
// Input parameters stop here
*/
//boolean toDraw=false, stop=false; 

//Colors are coded inside individual methods
//Automatically generating different background colors ranged in color code of 20
//Fixed background color problem: strokeWeight(0) whenever after strokeWeight is used

int maxX=766, maxY=527; //No need to change for scaling up,640x442

int i, j, ind=0, ind0=0, colorCodeRange=100, NumOfCoords0=20, NumOfCoords=35, bgColorIndex, colorCt=35, margin=50;
int[] coordX0 = new int[NumOfCoords0], coordY0 = new int[NumOfCoords0]; //Coordinates on 4 sides
int[] coordX = new int[NumOfCoords-NumOfCoords0], coordY = new int[NumOfCoords-NumOfCoords0]; //Coordinates in the middle area
int[] colorsR = new int[NumOfCoords];
int[] colorsG = new int[NumOfCoords];
int[] colorsB = new int[NumOfCoords];
int[][] colorR = new int[NumOfCoords][colorCt], colorG = new int[NumOfCoords][colorCt], colorB = new int[NumOfCoords][colorCt];
int[] rad4BG = new int[NumOfCoords], radius = new int[NumOfCoords], increm = new int[NumOfCoords];
int[] angles = new int[NumOfCoords], lens = new int[NumOfCoords], gaps = new int[NumOfCoords];
int[] lineNo = new int[NumOfCoords];
int[] bg_r = new int[NumOfCoords], bg_g = new int[NumOfCoords], bg_b = new int[NumOfCoords];  
int sign;
PFont font;

void setup() {
  size(maxX, maxY); //Scale of 3
  
  font = createFont("arial", 20);
        
  textFont(font);
}

void draw() {
  //scale(2,2); //Largest possible scale is 17-17
  
  ind0=0;ind=0;
  int agree10 = Agreeableness*10;
  switch(Extraversion){
    case 0: //Following is for severalCircles
       for(i=0; i<NumOfCoords; i++){ 
         bg_r[i] = int(random(Agreeableness*5, agree10+10)); // was 0, 10);
         bg_g[i] = int(random(0, 10));
         bg_b[i] = int(random(0, 10));
         rad4BG[i] = int(random(80, 250));
         for(j=0; j<colorCt; j++){
           colorR[i][j] = int(random(bg_r[i]-colorCodeRange, bg_r[i]));
           colorG[i][j] = int(random(bg_g[i]-colorCodeRange, bg_g[i]));
           colorB[i][j] = int(random(bg_b[i]-colorCodeRange, bg_b[i]));        
         }
       }
       break;
    case 1: //Following is for blackAndViolet
       for(i=0; i<NumOfCoords; i++){
         bg_r[i] = int(random(agree10+100, agree10+140)); // was 140, 190)); 
         bg_g[i] = int(random(110, 120)); 
         bg_b[i] = int(random(agree10, agree10+30)); // was 10, 30)); 
         rad4BG[i] = int(random(180, 350)); 
         for(j=0; j<colorCt; j++){
           colorR[i][j] = int(random(bg_r[i]-colorCodeRange, bg_r[i]));
           colorG[i][j] = int(random(bg_g[i]-colorCodeRange, bg_g[i]));
           colorB[i][j] = int(random(bg_b[i]-colorCodeRange, bg_b[i]));        
         }
       }
      break; 
    case 2: //Following is for blackAndViolet
       for(i=0; i<NumOfCoords; i++){
         bg_r[i] = int(random(agree10+120, agree10+160)); //was 150, 210)); 
         bg_g[i] = int(random(120, 130)); 
         bg_b[i] = int(random(agree10, agree10+30)); //was 10, 30)); 
         rad4BG[i] = int(random(180, 350)); 
         for(j=0; j<colorCt; j++){
           colorR[i][j] = int(random(bg_r[i]-colorCodeRange, bg_r[i]));
           colorG[i][j] = int(random(bg_g[i]-colorCodeRange, bg_g[i]));
           colorB[i][j] = int(random(bg_b[i]-colorCodeRange, bg_b[i]));        
         }
       }
       break;       
    case 3: //Following is for composition8
       for(i=0; i<NumOfCoords; i++){
         bg_r[i] = int(random(agree10+160, agree10+180)); //was 188, 201));
         bg_g[i] = int(random(145, 205));
         bg_b[i] = int(random(142, 172));
         rad4BG[i] = int(random(180, 150)); 
         for(j=0; j<colorCt; j++){
           colorR[i][j] = int(random(bg_r[i]-colorCodeRange, bg_r[i]));
           colorG[i][j] = int(random(bg_g[i]-colorCodeRange, bg_g[i]));
           colorB[i][j] = int(random(bg_b[i]-colorCodeRange, bg_b[i]));        
         }
       }
       break;
    case 4: //Following is for composition8
       for(i=0; i<NumOfCoords; i++){
         bg_r[i] = int(random(agree10+170, agree10+190)); //was 201, 241));
         bg_g[i] = int(random(165, 225));
         bg_b[i] = int(random(162, 192));
         rad4BG[i] = int(random(180, 150)); 
         for(j=0; j<colorCt; j++){
           colorR[i][j] = int(random(bg_r[i]-colorCodeRange, bg_r[i]));
           colorG[i][j] = int(random(bg_g[i]-colorCodeRange, bg_g[i]));
           colorB[i][j] = int(random(bg_b[i]-colorCodeRange, bg_b[i]));        
         }
       }
       break;
    case 5: //Following is for onWhiteII
       for(i=0; i<NumOfCoords; i++){ 
         bg_r[i] = int(random(211, 221));
         bg_g[i] = int(random(215, 223));
         bg_b[i] = int(random(220-agree10, 240-agree10)); //was 225, 230));
         rad4BG[i] = int(random(180, 250));        
         for(j=0; j<colorCt; j++){
           colorR[i][j] = int(random(bg_r[i]-colorCodeRange, bg_r[i]));
           colorG[i][j] = int(random(bg_g[i]-colorCodeRange, bg_g[i]));
           colorB[i][j] = int(random(bg_b[i]-colorCodeRange, bg_b[i]));        
         }
       }
       break;
    case 6: //Following is for onWhiteII
       for(i=0; i<NumOfCoords; i++){ 
         bg_r[i] = int(random(221, 241));
         bg_g[i] = int(random(215, 223));
         bg_b[i] = int(random(200-agree10, 220-agree10)); //was 225, 240));
         rad4BG[i] = int(random(180, 250)); 
         for(j=0; j<colorCt; j++){
           colorR[i][j] = int(random(bg_r[i]-colorCodeRange, bg_r[i]));
           colorG[i][j] = int(random(bg_g[i]-colorCodeRange, bg_g[i]));
           colorB[i][j] = int(random(bg_b[i]-colorCodeRange, bg_b[i]));        
         }
       }  
  } // The above is for background colors
  for(i=0; i<NumOfCoords; i++){
    switch(Agreeableness){
      case 0:
      case 1:
         colorsR[i] = int(random(40, 100)); 
         colorsG[i] = int(random(85, 230)); ; 
         colorsB[i] = int(random(150, 255)); 
         break;
      case 2:
      case 3:
         colorsR[i] = int(random(140, 230)); 
         colorsG[i] = int(random(140, 230));
         colorsB[i] = int(random(50, 120));
         break;
      case 4:
      case 5:
      case 6:
         colorsR[i] = int(random(180, 245)); 
         colorsG[i] = int(random(40, 200)); 
         colorsB[i] = int(random(40, 80));   
    }  
    radius[i] = int(random(60-Openness*5, 100+Openness*20));  // More open, more vary-sized circles. was (20, 90)
    increm[i] = int(random(5*Openness, 30+10*Openness));       // More open, more variations
    angles[i] = int(random(10, 160-Conscientiousness*20)); //more harmoneous between (10, 80), was (0, 160)
    lens[i] = int(random(100-Openness*5, 120+Openness*40)); // was (100, 300));
    gaps[i] = int(random(10));
    lineNo[i] = int(random(6));
  }
  
  //Assigning coordinates now
  int xGap=maxX/8, yGap=maxY/6; 
  int margin = 30;
  // Four side margins
  for (i=1; i<8; i++){
    coordX0[i-1] = xGap*i; // Top row
    coordY0[i-1] = yGap-margin;
    coordX0[i+6] = xGap*i; // Bottom row
    coordY0[i+6] = maxY-yGap+margin;
  }
  for (i=1; i<4; i++){
    coordX0[i+13] = xGap-margin;      // Left column
    coordY0[i+13] = yGap*i;
    coordX0[i+16] = maxX-xGap+margin; // Right column
    coordY0[i+16] = yGap*i;
  }
  // Central area 
  for (i=1; i<6; i++)
    for (j=1; j<4; j++){
      coordX[ind] = xGap*(i+1);  
      coordY[ind] = yGap*(j+1);
      ind++;
  } 
  
  randomize(coordX, NumOfCoords-NumOfCoords0);
  randomize(coordY, NumOfCoords-NumOfCoords0);
  randomize(coordX0, NumOfCoords0);
  randomize(coordY0, NumOfCoords0);
  randomize(radius, NumOfCoords);
  randomize(increm, NumOfCoords);
  randomize(angles, NumOfCoords);
  randomize(lens, NumOfCoords);
  randomize(gaps, NumOfCoords); 
  bgColorIndex = int(random(NumOfCoords-1));
  //smooth();
  //clear();
  background(bg_r[bgColorIndex], bg_g[bgColorIndex], bg_b[bgColorIndex]);
   
  for(i=0; i<NumOfCoords0; i++){
        gradientCircle(colorR[bgColorIndex][i], colorG[bgColorIndex][i], colorB[bgColorIndex][i], coordX0[i], coordY0[i], rad4BG[i]);
     }
  for(i=NumOfCoords0; i<NumOfCoords; i++){
        gradientCircle(colorR[bgColorIndex][i], colorG[bgColorIndex][i], colorB[bgColorIndex][i], coordX[i-NumOfCoords0], coordY[i-NumOfCoords0], rad4BG[i]);
     }
 
 switch (Extraversion){
  case 0:
    severalCircles();
    break;
  case 1:
    blackAndViolet();
    break;
  case 2:
    blackAndViolet();
    break;
  case 3: 
    compositionVIII();
    break;
  case 4: 
    compositionVIII();
    break;
  case 5:
    onWhite();
    break;
  case 6:
    onWhite();
 }
   
   fill(255);
   text(Name, 620, 510);
  
   noLoop();
save(Name+".png");

//String imageFileName = Name + ".tiff";  
//save(imageFileName);
}

/////////////////////////////////////////////////////////////////////
void blackAndViolet(){
  int pos;
  //Large black circle with gradient outside  
  gradientEllipse(136, 34, 34, coordX[0], coordY[0], lens[0]+50, lens[0]+150);
  fill(10);
  ellipse(coordX[0], coordY[0], lens[0]+50, lens[0]+50);
  fill(random(35, 50), random(10, 30), random(10, 30), 220);
  largeQuad(lens[0], lens[1]-increm[0], lens[0]+lens[1]+100, lens[1]-increm[1], lens[0]+lens[2]+100, lens[1]+lens[0], lens[0]-increm[2], lens[1]+lens[2]);
  fill(30);
  ellipse(coordX[2]-lens[2]/3, coordY[2], radius[2]+30, radius[2]+30); //white circle inside black one
  fill(255, 235, 230, 180);
  ellipse(coordX[2]-lens[2]/3, coordY[2], radius[2], radius[2]); //white circle inside black one
  for (i=3; i<5; i++){
        coloredTriangle(coordX[i]-lens[i]/3, coordY[i], angles[i], radius[i], 10, 
          187,187,68, colorsR[i],colorsG[i],colorsB[i], colorsR[i-1],colorsG[i-1],colorsB[i-1]); 
  }
  
  stroke(0);
  strokeWeight(0);
  switch (Neuroticism){
    case 0:
      fill(Agreeableness*85, 105, 255-Agreeableness*50, 180);
      for (i=10; i<12; i++){
        sign = int(pow(-1,i));
        arcFlag(coordX0[i], coordY0[i], lens[i], lens[i], 90-Conscientiousness*15*sign); //was angles[0]); 
        fanLines(coordX0[i+2]-lens[i+2]/3, coordY0[i+2]-100, lens[i+2]-lens[i+2]/3, 160); 
      }
      for (i=14; i<17; i++){
        sign = int(pow(-1,i));
        threeTriangles(coordX0[i], coordY0[i], lens[i]/3, colorsR[i],colorsG[i],colorsB[i], 90-Conscientiousness*15*sign);
        gridNoFill(coordX0[i+3], coordY0[i+3], 4, 5, 20, Conscientiousness*15*sign);
      }
      break;
    case 1:
      arcFlag(coordX0[10], coordY0[10], lens[10], lens[10], 90-Conscientiousness*15); //was angles[0]); 
      arcStrips(coordX0[11], coordY0[11], int(random(300,400)));
      fanLines(coordX0[11]-lens[11]/3, coordY0[11]-100, lens[11]-lens[11]/3, 160);
      triangleOnCircle(colorsR[13],colorsG[13],colorsB[13], colorsB[13],colorsG[13],colorsR[13], 120, coordX0[13]-lens[13], coordY0[13]+lens[13], 
        coordX0[13], coordY0[13], coordX0[13]-lens[13]/2, coordY0[13]+lens[13], radius[13]*2);
      //triangleOnCircle(int triaColorR,int triaColorG,int triaColorB, int cirColorR,int cirColorG,int cirColorB, 
      //   int transparency, int aX, int aY, int bX, int bY, int cX, int cY, int radius)
      fill(colorsR[i], colorsG[i], colorsB[i], 180);
      ellipse(coordX0[14], coordY0[14], lens[14], lens[14]);
      twoCircles(coordX0[15], coordY0[15]-increm[15], false, 0,0,0, radius[15]-increm[15], false, 0, 
         colorsR[15],colorsG[15],colorsB[15], radius[15], true);
      for (i=16; i<18; i++){
        sign = int(pow(-1,i));
        threeTriangles(coordX0[i], coordY0[i], lens[i]/3, colorsR[i],colorsG[i],colorsB[i], 90-Conscientiousness*15*sign);
        gridNoFill(coordX0[i+2], coordY0[i+2], 4, 5, 20, Conscientiousness*15*sign);
      }
      break;
    case 2:
    case 3:
    case 4:
       arcFlag(coordX0[10], coordY0[10], lens[10], lens[10], 90-Conscientiousness*15); //was angles[0]); 
       arcStrips(coordX0[11], coordY0[11], int(random(300,400)));
       fanLines(coordX0[11]-lens[11]/3, coordY0[11]-100, lens[11]-lens[11]/3, 160);
       triangleOnCircle(colorsR[13],colorsG[13],colorsB[13], colorsB[13],colorsG[13],colorsR[13], 120, coordX0[13]-lens[13], coordY0[13]+lens[13], 
         coordX0[13], coordY0[13], coordX0[13]-lens[13]/2, coordY0[13]+lens[13], radius[13]*2);
       threeTriangles(coordX0[14], coordY0[14], lens[14]/3, colorsR[14],colorsG[14],colorsB[14], 90-Conscientiousness*15);
       gridNoFill(coordX0[15], coordY0[15], 4, 5, 20, Conscientiousness*15);
       for (i=16; i<18; i++){
         fill(colorsR[i], colorsG[i], colorsB[i], 180);
         ellipse(coordX0[i], coordY0[i], lens[i], lens[i]);
         twoCircles(coordX0[i+2], coordY0[i+2]-increm[i+2], false, 0,0,0, radius[i+2]-increm[i+2], false, 0, 
           colorsR[i+2],colorsG[i+2],colorsB[i+2], radius[i+2], true);
       }
       break;
    case 5:
       arcFlag(coordX0[10], coordY0[10], lens[10], lens[10], 90-Conscientiousness*15); //was angles[0]); 
       arcStrips(coordX0[11], coordY0[11], int(random(300,400)));
       fanLines(coordX0[11]-lens[11]/3, coordY0[11]-100, lens[11]-lens[11]/3, 160);
       fill(colorsR[i], colorsG[i], colorsB[i], 180);
       ellipse(coordX0[13], coordY0[13], lens[13], lens[13]);
       threeTriangles(coordX0[14], coordY0[14], lens[14]/3, colorsR[14],colorsG[14],colorsB[14], 90-Conscientiousness*15);
       gridNoFill(coordX0[15], coordY0[15], 4, 5, 20, Conscientiousness*15);
       for (i=16; i<18; i++){
         triangleOnCircle(colorsR[i],colorsG[i],colorsB[i], colorsB[i],colorsG[i],colorsR[i], 120, coordX0[i]-lens[i], coordY0[i]+lens[i], 
           coordX0[i], coordY0[i], coordX0[i]-lens[i]/2, coordY0[i]+lens[i], radius[i]*2);
         twoCircles(coordX0[i+2], coordY0[i+2]-increm[i+2], false, 0,0,0, radius[i+2]-increm[i+2], false, 0, 
           colorsR[i+2],colorsG[i+2],colorsB[i+2], radius[i+2], true);
       }
       break;
    case 6:
       for (i=10; i<12; i++){
         triangleOnCircle(colorsR[i],colorsG[i],colorsB[i], colorsB[i],colorsG[i],colorsR[i], 120, coordX0[i]-lens[i], coordY0[i]+lens[i], 
           coordX0[i], coordY0[i], coordX0[i]-lens[i]/2, coordY0[i]+lens[i], radius[i]*2);
         arcStrips(coordX0[i+2], coordY0[i+2], int(random(300,400)));
       }
       for (i=14; i<17; i++){
         fill(colorsR[i], colorsG[i], colorsB[i], 180);
         ellipse(coordX0[i], coordY0[i], lens[i], lens[i]);
         twoCircles(coordX0[i+3], coordY0[i+3]-increm[i+3], false, 0,0,0, radius[i+3]-increm[i+3], false, 0, 
           colorsR[i+3],colorsG[i+3],colorsB[i+3], radius[i+3], true);
       }
    }
  
  // Objects on four sides
  
  for (i=0; i<2; i++){
     fill(colorsR[i], colorsG[i], colorsB[i]);
     rect(coordX0[i], coordY0[i], 13, 13);
     rect(coordX0[i]+20, coordY0[i]-20, 13, 13);
  }
  
  for(i=2; i<6; i++){
     sign = int(pow(-1,i));
     stroke(10);
     lines(coordX0[i], coordY0[i], lens[i], 20-Agreeableness*2, 1, Neuroticism*15*sign); //was angles[i]);
     lines(coordX0[i]+increm[i]*2, coordY0[i]+increm[i]*2, lens[i], 16-Agreeableness*2, 1, Neuroticism*15*sign);
  }
  
  //fanLines(coordX0[5], coordY0[5], radius[5], 90+Conscientiousness*15); // was angles[19]);
  
  //twoCircles(int centerX, int centerY, boolean outBorder, int outBorderColorR,int outBorderColorG,int outBorderColorB, 
  //   int outRadius, boolean inBorder, int inBorderWeight, int inBorderColorR,int inBorderColorG,int inBorderColorB, 
  //   int inRadius, boolean gradient)
  
  arcs(coordX0[6], coordY0[6], 4, 70, 20, colorsR[6],colorsG[6],colorsB[6], 200, 90+Conscientiousness*15); 
  arcs(coordX0[7], coordY0[7], 4, 80, 30, 190,170,0, 230, 90-Conscientiousness*15); 
     
  strokeWeight(2);
  fill(colorsR[8], colorsG[8], colorsB[8], 180);
  triangle(coordX0[8], coordY0[8], coordX0[8]+lens[8], coordY0[8]+radius[8], coordX0[8]+radius[7], coordY0[8]+lens[7]);

  //gradientEllipse(int gradColorR, int gradColorG, int gradColorB, int centerX, int centerY, int inRadius, int outRadius)
  gradientEllipse(colorsR[9], colorsG[9], colorsB[9], coordX0[9], coordY0[9], lens[9]-40, lens[9]+60);
  fill(50);
  ellipse(coordX0[9], coordY0[9], lens[9], lens[9]);
  strokeWeight(0);
}

//==================================================================================
void compositionVIII(){
 
//Middle objects:
   int factor = Conscientiousness*6;
   for(i=0; i<2; i++){
      gradientArc(colorsR[i],colorsG[i],colorsB[i], coordX[i], coordY[i], 90-factor*(i+1), 90+factor*(i+1), lens[i]); 
      fork(10, 1, coordX[i], coordY[i], cos(radians(90-factor*(i+1)))*lens[i]+coordX[i], sin(radians(90-factor*(i+1)))*lens[i]+coordY[i], 
        cos(radians(90+factor*(i+1)))*lens[i]+coordX[i], sin(radians(90+factor*(i+1)))*lens[i]+coordY[i]);
   }
   
   arc4Lines(coordX[2], coordY[2], 150, 104);
   concentricArcs(coordX[3], coordY[3], increm[3], radius[3], colorsR[3],colorsG[3],colorsB[3], angles[3]);
   
   if (Neuroticism < 3){
     for(i=4; i<6; i++)
       coloredTriangle(coordX[i], coordY[i], angles[i], radius[i]+20, 10, colorsR[i],colorsG[i],colorsB[i], 
          colorsR[i-1],colorsG[i-1],colorsB[i-1], colorsR[i+1],colorsG[i+1],colorsB[i+1]);      
     if (Neuroticism < 2)
       blackTriangle(lens[i], lens[i], coordX[i], coordY[i]-increm[i], coordX[i]+increm[i], coordY[i]+increm[i]);
   }
   
   circleAnd3Triangles(coordX[10], coordY[10], 1);
   //arcs(int centerX, int centerY, int numOfArcs, int largeRadius, int smallRadius, 
   //  int fillColorR,int fillColorG,int fillColorB, int transparency, int rotAngle)
   arcs(coordX[11], coordY[11], 4, 55, 55, 230,210,80, 60, Conscientiousness*15+90);
   arcs(coordX[12], coordY[12], 4, 35, 12, 240,250,250, 60, Conscientiousness*15-90);
   for(i=13; i<15; i++){
      sign = int(pow(-1,i));
      coloredLine(coordX[i], coordY[i], radius[i], Conscientiousness*15*sign, 
        colorsR[i],colorsG[i],colorsB[i], colorsR[i-1],colorsG[i-1],colorsB[i-1], colorsR[i-2],colorsG[i-2],colorsB[i-2]);
      //stroke(10);
      //lines(coordX0[i+2], coordY0[i+2], lens[i]/2, increm[i]/2, lineNo[i], Neuroticism*15*sign); // was angles[i]);
   }
   
   //Edge objects:
   multiBezier(coordX0[0], coordY0[0], 15);
   checker(coordX0[1], coordY0[1], Conscientiousness*15, 5, 5, 12, 13, 20,20,20, colorsR[1],colorsG[1],colorsB[1], 180);
   checker(coordX0[2], coordY0[2], -Conscientiousness*15, 5, 5, 12, 13, 20,20,20, colorsR[2],colorsG[2],colorsB[2], 180); 
   //checker(int topLeftX, int topLeftY, int rotAngle, int cols, int rows, int wid, int hei, 
   //  int borderColorR,int borderColorG,int borderColorB, int fillColorR,int fillColorG,int fillColorB, int transparency)
   circleAnd3Triangles(coordX0[3], coordY0[3], 1);
   
   strokeWeight(3);
   arcLine(coordX0[4], coordY0[4], radius[4]/2, Conscientiousness*15);
   arcLine(coordX0[5], coordY0[5], radius[5]/2, -Conscientiousness*15);
   strokeWeight(0);
   
   //Large black circle with gradient outside
   gradientEllipse(120, 44, 44, coordX0[6], coordY0[6], radius[6]+50, radius[6]+150);
   stroke(20);
   strokeWeight(30);
   ellipse(coordX0[6], coordY0[6], radius[6]+50, radius[6]+50);
   strokeWeight(0);
   
   switch (Neuroticism){
     case 0:
       for(i=7; i<9; i++){ // 2 copies each shape
         coloredTriangle(coordX0[i], coordY0[i], angles[i], radius[i]+20, 10, colorsR[i],colorsG[i],colorsB[i], 
           colorsR[i-1],colorsG[i-1],colorsB[i-1], colorsR[i+1],colorsG[i+1],colorsB[i+1]);      
         blackTriangle(lens[i+2], lens[i+2], coordX0[i+2], coordY0[i+2]-increm[i+2], coordX0[i+2]+increm[i+2], coordY0[i+2]+increm[i+2]);
         fill(10); // folowing is a double-rectangle
         rect(coordX0[i+4], coordY0[i+4], 13, 13);
         rect(coordX0[i+4]+20, coordY0[i+4]-20, 13, 13);
         grid(coordX0[i+6], coordY0[i+6], 3, 3, 16, colorsR[i+6],colorsG[i+6],colorsB[i+6], colorsR[i+6],colorsG[i+6],colorsB[i+6]);
         doubleArrow(50, colorsR[i+8],colorsG[i+8],colorsB[i+8], coordX0[i+8], coordY0[i+8], 60, 169, 115, 6);
       }
       for(i=17; i<20; i++){ // 3 copies each shape
         strokeWeight(5);
         sign = int(pow(-1,i));
         stroke(colorsR[i],colorsG[i],colorsB[i]);
         crosses(coordX0[i], coordY0[i], lens[i]+100, 3, gaps[i], Conscientiousness*15*sign); //angles[i]);
       }
       break;
     case 1:
       for(i=7; i<9; i++){
         coloredTriangle(coordX0[i], coordY0[i], angles[i], radius[i]+20, 10, colorsR[i],colorsG[i],colorsB[i], 
           colorsR[i-1],colorsG[i-1],colorsB[i-1], colorsR[i+1],colorsG[i+1],colorsB[i+1]);      
       fill(10); // folowing is a double-rectangle
       rect(coordX0[9], coordY0[9], 13, 13);
       rect(coordX0[9]+20, coordY0[9]-20, 13, 13);
       grid(coordX0[10], coordY0[10], 3, 3, 16, colorsR[10],colorsG[10],colorsB[10], colorsR[10],colorsG[10],colorsB[10]);
       doubleArrow(50, colorsR[11],colorsG[11],colorsB[11], coordX0[11], coordY0[11], 60, 169, 115, 6);
       blackTriangle(lens[12], lens[12], coordX0[12], coordY0[12]-increm[12], coordX0[12]+increm[12], coordY0[12]+increm[12]);
       for(i=13; i<15; i++){
         strokeWeight(5);
         sign = int(pow(-1,i));
         stroke(colorsR[i],colorsG[i],colorsB[i]);
         crosses(coordX0[i], coordY0[i], lens[i]+100, 3, gaps[i], Conscientiousness*15*sign); //angles[i]);
       }
       for(i=15; i<17; i++) 
         if (Agreeableness<3)
           twoCircles(coordX0[i], coordY0[i], true, 0,0,0, radius[i]+increm[i], true, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], false); 
         else
           twoCircles(coordX0[i], coordY0[i], false, 0,0,0,radius[i]+increm[i], false, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], true); 
       }
       noStroke();
       triangleOnCircle(colorsR[17],colorsG[17],colorsB[17], colorsB[17],colorsG[17],colorsR[17], 140, coordX0[17]-radius[17], coordY0[17]+radius[17], 
           coordX0[17], coordY0[17], coordX0[17]-radius[17]/2, coordY0[17]+radius[17], radius[17]);
       overlapRect(coordX0[18], coordY0[18], colorsR[18], colorsB[18]);
       arcs(coordX0[19], coordY0[19], 5, 35, 25, 250,230,230, 60, Conscientiousness*15-90);
       strokeWeight(0);
       break;
     case 2:
       coloredTriangle(coordX0[7], coordY0[7], angles[7], radius[7]+20, 10, colorsR[7],colorsG[7],colorsB[7], 
           colorsR[6],colorsG[6],colorsB[6], colorsR[8],colorsG[8],colorsB[8]);      
       fill(10); // folowing is a double-rectangle
       rect(coordX0[8], coordY0[8], 13, 13);
       rect(coordX0[8]+20, coordY0[8]-20, 13, 13);
       grid(coordX0[9], coordY0[9], 3, 3, 16, colorsR[9],colorsG[9],colorsB[9], colorsR[9],colorsG[9],colorsB[9]);
       doubleArrow(50, colorsR[10],colorsG[10],colorsB[10], coordX0[10], coordY0[10], 60, 169, 115, 6);
       stroke(colorsR[11],colorsG[11],colorsB[11]);
       crosses(coordX0[11], coordY0[11], lens[11]+100, 3, gaps[11], Conscientiousness*15); 
       for(i=12; i<15; i++) 
         if (Agreeableness<3)
           twoCircles(coordX0[i], coordY0[i], true, 0,0,0, radius[i]+increm[i], true, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], false); 
         else
           twoCircles(coordX0[i], coordY0[i], false, 0,0,0,radius[i]+increm[i], false, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], true); 
       noStroke();
       for(i=15; i<17; i++){ 
         sign = int(pow(-1,i));
         arcs(coordX0[i], coordY0[i], 5, 35, 25, 250,230,230, 60, Conscientiousness*15-90*sign);
       }
       triangleOnCircle(colorsR[17],colorsG[17],colorsB[17], colorsB[17],colorsG[17],colorsR[17], 140, coordX0[17]-radius[17], coordY0[17]+radius[17], 
           coordX0[17], coordY0[17], coordX0[17]-radius[17]/2, coordY0[17]+radius[17], radius[17]);
       overlapRect(coordX0[18], coordY0[18], colorsR[18], colorsB[18]);
       strokeWeight(0);
       break;
     case 3:
     case 4:
       coloredTriangle(coordX0[7], coordY0[7], angles[7], radius[7]+20, 10, colorsR[7],colorsG[7],colorsB[7], 
           colorsR[6],colorsG[6],colorsB[6], colorsR[8],colorsG[8],colorsB[8]);      
       fill(10); // folowing is a double-rectangle
       rect(coordX0[8], coordY0[8], 13, 13);
       rect(coordX0[8]+20, coordY0[8]-20, 13, 13);
       grid(coordX0[9], coordY0[9], 3, 3, 16, colorsR[9],colorsG[9],colorsB[9], colorsR[9],colorsG[9],colorsB[9]);
       doubleArrow(50, colorsR[10],colorsG[10],colorsB[10], coordX0[10], coordY0[10], 60, 169, 115, 6);
       crosses(coordX0[11], coordY0[11], lens[11]+100, 3, gaps[11], Conscientiousness*15); 
       for(i=12; i<14; i++) 
         if (Agreeableness<3)
           twoCircles(coordX0[i], coordY0[i], true, 0,0,0, radius[i]+increm[i], true, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], false); 
         else
           twoCircles(coordX0[i], coordY0[i], false, 0,0,0,radius[i]+increm[i], false, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], true); 
       for(i=14; i<16; i++){
         sign = int(pow(-1,i));
         noStroke();
         triangleOnCircle(colorsR[i],colorsG[i],colorsB[i], colorsB[i],colorsG[i],colorsR[i], 140, coordX0[i]-radius[i], coordY0[i]+radius[i], 
           coordX0[i], coordY0[i], coordX0[i]-radius[i]/2*sign, coordY0[i]+radius[i], radius[i]);
         overlapRect(coordX0[i+2], coordY0[i+2], colorsR[i+2], colorsB[i+2]);
         arcs(coordX0[i+4], coordY0[i+4], 5, 35, 25, 250,230,230, 60, Conscientiousness*15-90*sign);
         strokeWeight(0);
       }    
       break;
     case 5:
       coloredTriangle(coordX0[7], coordY0[7], angles[7], radius[7]+20, 10, colorsR[7],colorsG[7],colorsB[7], 
           colorsR[6],colorsG[6],colorsB[6], colorsR[8],colorsG[8],colorsB[8]);      
       fill(10); // folowing is a double-rectangle
       rect(coordX0[8], coordY0[8], 13, 13);
       rect(coordX0[8]+20, coordY0[8]-20, 13, 13);
       grid(coordX0[9], coordY0[9], 3, 3, 16, colorsR[9],colorsG[9],colorsB[9], colorsR[9],colorsG[9],colorsB[9]);
       doubleArrow(50, colorsR[10],colorsG[10],colorsB[10], coordX0[10], coordY0[10], 60, 169, 115, 6);
       for(i=11; i<14; i++) 
         if (Agreeableness<3)
           twoCircles(coordX0[i], coordY0[i], true, 0,0,0, radius[i]+increm[i], true, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], false); 
         else
           twoCircles(coordX0[i], coordY0[i], false, 0,0,0,radius[i]+increm[i], false, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], true); 
       for(i=14; i<16; i++){
         sign = int(pow(-1,i));
         noStroke();
         triangleOnCircle(colorsR[i],colorsG[i],colorsB[i], colorsB[i],colorsG[i],colorsR[i], 140, coordX0[i]-radius[i], coordY0[i]+radius[i], 
           coordX0[i], coordY0[i], coordX0[i]-radius[i]/2*sign, coordY0[i]+radius[i], radius[i]);
         overlapRect(coordX0[i+2], coordY0[i+2], colorsR[i+2], colorsB[i+2]);
         arcs(coordX0[i+4], coordY0[i+4], 5, 35, 25, 250,230,230, 60, Conscientiousness*15-90*sign);
         strokeWeight(0);
       }    
       break;
     case 6:
       for(i=7; i<11; i++) 
         if (Agreeableness<3)
           twoCircles(coordX0[i], coordY0[i], true, 0,0,0, radius[i]+increm[i], true, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], false); 
         else
           twoCircles(coordX0[i], coordY0[i], false, 0,0,0,radius[i]+increm[i], false, 0, colorsR[i-1], colorsG[i-1],colorsB[i-1], radius[i], true); 
       }
       for(i=11; i<14; i++){
         sign = int(pow(-1,i));
         noStroke();
         triangleOnCircle(colorsR[i],colorsG[i],colorsB[i], colorsB[i],colorsG[i],colorsR[i], 140, coordX0[i]-radius[i], coordY0[i]+radius[i], 
           coordX0[i], coordY0[i], coordX0[i]-radius[i]/2*sign, coordY0[i]+radius[i], radius[i]);
         overlapRect(coordX0[i+3], coordY0[i+3], colorsR[i+3], colorsB[i+3]);
         arcs(coordX0[i+6], coordY0[i+6], 5, 35, 25, 250,230,230, 60, Conscientiousness*15-90*sign);
         strokeWeight(0);
       }
}

//==================================================================================
void onWhite(){
   //Middle objects:
   fill(random(20, 40), random(30, 60), random(0, 20), 190);
   largeQuad(radius[4], lens[5]-lens[5]/2, lens[4]+lens[6]+100, lens[5]-lens[6]/2, lens[4]+lens[7]+100, lens[5]+lens[4]/2, lens[4]-increm[6], lens[5]+lens[6]/2);
   
   strokeWeight(0);
   if(coordX[0]==coordY[0]){
     blackTriangle(int(random(20,60)), int(random(maxY-150, maxY-50)), int(random(maxX-50,maxX-150)), int(random(20,60)), int(random(maxX-50,maxX-150)), int(random(50, 150))-increm[1]);
     largeTriangleArcs(maxX-radius[0],increm[0], 300, int(random(140,152))); 
     //largeTriangleArcs(radius[0],increm[0], maxX/(Neuroticism*3+1), int(random(20,50))); 
   }
   else{
     blackTriangle(int(random(20,60)), int(random(50, 150)), int(random(20,60)), int(random(50, 150))-increm[1]*3, int(random(maxX-50,maxX-150)), int(random(maxY-150, maxY-50)));
     largeTriangleArcs(maxX-radius[0],increm[0], 300, int(random(140,152))); 
     //largeTriangleArcs(maxX-radius[0],increm[0], maxX/(Neuroticism*3+1), int(random(140,152))); 
   }
   //largeTriangleArcs(radius[0],increm[0], maxX, int(random(18,52))); //Northwest-Southeast
   noStroke();
   fill(colorsR[0], colorsG[0], colorsB[0], 200);
   triangle(radius[0], radius[1], radius[0]+lens[1], radius[1]+radius[0], radius[0]+lens[2], radius[1]+lens[2]);
   //Position related to the above yellow triangle
   twoArcs(radius[0]+250, radius[1]+70, 180, 0);
   
   // Triangles were here
   
   fill(colorsR[10],colorsG[10],colorsB[10],  190);
   quad(coordX[10], coordY[10], coordX[11], coordY[11], coordX[12], coordY[12], coordX[13], coordY[13]);  
   //Positions are related to the large quad on top
   for(i=1; i<5; i++)
       halfCircleOnTriangle(radius[4]+int(random(lens[4]))+i*50, lens[5]-int(random(lens[5])/3), 25, int(random(0,360)));
   
   //Edge objects:
   redBlackCross(coordX0[0], coordY0[0], 200, -Conscientiousness*15, bgColorIndex); // was angles[8]
   redBlackCross(coordX0[1], coordY0[1], 200, Conscientiousness*15, bgColorIndex); //was angles[11], added 13 May 2015
   for(i=2;i<4;i++){
     sign = int(pow(-1,i));
     checker(coordX0[i], coordY0[i],Conscientiousness*15*sign, 4, 4, 17, 17, 20,20,20, colorsR[i],colorsG[i],colorsB[i], 180); // was angles[13+1]
   }
   checker(coordX0[4], coordY0[4], Conscientiousness*15, 3, 4, 12, 14, 20,20,20, colorsR[4],colorsG[4],colorsB[4], 250); // was angles[16]
   for(i=5; i<7; i++){
     stroke(10);
     sign = int(pow(-1,i));
     lines(coordX0[i], coordY0[i], lens[i]/2, increm[i]/3, int(random(3,5)), Neuroticism*15*sign);
   }
   
   switch (Neuroticism){
     case 0:
       fill(10);
       for(i=7; i<12; i++) {
         sign = int(pow(-1,i));
         rect(coordX0[i], coordY0[i], 14, 14);  
         noStroke();
         fill(colorsR[i+5],colorsG[i+5],colorsB[i+5], 210);
         triangle(coordX0[i+5], coordY0[i+5], coordX0[i+5]+increm[i+5]*sign, coordY0[i+5]+lens[i+5]*sign, coordX0[i+5]+lens[i+5]-increm[i+4], coordY0[i+5]-radius[i+5]);
       } // up to 16
       break;
     case 1:
       for(i=7; i<11; i++) {
         sign = int(pow(-1,i));
         rect(coordX0[i], coordY0[i], 14, 14);  
         noStroke();
         fill(colorsR[i+4],colorsG[i+4],colorsB[i+4], 210);
         triangle(coordX0[i+4], coordY0[i+4], coordX0[i+4]+increm[i+4]*sign, coordY0[i+4]+lens[i+4]*sign, coordX0[i+4]+lens[i+4]-increm[i+3], coordY0[i+4]-radius[i+4]);
       } // up to 14
       for (i=14; i<17; i++){
         fill(95+i*10, 10, 10, i*12);
         ellipse(coordX0[i], coordY0[i], increm[i]/2, increm[i]/2); 
       } 
       break;
     case 2:
       for(i=7; i<10; i++) {
         sign = int(pow(-1,i));
         rect(coordX0[i], coordY0[i], 14, 14);  
         noStroke();
         fill(colorsR[i+3],colorsG[i+3],colorsB[i+3], 210);
         triangle(coordX0[i+3], coordY0[i+3], coordX0[i+3]+increm[i+3]*sign, coordY0[i+3]+lens[i+3]*sign, coordX0[i+3]+lens[i+3]-increm[i+2], coordY0[i+3]-radius[i+3]);
       } // up to 12
       for (i=12; i<17; i++){
         fill(95+i*10, 10, 10, i*12);
         ellipse(coordX0[i], coordY0[i], increm[i]/2, increm[i]/2); 
       }
       break;
     case 3:
     case 4:
       for(i=7; i<9; i++) {
         rect(coordX0[i], coordY0[i], 14, 14);  
         noStroke();
         fill(colorsR[i+2],colorsG[i+2],colorsB[i+2], 210);
         triangle(coordX0[i+2], coordY0[i+2], coordX0[i+2]+increm[i+2], coordY0[i+2]+lens[i+2], coordX0[i+2]+lens[i+2]-increm[i+1], coordY0[i+2]-radius[i+2]);
       } // up to 10
       for (i=10; i<17; i++){
         fill(95+i*10, 10, 10, i*12);
         ellipse(coordX0[i], coordY0[i], increm[i]/2, increm[i]/2); 
       }
       break;
     case 5:
       rect(coordX0[7], coordY0[7], 14, 14);  
       noStroke();
       fill(colorsR[8],colorsG[8],colorsB[8], 210);
       triangle(coordX0[8], coordY0[8], coordX0[8]+increm[8], coordY0[8]+lens[8], coordX0[8]+lens[8]-increm[8], coordY0[8]-radius[8]);
       for (i=9; i<17; i++){
         fill(90+i*10, 10, 10, i*12);
         ellipse(coordX0[i], coordY0[i], increm[i]/2, increm[i]/2); 
       }
       break;
     case 6:
       noStroke();
       for (i=7; i<17; i++){
         fill(95+i*10, 10, 10, i*12);
         ellipse(coordX0[i], coordY0[i], increm[i]/2, increm[i]/2); 
       }
   }
     
   fill(148, 119, 17, 220);
   triangle(coordX0[17], coordY0[17], coordX0[17]+radius[17]*2, coordY0[17]-radius[17], coordX0[17]+radius[17]*2, coordY0[17]-radius[17]*2);
   
   circleAnd3Triangles(coordX0[18], coordY0[18], 1);   
   circleAnd3Triangles(coordX0[19], coordY0[19], 2);   
}

//==================================================================================
void severalCircles(){
noStroke();

// Center objects
int size = lens[0]*2;
switch (Agreeableness){
   case 0:  // boundaries but no outside gradient
   case 1:
     twoCircles(coordX[0], coordY[0], true, 0,0,0,size+radius[0], true, 0,0,0, 40, size+radius[0]/2, false);
     break;
   case 2:  // boundaries with outside gradient
   case 3:
     twoCircles(coordX[0], coordY[0], true, 0,0,0, size+radius[0], true, 0,0,0, 40, size+radius[0]/2, true);
     break;
   case 4:  // outser boundary only with outside gradient
     twoCircles(coordX[0], coordY[0], false, 0,0,0, size+radius[0], true, 0,0,0, 40, size+radius[0]/2, true);
     break;
   case 5:
   case 6:  // no boundary but with outside gradient
     twoCircles(coordX[0], coordY[0], false, 0,0,0, size+radius[0], false, 0,0,0, 40, size+radius[0]/2, true);
}

for(i=0; i<10; i++){
   fill(colorsR[i], colorsG[i], colorsB[i]);
   ellipse(coordX[i], coordY[i]-increm[i], increm[i], increm[i]); // central area
}

// Edge objects
for(i=0; i<5; i++) 
   gradientEllipse(int(random(88,236)), 136, int(random(20,230)), coordX0[i], coordY0[i]+increm[i], radius[i], radius[i]+increm[i]); 

for(i=5; i<12; i++){
   fill(colorsR[i], colorsG[i], colorsB[i], 150);
   ellipse(coordX0[i], coordY0[i]-increm[i], radius[i], radius[i]);  // on 4 sides
}

for(i=12; i<19; i++) 
   if (Agreeableness<3)
      twoCircles(coordX0[i], coordY0[i]-increm[i]*2, true, 0,0,0, radius[i]+increm[i], true, 0, colorsR[i], colorsG[i], colorsB[i], radius[i], false);
   else
      twoCircles(coordX0[i], coordY0[i]-increm[i]*2, false, 0,0,0, radius[i]+increm[i], false, 0, colorsR[i], colorsG[i], colorsB[i], radius[i], true);

}

////////////////////////////////////////////////////// 
  //arcLine(int centerX, int centerY, int radius, int rotAngle)
  //arc3Lines(int centerX, int centerY, int len, int radius)
  //arcs(int centerX, int centerY, int numOfArcs, int largeRadius, int smallRadius, int fillColor, int transparency, int rotAngle)
  //blackTriangle(int aX, int aY, int bX, int bY, int cX, int cY)
  //checker(int topLeftX, int topLeftY, int angle, int cols, int rows, int width, int height, int borderColor, int fillColor, int transparency)   
  //circleAnd3Triangles(int centerX, int centerY)
  //coloredLine(int startX, int startY, int len, int angle, int color1, int color2, int color3)
  //coloredTriangle(int startX, int startY, int rotAngle, int len, int inAngle, int color1, int color2, int color3)
  //crosses(int startX, int startY, int len, int thickness, int randomGap, int rotAngle)
  //doubleArrow(int color1, int color2, int headX, int headY, int startAngle, int endAngle, int len, int thickness)
  //fork(int lineColor, int lineWeight, int centerX, int centerY, float rightX, float rightY, float leftX, float leftY)
  //gradientEllipse(int gradColor, int centerX, int centerY, int inRadius, int outRadius)
  //gradientArc(int fillColor, int centerX, int centerY, int startAngle, int endAngle, int radius)
  //grid(int topLeftX, int topLeftY, int cols, int rows, int gap, int color1, int color2)
  //largeQuad(int fillColor, int aX, int aY, int bX, int bY, int cX, int cY, int dX, int dY)
  //lines(int startX, int startY, int len, int gap, int number, int rotAngle)
  //multiBezier(int centerX, int centerY, int unit)
  //overlapRect(int centerX, int centerY, int color1, int color2)
  //threeTriangles(int centerX, int centerY, int hei, int fillColor, int rotAngle){
  //twoCircles(int centerX, int centerY, boolean outBorder, int outBorderColorR,int outBorderColorG,int outBorderColorB, 
  //   int outRadius, boolean inBorder, int inBorderWeight, int inBorderColorR,int inBorderColorG,int inBorderColorB, 
  //   int inRadius, boolean gradient)
  //triangleOnCircle(int triaColorR,int triaColorG,int triaColorB, int cirColorR,int cirColorG,int cirColorB, 
  //   int transparency, int aX, int aY, int bX, int bY, int cX, int cY, int radius)
    
//1:black arc + flag 
void arcFlag(int centerX, int centerY, int len, int radius, int rotAngle){
   translate(centerX, centerY);
   rotate(radians(rotAngle));
   stroke(0);
   noFill();
   strokeWeight(4);
   strokeCap(SQUARE);
   for(int i=0; i<5; i++)
      arc(0, len/3, radius-i*6, radius, radians(30)-i*0.015F, radians(125)-i*0.2F);
   strokeWeight(2);
   line(30, 0, 30, len);
   fill(221, 136, 17); 
   triangle(30, -10, -len/3, len/2, 30, len*3/5);
   strokeWeight(0);
   
   //fill(221, 51, 0); 
   //PFont font;
   //font = loadFont("14minutessharp-50.vlw");
   //textFont(font);
   //rotate(radians(182));
   //text("Kang Zhang", 0, 10);
   //rotate(radians(-182));
   
   rotate(radians(-rotAngle));
   translate(-centerX, -centerY);
}

//2:black arc + lines group in top left quadrant
void arc4Lines(int centerX, int centerY, int len, int radius){
   translate(centerX, centerY);
   stroke(0);
   strokeWeight(3);
   strokeCap(SQUARE);
   noFill();
   for(int i=0; i<4; i++)
      arc(10, len/2, radius, radius-i*5, radians(2), radians(105));
   strokeWeight(1);
   line(30, 0, 30, len);
   line(14, 39, 51, 39);
   line (17, 47, 54, 47);
   line (6, 4, 83, 39);
   strokeWeight(0);
   translate(-centerX, -centerY);
}

//3:An arc cross a line like a lock
void arcLine(int centerX, int centerY, int radius, int rotAngle){
  translate(centerX, centerY);
  rotate(radians(rotAngle));
  noFill();
  stroke(20);
  arc(radius/6, radius-radius/4, radius, radius, radians(72), radians(287)); 
  line(0, 0, 0, radius+radius/2);  
  rotate(radians(-rotAngle));
  translate(-centerX, -centerY);  
}

//4:A number of half circles (arcs) along a line, each with a different color (internally
//decided). The arcs can be set from large to small.
//The position (centerX, centerY) and angle (rotAngle) can be set by user
void arcs(int centerX, int centerY, int numOfArcs, int largeRadius, int smallRadius, 
     int fillColorR,int fillColorG,int fillColorB, int transparency, int rotAngle){
  int inc = (largeRadius-smallRadius)/numOfArcs, offsetX=0, r, g, b;
  translate(centerX, centerY);
  rotate(radians(rotAngle));
  fill(fillColorR,fillColorG,fillColorB, transparency);
  for (int i=0; i<numOfArcs; i++) {
    r=(i%3)*40+130; g=(i+1)%3*75; b=(i+2)%3*25; 
    strokeWeight(4);
    stroke(r,g,b);
    arc(offsetX, 0, largeRadius-i*inc, largeRadius-i*inc, PI, TWO_PI);
    strokeWeight(1);
    stroke(0);
    arc(offsetX, 0, largeRadius-i*inc, largeRadius-i*inc, PI, TWO_PI);
    offsetX += largeRadius-i*inc;
    if (inc>0) offsetX -= 4;
  }
  strokeWeight(0);   
  rotate(radians(-rotAngle));
  translate(-centerX, -centerY); 
}

//5:color arc trips 
void arcStrips(int centerX, int centerY, int radius){
   translate(centerX, centerY);
   int[] fillColorR = {0, 187, 187, 119}; 
   int[] fillColorG = {0, 170, 68, 34}; 
   int[] fillColorB = {0, 51, 17, 17}; 
   int thickness = radius/30;
   strokeCap(SQUARE);
   noFill();
   for(int i=1; i<4; i++){
      stroke(fillColorR[i], fillColorG[i], fillColorB[i]);
      strokeWeight(thickness);
      arc(0+i*4, 0, radius, radius-i*thickness*3, PI, PI+PI/2-i*0.028F-0.002F);
      arc(0+i*4, 0, radius, radius-i*thickness*3-thickness, PI, PI+PI/2-i*0.028F-0.002F);
      strokeWeight(2);
      stroke(10);
      if (i<3) arc((i-1)*thickness/3-1, 0, radius, radius-i*thickness*(2.8F)+8, PI, PI+PI/2-i*0.015F);
   }
   line(-thickness/4, -radius/2+thickness*(1.0), -thickness/3, -radius/2+thickness*(5.5));
   strokeWeight(0);
   translate(-centerX, -centerY);
}

//6:Black long triangle
void blackTriangle(int aX, int aY, int bX, int bY, int cX, int cY){
   fill(0, 190);
   noStroke();
   triangle(aX, aY, bX, bY, cX, cY);
}

//7:X*Y closed grids, interleaved with colored blocks, the color can be set with transparency
void checker(int topLeftX, int topLeftY, int rotAngle, int cols, int rows, int wid, int hei, 
     int borderColorR,int borderColorG,int borderColorB, int fillColorR,int fillColorG,int fillColorB, int transparency){
 translate(topLeftX, topLeftY);
 rotate(radians(rotAngle));
 stroke(borderColorR,borderColorG,borderColorB);
 strokeWeight(2);
 rect(0, 0, cols*wid, rows*hei);
 for (int i=0; i<cols; i++)
    for (int j=0; j<rows; j++){
      fill(fillColorR+(i+j)*20,fillColorG+(i+j)*20,fillColorB+(i+j)*20, transparency);
      if ((i%2==0&&j%2==1)||(i%2==1&&j%2==0)) rect(wid*i, hei*j, wid, hei);
    }
 strokeWeight(0);   
 rotate(radians(-rotAngle));
 translate(-topLeftX, -topLeftY); 
}
  
//8:A dot and a circle with 3 thin triangles pointing to center
void circleAnd3Triangles(int centerX, int centerY, int scaling){
  translate(centerX, centerY);
  //scale(scaling, scaling);
  strokeWeight(8); //noStroke();  
  stroke(20); 
  fill(241, 225, 192);
  ellipse(3, 1, 54, 54);
  fill(136,17,17);
  noStroke();
  strokeWeight(0);   
  ellipse(0, 0, 9, 9); 
  coloredTriangle(5, -7, 307, 36, 6, 20,20,20, 221,221,34, 187,51,187);
  coloredTriangle(-8, -5, 200, 31, 10, 100,100,100, 221,221,34, 187,57,57);
  coloredTriangle(5, 5, 50, 43, 6, 238,238,34, 238,238,34, 238,238,34);
  //scale(1,1);
  translate(-centerX, -centerY);   
}

//9:Thick (6) line with 6 segments, black on both ends, colored in middle segments.
//Segment length set by the user.
//Positoon and angle can be set by the user
void coloredLine(int startX, int startY, int len, int rotAngle, int color1R,int color1G,int color1B, 
     int color2R,int color2G,int color2B, int color3R,int color3G,int color3B){
   translate(startX, startY);
   rotate(radians(rotAngle));
   strokeWeight(6); 
   stroke(0);
   line(0, 0, 0, len); //Section 1: black
   stroke(color1R, color1G, color1B);
   line(0, len, 0, 3*len); //Section 2: color1
   stroke(0);
   line(0, 3*len, 0, 4*len); //Section 3: black
   stroke(color2R, color2G, color2B);
   line(0, 4*len, 0, 7*len); //Section 4: color2
   stroke(color3R, color3G, color3B);
   line(0, 7*len, 0, 9*len); //Section 5, color3
   stroke(0);
   line(0, 9*len, 0, 12*len); //Section 6: black
   strokeWeight(0);   
   rotate(radians(-rotAngle));
   translate(-startX, -startY);   
}

//10:Narrow triangles with 5 segments, black on both ends, colored in middle segments
//Segment length set by the user.
//Positoon and angle can be set by the user
void coloredTriangle(int startX, int startY, int rotAngle, int len, int inAngle, 
     int color1R,int color1G,int color1B,int color2R,int color2G,int color2B,int color3R,int color3G,int color3B){
   translate(startX, startY);
   rotate(radians(rotAngle));
   noStroke();
   fill(0);
   triangle(0, 0, 3*len, 0, cos(radians(inAngle))*3*len, sin(radians(inAngle))*3*len);
   fill(color1R,color1G,color1B);
   triangle(0, 0, 2*len, 0, cos(radians(inAngle))*2*len, sin(radians(inAngle))*2*len);
   fill(color2R,color2G,color2B);
   triangle(0, 0, 1.6F*len, 0, cos(radians(inAngle))*1.6F*len, sin(radians(inAngle))*1.6F*len);
   fill(color3R,color3G,color3B);
   triangle(0, 0, 1.3F*len, 0, cos(radians(inAngle))*1.3F*len, sin(radians(inAngle))*1.3F*len);
   fill(0, 130);
   triangle(0, 0, len, 0, cos(radians(inAngle))*len, sin(radians(inAngle))*len);
   rotate(radians(-rotAngle));
   translate(-startX, -startY);   
}

//11:A few concentric half circles
void concentricArcs(int centerX, int centerY, int thirdPointX, int thirdPointY, 
     int fillColorR, int fillColorG, int fillColorB, int rotAngle){
  translate(centerX, centerY);
  rotate(radians(rotAngle));
  noStroke();
  fill(fillColorR, fillColorG, fillColorB);
  triangle(-50, 0, 80, 0, thirdPointX, thirdPointY);
  fill(255);
  arc(0, 0, 13, 13, 0, PI);
  stroke(180, 72, 72);
  strokeWeight(2);
  noFill();
  arc(0, 0, 47, 47, PI, TWO_PI);
  fill(228, 173, 72);
  noStroke();
  arc(0, 0, 33, 33, PI, TWO_PI);
  fill(220);
  arc(0, 0, 27, 27, PI, TWO_PI);
  fill(0);
  noStroke();
  arc(0, 0, 13, 13, PI, TWO_PI); //Black circle on edge
  strokeWeight(0);
  rotate(radians(-rotAngle));
  translate(-centerX, -centerY);
}

//12:Line with two small lines crossed
void crosses(int startX, int startY, int len, int thickness, int randomGap, int rotAngle)
{
   int smallLineProp = len/10;
   translate(startX, startY);
   rotate(radians(rotAngle));
   noFill();
   stroke(0);
   strokeWeight(thickness);
   line(30, 0, 30, len);
   strokeWeight(1);
   line(30-smallLineProp+randomGap, smallLineProp, 30+smallLineProp, smallLineProp-randomGap);
   line(30-smallLineProp-randomGap, smallLineProp*2-randomGap, 30+smallLineProp, smallLineProp*2);
   strokeWeight(0);   
   rotate(radians(-rotAngle));
   translate(-startX, -startY);   
}   

//13:Two arrows, each formed by very thin triangles and filled with a different color
//Triangle thickness can be set by the user
void doubleArrow(int color1, int color2R,int color2G,int color2B, int headX, int headY, int startAngle, int endAngle, int len, int thickness){
  noStroke();
  fill(color2R, color2G, color2B);
  triangle(headX, headY+thickness, headX, headY+2*thickness, cos(radians(startAngle))*len+headX, sin(radians(startAngle))*len+headY);
  triangle(headX, headY+thickness, headX, headY+2*thickness, cos(radians(endAngle))*len+headX, sin(radians(endAngle))*len+headY);
  fill(color1);
  triangle(headX, headY, headX, headY+thickness, cos(radians(startAngle))*len+headX, sin(radians(startAngle))*len+headY);
  triangle(headX, headY, headX, headY+thickness, cos(radians(endAngle))*len+headX, sin(radians(endAngle))*len+headY);
} 

//14:four lines fanning out from one point
void fanLines(int centerX, int centerY, int len, int rotAngle){
   translate(centerX, centerY);
   rotate(radians(rotAngle));
   fork(10, 2, 0, 0, cos(radians(62))*len, sin(radians(62))*len, cos(radians(118))*len, sin(radians(118))*len);
   fork(10, 2, 0, 0, cos(radians(80))*len, sin(radians(80))*len, cos(radians(100))*len, sin(radians(100))*len);
   rotate(radians(-rotAngle));
   translate(-centerX, -centerY);
}

//15:Two lines joining at an angle defined by centerX and centerY, color and weight are set by the user.
//This is usually used together with gradientArc (see below)
void fork(int lineColor, int lineWeight, int centerX, int centerY, float rightX, float rightY, float leftX, float leftY){
  stroke(lineColor);
  strokeWeight(lineWeight);
  line(centerX, centerY, rightX, rightY);
  line(centerX, centerY, leftX, leftY);
  strokeWeight(0);   
}

//16:An arc from startAngle to endAngle, filled with a color, size given (radius)
//Position of the arc center given by centerX and centerY
void gradientArc(int fillColorR,int fillColorG,int fillColorB, int centerX, int centerY, int startAngle, int endAngle, int radius){  
  noFill();
  float scaledR = radius*1.5;
  for (int i=0; i<scaledR; i++) { 
    stroke(fillColorR, fillColorG, fillColorB, 255-255*i/scaledR); 
    arc(centerX, centerY, i, i, radians(startAngle), radians(endAngle));
  }
}

//17:Circle filled with a color more transparncy toward outside
//Used for filling the background, to be called on multiple random locations
void gradientCircle(int colorR, int colorG, int colorB, int centerX, int centerY, int radius){
  noFill();
  for (int i=0; i<radius; i++) { 
    stroke(colorR, colorG, colorB, 255-255*i/radius); 
    ellipse(centerX, centerY, i, i);
  }
}

//18:Thick ring filled with a color more transparency from inner circle to outer circle
//Can work with twoCircles (see below) to make out circle gradually fading outside
void gradientEllipse(int gradColorR, int gradColorG, int gradColorB, int centerX, int centerY, int inRadius, int outRadius){
  float inc = (outRadius-inRadius)/255;
  if (inc < 1) inc = 1;
  strokeWeight(inc);
  noFill();
  for (int i=inRadius; i<outRadius; i++) { 
    stroke(gradColorR, gradColorG, gradColorB, 255-255*(i-inRadius)/(outRadius-inRadius)); 
    //stroke(random(160,220), random(160,220), random(120), 255-255*(i-inRadius)/(outRadius-inRadius)); 
    ellipse(centerX, centerY, i, i);
  }
  strokeWeight(0);   
}

//19:X*Y open grids with lines extended by 1.5 of grid width (gap). Grids are 
//interleaved with two alternating colors.
//The position (centerX, centerY) can be set by user
void grid(int topLeftX, int topLeftY, int cols, int rows, int gap, int color1R,int color1G,int color1B, 
     int color2R,int color2G,int color2B){ 
   translate(topLeftX, topLeftY);
   float sideLen = gap*1.5;
   boolean alt=true;
   fill(198, 86, 74);
   stroke(1);
   strokeWeight(1);
   for(int i=0; i<cols; i++)
     for(int j=0; j<rows; j++) {
       line(0, i*gap+sideLen, j*gap+2*sideLen, i*gap+sideLen);
       line(j*gap+sideLen, 0, j*gap+sideLen, i*gap+2*sideLen);
       if (i==rows-j-2) {
         if(alt) {fill(color1R, color1G, color1B); alt=false;}
         else {fill(color2R, color2G, color2B); alt=true;} 
         rect(i*gap+sideLen, j*gap+sideLen, 16, 16);
       }
   }
   strokeWeight(0);    
   translate(-topLeftX, -topLeftY);    
}

//20: 4x5 open grids with lines extended by 1.5 of grid width (gap). 
//The position (centerX, centerY) can be set by user
void gridNoFill(int topLeftX, int topLeftY, int cols, int rows, int gap, int rotAngle){ 
   translate(topLeftX, topLeftY);
   rotate(radians(rotAngle));
   int offset;
   float sideLen = gap*1.5;
   stroke(1);
   strokeWeight(2);
   for(int i=0; i<cols; i++) {
       offset = i%2*6;      
       line(i*gap+sideLen-offset, offset, i*gap+sideLen+offset, rows*gap+sideLen+offset);
     }
   for(int j=0; j<rows; j++) {
       offset = j%2*6;      
       line(offset, j*gap+sideLen-offset, cols*gap+sideLen+offset, j*gap+sideLen+offset);
   }
   strokeWeight(0);    
   rotate(radians(-rotAngle));
   translate(-topLeftX, -topLeftY);    
}

//21:Filled half circle on top of a triangle
void halfCircleOnTriangle(int centerX, int centerY, int radius, int rotAngle){
   translate(centerX, centerY);
   rotate(radians(rotAngle));
   noStroke();
   fill(238, 238, 238);
   arc(0, 0, radius, radius, PI, TWO_PI);
   triangle(-radius/4, radius/4, radius/4, radius/4, 0, 3*radius);
   fill(238, 17, 17);
   rect(-radius/12, radius/2, radius/6, radius/6);
   rotate(radians(-rotAngle));
   translate(-centerX, -centerY);
} 

//22:Large quad supposed to be in the central area
void largeQuad(int aX, int aY, int bX, int bY, int cX, int cY, int dX, int dY){
   //noStroke();
   quad(aX, aY, bX, bY, cX, cY, dX, dY);
}

//23:Long black triangle with vary-sided arcs on top
void largeTriangleArcs(int centerX, int centerY, int len, int rotAngle){
   translate(centerX, centerY);
   rotate(radians(rotAngle));
   int i, j, half=len/2, halfRad;
   int[] ct = {4,6,12};
   int[] rad = {len/ct[0], len/ct[1], len/ct[2]};
   stroke(10);
   fill(10);
   fill(0);
  
   triangle(0, 0, len, 0, len, 30);
   noFill();
   strokeWeight(3);
   arc(half+rad[2]*2, 5, rad[0], rad[0], PI, TWO_PI);
   for(i=0; i<3; i++)
      for(j=0; j<ct[i]/2; j++){
         if(i==2) halfRad = 0; else halfRad = rad[i+1]/2;
         arc(half+halfRad+rad[i]*j, 5, rad[i], rad[i], PI, TWO_PI);
   }
   strokeWeight(0);
   rotate(radians(-rotAngle));
   translate(-centerX, -centerY);
}

//24:Group of 3-5 lines
void lines(int startX, int startY, int len, int gap, int number, int rotAngle){
   int thickness = gap/2;
   translate(startX, startY);
   rotate(radians(rotAngle));
   strokeWeight(thickness);
   for (int i=0; i<number; i++)
       line(i*gap, 0, i*gap, len);
   strokeWeight(0);   
   rotate(radians(-rotAngle));
   translate(-startX, -startY);   
} 


//25:Lines on an arc
void linesOnArc(int centerX, int centerY, int rotAngle){  
   translate(centerX, centerY);
   rotate(radians(rotAngle));
   noFill(); 
   stroke(20);
   strokeWeight(2);
   arc(0, 100, 300, 300, radians(-40), radians(40));
   line(110, 65, 190, 20);
   line(115, 90, 202, 65);
   line(115, 120, 190, 140);
   strokeWeight(0);   
   rotate(radians(-rotAngle));
   translate(-centerX, -centerY);   
}

//26:Bezier curve gradualling flattening
void multiBezier(int centerX, int centerY, int unit){
  int side = margin*2, rotAngle=0;
  translate(centerX, centerY);
  if (centerX<side&&centerY<side) rotAngle = 0;
  else if (centerX<side) rotAngle = -90; 
  else if (centerX>maxX-side&&centerY>maxY-side) rotAngle = 180; 
  else if (centerY>maxY-margin) rotAngle = 200; 
  else if (centerX>maxX-side-50) rotAngle = 90; 
  else unit = 7;
  //print("x="+centerX+",y="+centerY+",rotAngle="+rotAngle+";");
  rotate(radians(rotAngle));
  int n2=2*unit, n3=3*unit, n4=4*unit, n5=5*unit, n6=6*unit, n7=7*unit, n8=8*unit, n10=10*unit, n20=20*unit;
  int thickness;
  if (unit<14) thickness = unit; else thickness = unit/2;
  noFill();
  stroke(0);
  strokeWeight(thickness);
  bezier(unit, n10, 0, -n4, n3, 0, n4, n4);
  bezier(unit+thickness, n10-1, 3, -n3, n3-2, 2, n4, n4);
  strokeCap(ROUND);
  strokeWeight(thickness-1);
  bezier(n4, n4, n5, n7, n6, n7, n6, n3);
  strokeWeight(thickness-2);
  bezier(n6, n3, n6, 0, n7, 0, n8, n2);
  strokeWeight(thickness-3);
  bezier(n8, n2, 9*unit, n4, n10, n4, 11*unit, n2);
  strokeWeight(thickness-4);
  bezier(11*unit, n2, 12*unit, 0, 13*unit, 0, 14*unit, unit);
  strokeWeight(thickness-5);
  bezier(14*unit, unit, 15*unit, n2, 16*unit, n2, 17*unit, unit);
  strokeWeight(thickness-6);
  strokeCap(SQUARE);
  bezier(17*unit, unit, 18*unit, 0, 19*unit, 0, 23*unit, 0);
  strokeWeight(unit/5);
  line(-n2, n4, 21*unit, unit/3);
  strokeWeight(0);   
  rotate(radians(-rotAngle));
  translate(-centerX, -centerY);   
}

//27:Two overlapping rectangles with transparency
void overlapRect(int centerX, int centerY, int color1R, int color2B){
  fill(color1R, 40, 40, 150);
  rect(centerX, centerY, 35, 30);
  fill(40, 40, color2B, 150);
  rect(centerX+15, centerY+10, 35, 30);
}

//28:Red "L" going through a black triangle, with intersection area in background color
void redBlackCross(int centerX, int centerY, int len, int rotAngle, int bgColor){
   translate(centerX, centerY);
   rotate(radians(rotAngle));
   int half = len/2, wid = len/8;
   noStroke();
   fill(187, 51, 51);
   quad(0, half, len, half, len/5, half+wid, 0, len);
   fill(10);
   triangle(half-wid, 0, half-wid, len, half, len);
   fill(bg_r[bgColor], bg_g[bgColor], bg_b[bgColor]);
   quad(half-wid, half, half-wid/2, half, half-wid/2+2, half+wid*3/4, half-wid, half+wid*4/5);
   rotate(radians(-rotAngle));
   translate(-centerX, -centerY);
}   

//29: triangles on a row
void threeTriangles(int centerX, int centerY, int hei, int fillColorR,int fillColorG,int fillColorB, int rotAngle){
   translate(centerX, centerY);
   rotate(radians(rotAngle));
   int thik=5;
   noStroke();
   fill(fillColorR,fillColorG,fillColorB, 180);
   triangle(0, hei, hei/2, 0, hei+thik, hei);
   triangle(hei-thik, hei, hei*3/2, 0, hei*2+thik, hei);
   triangle(hei*2-thik, hei, hei*5/2, 0, hei*3, hei);
   rotate(radians(-rotAngle));
   translate(-centerX, -centerY);
}

//30:A colored triangle on top of a circle of a different color. 
//The overlapping part has a fixed (100) transpaarency
void triangleOnCircle(int triaColorR,int triaColorG,int triaColorB, int cirColorR,int cirColorG,int cirColorB, 
     int transparency, int aX, int aY, int bX, int bY, int cX, int cY, int radius){
  //noStroke();
  fill(cirColorR, cirColorG, cirColorB, transparency);
  ellipse(bX, bY, radius, radius); 
  fill(triaColorR, triaColorG, triaColorB, transparency);
  triangle(aX, aY, bX, bY, cX, cY); 
}

//31:Two arcs together like hair
void twoArcs(int centerX, int centerY, int startAngle, int rotAngle){
   translate(centerX, centerY);
   rotate(radians(rotAngle));
   noFill();
   stroke(0);
   arc(14, -5, 294, 300, radians(startAngle), radians(256));
   arc(0, 0, 260, 260, radians(startAngle), radians(240));
   noStroke();
   rotate(radians(-rotAngle));
   translate(-centerX, -centerY);
}

//32:Two concentric circles filled with differnt colors. Outside circle can
//be made a level of  transparency, so it gradually fades
//Each of the circles can have a colored border, and can do without
//Inner circle can have a line-weight for the border
void twoCircles(int centerX, int centerY, boolean outBorder, int outBorderColorR,int outBorderColorG,int outBorderColorB, 
     int outRadius, boolean inBorder, int inBorderWeight, int inBorderColorR,int inBorderColorG,int inBorderColorB, 
     int inRadius, boolean gradient){
  if (outBorder) stroke(outBorderColorR,outBorderColorG,outBorderColorB);
  else noStroke(); 
  if (gradient){
        float inc = (outRadius-inRadius)/255;
        int gradColorR, gradColorG, gradColorB;
        if (inc < 1) inc = 1;
        strokeWeight(inc);
        noFill();
        if (centerX<centerY) {gradColorR = 68; gradColorG = 119; gradColorB = 177;}  
        else {gradColorR = 177; gradColorG = 177; gradColorB = 68;}
        for (int i=inRadius; i<outRadius; i++) { 
           stroke(gradColorR, gradColorG, gradColorB, 255-255*(i-inRadius)/(outRadius-inRadius));
           ellipse(centerX, centerY, i, i);
        }
  }
  else {
        if (centerX<centerY) fill(random(100), random(120), random(160,200));
        else fill(random(160,200), random(160,200), random(100));
        ellipse(centerX, centerY, outRadius, outRadius); //Outer 
  }
  if (inBorder) {strokeWeight(inBorderWeight); stroke(inBorderColorR,inBorderColorG,inBorderColorB);}
  else noStroke();
  if (centerX<centerY) fill(random(160,200), random(160,200), random(100));
        else fill(random(110), random(140), random(150,180));
  ellipse(centerX, centerY, inRadius, inRadius); //Inner 
  strokeWeight(0);
}

//Unused: Pattern with brown triangle in the middle of Compositoon VIII
void trianglePattern(int offsetX, int offsetY){
  translate(offsetX, offsetY);
noStroke();
fill(139, 89, 39, 200);
triangle(342, 240, 433, 178, 449, 240); //Middle brown
fill(95, 131, 93);
quad(433, 178, 440, 172, 483, 239, 449, 240);

strokeWeight(5); //noStroke();
stroke(70); //fill(87, 87, 183);
fill(241, 225, 192);
ellipse(427, 206, 34, 34);
noStroke();
fill(255);
arc(460, 205, 13, 13, radians(60), radians(240));
stroke(180, 72, 72); 
strokeWeight(2);
noFill();
arc(460, 205, 47, 47, radians(240), radians(420));
fill(212, 173, 72); 
noStroke();
arc(460, 205, 33, 33, radians(240), radians(420));
fill(220);
arc(460, 205, 27, 27, radians(240), radians(420));
fill(0);
noStroke();
arc(460, 205, 13, 13, radians(240), radians(420)); //Black circle on edge
ellipse(430, 205, 7, 7); //Inside brown triangle
strokeWeight(0);   
translate(-offsetX, -offsetY);
}

//method for randomizing
void randomize (int[] a, int count) {
  for (int k=0; k < count; k++) {  // k< a.length
    // Goal: swap the value at pos k with a rnd value at pos x.
    // save current value from pos/index k into temp
    int temp = a[k]; 
    // make rnd index x
    int x = (int)random(0, count); //int x = (int)random(0, a.length);    
    // overwrite value at current pos k with value at rnd index x
    a[k]=a[x];
    // finish swapping by giving the old value at pos k to the 
    // pos x. 
    a[x]=temp;
    //print("randomed="+a[x]+",");
  }
}

