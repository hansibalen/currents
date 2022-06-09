Area f, f1;
ArrayList<Curves> curves;
ArrayList<Curves>  curves1;
int num = 70000;
int num1=10000;
PImage back;
float vmin = 3;
float vmax = 6;
float fmin = 0.5;
float fmax = 5;


void setup() {
  size(1920, 1080, P2D);
  f = new Area(4);
  f1=new Area(2);
  curves = new ArrayList<Curves>();
  curves1 = new ArrayList<Curves>();
  back = loadImage("source.jpg");
  back.loadPixels();

  for (int i = 0; i < num; i++) {
    PVector pos = new PVector (random(width), random(height));
    Curves a = new Curves(pos);
    a.col = back.get(int(pos.x), int(pos.y));
    curves.add(a);
  }
  for (int i = 0; i < num1; i++) {
    PVector pos1 = new PVector (random(width), random(height));
    Curves a1 = new Curves(pos1);
    a1.col = color(200, brightness(back.get(int(pos1.x), int(pos1.y))));
    curves1.add(a1);
  }
  background(0);
}

void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  for (Curves b : curves1) 
    b.proceed(f1,f1);
  for (Curves b : curves) 
    b.proceed(f1,f);
  for (Curves b : curves1) 
    b.proceed(f1,f1);
}
