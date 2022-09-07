float total=0;
float inside=0;
float tweak=0.00000000000000000000000001;
int r=350;
float err=1;
int trials=100;
boolean auto=true;
int step=1;
int trial [] = new int [trials];
int t=0;
float pie=3.14159265358979323846264338328;
float avg=0;
int sum=0;
boolean init=auto;

void setup() {
  fullScreen();
  background(0);
  stroke(255);
  strokeWeight(2);
  fill(0);
  rect(33.5, height/2-r, 2*r, 2*r);
  ellipse(33.5+r, height/2, 2*r, 2*r);
}

void draw() {
  if (t==trials-1) {
    auto=false;
  }
  println((inside+tweak)/(total+tweak));
  for (int i=0; i<step; i++) {
    if (abs((pie-(4+tweak)*(inside+tweak)/(total+tweak)))/pie*(100+tweak)>err || total==0) {

      int x=round(random(33.5, 33.5+2*r));
      int y=round(random(height/2-r, height/2+r));
      fill(10, 195, 10);
      noStroke();
      fill(10, 195, 10);
      if (dist(x, y, 33.5+r, height/2)<r) {
        inside++;
        //fill(10, 195, 10);
      } else {
        //fill(195, 10, 10);
      }
      ellipse(x, y, 4, 4);
      total++;
    }
  }
  noStroke();
  fill(0);
  rect(33.5+2*r+5, 0, width, height);
  fill(255);
  textSize(30);
  text("Points: " + round(total), 33.5+2*r+10, 40);
  text("Pi: " + 4*inside/total, 33.5+2*r+10, 90);
  text("% Error: " + abs((pie-4*inside/total))/pie*100, 33.5+2*r+10, 130);
  text("Trials: " + round(t+1), 33.5+2*r+10, 170);
  text("Average: " + round(avg), 33.5+2*r+10, 210);
  if (keyPressed) {
    if (key==' ') {
      total=0;
      t=0;
      inside=0;
      avg=0;
      auto=init;
      background(0);
      stroke(255);
      strokeWeight(2);
      fill(0);
      rect(33.5, height/2-r, 2*r, 2*r);
      ellipse(33.5+r, height/2, 2*r, 2*r);
      noStroke();
      rect(33.5+2*r+5, 0, width, height);
      fill(255);
      textSize(30);
      text("Points: " + round(total), 33.5+2*r+10, 40);
      text("Pi: " + 4*inside/total, 33.5+2*r+10, 90);
      text("% Error: " + abs((pie-4*inside/total))/pie*100, 33.5+2*r+10, 130);
      text("Trials: " + round(t+1), 33.5+2*r+10, 170);
      text("Average: " + round(avg), 33.5+2*r+10, 210);
    }
  }
  if (t==trials) {
    total=0;
    t=0;
    inside=0;
    avg=0;
    auto=init;
  }
  if (abs((pie-4*inside/total))/pie*100<err && (auto || (!auto && keyPressed))) {
    trial[t]=round(total);
    t++;
    sum+=trial[t-1];
    avg=sum/t;
    total=0;
    inside=0;
    background(0);
    stroke(255);
    strokeWeight(2);
    fill(0);
    rect(33.5, height/2-r, 2*r, 2*r);
    ellipse(33.5+r, height/2, 2*r, 2*r);
    noStroke();
    rect(33.5+2*r+5, 0, width, height);
    fill(255);
    textSize(30);
    text("Points: " + round(total), 33.5+2*r+10, 40);
    text("Pi: " + 4*inside/total, 33.5+2*r+10, 90);
    text("% Error: " + abs((pie-4*inside/total))/pie*100, 33.5+2*r+10, 130);
    text("Trials: " + round(t+1), 33.5+2*r+10, 170);
    text("Average: " + round(avg), 33.5+2*r+10, 210);
  }
}