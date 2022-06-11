String sketchName = "mySketch";
String saveFormat = ".png";

int calls = 0;
long lastTime;



void setup() {
  size(800, 500);
  colorMode(RGB, 255, 255, 255, 1);
  textSize(14);
}


void draw() {
  color c1 = color(56, 79, 132);
  color c2 = color(65.868, 73.937, 123.252);
  background(255);
  noStroke();
  fill(c1);
  square(0, 0, width/2);
  fill(c2);
  square(width/2, 0, width/2);
  
  float[] XYZ1 = RGBtoXYZ(red(c1), green(c1), blue(c1));
  float[] CIELab1 = XYZtoCIELab(XYZ1[0], XYZ1[1], XYZ1[2]);
  float[] XYZ2 = RGBtoXYZ(red(c2), green(c2), blue(c2));
  float[] CIELab2 = XYZtoCIELab(XYZ2[0], XYZ2[1], XYZ2[2]);
  
  float deltae = deltaE2k(CIELab1, CIELab2);  
  
  fill(255);
  text("R: " + red(c1), 10, 20);
  text("G: " + green(c1), 10, 40);
  text("B: " + blue(c1), 10, 60);  
  
  text("X: " + XYZ1[0], 10, 100);
  text("Y: " + XYZ1[1], 10, 120);
  text("Z: " + XYZ1[2], 10, 140);
  
  text("L: " + CIELab1[0], 10, 180);
  text("a: " + CIELab1[1], 10, 200);
  text("b: " + CIELab1[2], 10, 220);
  
  text("R: " + red(c2), width/2 + 10, 20);
  text("G: " + green(c2), width/2 + 10, 40);
  text("B: " + blue(c2), width/2 + 10, 60);  
  
  text("X: " + XYZ2[0], width/2 + 10, 100);
  text("Y: " + XYZ2[1], width/2 + 10, 120);
  text("Z: " + XYZ2[2], width/2 + 10, 140);
  
  text("L: " + CIELab2[0], width/2 + 10, 180);
  text("a: " + CIELab2[1], width/2 + 10, 200);
  text("b: " + CIELab2[2], width/2 + 10, 220);
  
  fill(0);
  textSize(28);
  text("DeltaE2k: " + deltae, width/2 - 120, width/2 + 60);
  

  noLoop();
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(getTemporalName(sketchName, saveFormat));  
}


String getTemporalName(String prefix, String suffix){
  // Thanks! SparkyJohn @Creative Coders on Discord
  long time = System.currentTimeMillis();
  if(lastTime == time) {
    calls ++;
  } else {
    lastTime = time;
    calls = 0;
  }
  return prefix + time + (calls>0?"-"+calls : "")  +suffix;
}
