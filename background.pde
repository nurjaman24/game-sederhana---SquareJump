public void background(){
  color red = color(400,50,50);
  color blue = color(100,100,400);
  color green = color(50,400,50);
  color bg;

  if(timer < 1500){
    //background
    bg = red;
    background(bg);
    //jalan
    strokeWeight(3);
    stroke(100,0,0);
    fill(300,0,0);
    rect(width/2, height-10, width, 100);
  }else if(timer < 2450){
    bg = blue;
    background(bg);
    //jalan
    strokeWeight(3);
    stroke(0,0,100);
    fill(0,0,300);
    rect(500, 600, 1050, 100);
  }else if(timer < 3300){
    bg = green;
    background(bg);
    //jalan
    strokeWeight(3);
    stroke(0,100,0);
    fill(0,200,0);
    rect(500, 600, 1050, 100);
  }

}