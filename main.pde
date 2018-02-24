//deklarasikan hero
Player hero;
//deklarasikan rintangan
rintangan[] rintangan = new rintangan[200]; 

int timer = 0 ;
int mati = 0;
float highScore = 0;
float score;
int moverintangan = 4;

void setup(){
  fullScreen();
  orientation(LANDSCAPE);
  hero = new Player(width-1100, height-85, 50); 
  //inisialisasi rintangan
  for(int i = 0; i < 300; i++){
    rintangan[i] = new rintangan(width);
  }
}

void draw(){
  //background==============================
  waktu();  
  //rintangan
  for(int i = 0; i < 300; i++){
    rintangan[i].pindah(moverintangan);
 
  }
  rintangan();
  collision();
  
 //hero
  hero.display();
  hero.physics();
  
  //timer, scoreboard and displaycontrol
  timer();
  scoreboard(); 
  displayControls();
  
  //gameComplete 
  if(timer > 6400){
      gameComplete();
  } 
  if(timer > 6450){
      reset();
  }
}

//background
void waktu(){
  color red = color(400,50,50);
  color blue = color(100,100,400);
  color green = color(50,400,50);
  color yellow = color(255,255,0);
  color bg;
    if(timer < 1500){//awal level 2
      //level 1
      bg = red;
      background(bg);
      jalan();
      moverintangan = 4;
    }else if(timer < 3550){//awal level 3
      //level 2
      bg = blue;
      background(bg);
      jalan();
      moverintangan = 4;
    }else if(timer < 6050){//awal level 4
      //level 3
      bg = green;
      background(bg);
      //jalan
      jalan();
      moverintangan = 4;
    }else if (timer < 7000){//awal level 5
      //level 4
      bg = yellow;
      background(bg);
      //jalan
      jalan();
      moverintangan = 4;
    }
  }
  
  void jalan(){
    int jalanx = width/2;
    int jalany = height-10;
    int jalanw = width;
    int jalanh = 100;
    //jalan
    fill(120,120,120);
    noStroke();
    rect(jalanx, jalany, jalanw, jalanh);
 
  }


void mousePressed(){
    hero.jump();
}

void collision(){
//tabrakan dengan duri
  for(int i = 0; i < 300; i++){
    if(hero.getX() > rintangan[i].duriGetX1() && hero.getX() < rintangan[i].duriGetX2()){
      if(hero._PlayerY > rintangan[i].duriGetY1() && hero._PlayerY < rintangan[i].duriGetY2()){
        delay(1000);
        reset();
      }
      if(hero._PlayerY < rintangan[i].duriGetY1() && hero._PlayerY < rintangan[i].duriGetY2()){
        score += 0.05882353;
      }
    }
//tabrakan dengan kotak
    if(hero.getX() > rintangan[i].kotakGetX1() && hero.getX() < rintangan[i].kotakGetX2()){
      //Jika pemain menyentuh bagian depan kotak
      if(hero._PlayerY > rintangan[i].kotakGetY1() && hero._PlayerY < rintangan[i].kotakGetY2()){
        delay(1000);
        reset();
      }
      if(hero.getY() < rintangan[i].kotakGetY1()){
        hero._startY = rintangan[i].kotakGetY1()-26;
      }
    }
    if(hero.getX() > rintangan[i].kotakGetX2() && !rintangan[i]._abaikan){
      hero._startY = 635;
      rintangan[i].abaikan();
    }
    
//tabrakan dengan papan
    if(hero.getX() > rintangan[i].papanGetX1() && hero.getX() < rintangan[i].papanGetX2()){
      //Jika pemain menyentuh bagian depan papan
      if(hero._PlayerY > rintangan[i].papanGetY1() && hero._PlayerY < rintangan[i].papanGetY2()){
        delay(1000);
        reset();
      }
      if(hero.getY() < rintangan[i].papanGetY1()){
        hero._startY = rintangan[i].papanGetY1()-26;
      }
    }
    if(hero.getX() > rintangan[i].papanGetX2() && !rintangan[i]._abaikan){
      hero._startY = 635;
      rintangan[i].abaikan();
    }
 
   }
}
void timer(){
  timer += 1;
}
void reset(){ 
  //resets timer
    //level 1
    if(timer < 1500){
      //reset timer 
      timer = 0;
      score = 0;
    //level 2
    }else if((timer < 3550)&&(timer > 1500)){
      //reset timer
      timer = 1500;
      score -= 10;
    //level 3
    }else if((timer < 5900)&&(timer > 3550)){
      timer = 3550;
      score -= 20;
    //level 4
    }else if ((timer < 6400)&&(timer > 5900)){
      timer = 5900;
      score -= 30;
    }else if(timer > 6800){
      timer = 0;
      score = 0;
    }
  //resets rintangan
  for(int i = 0; i < 300; i++){
    rintangan[i] = new rintangan(width);
  }
  //resets "floor"
  hero._startY = height-85;
}

void scoreboard(){
  if(score > highScore){
    highScore = score;
  }
  textAlign(CENTER);
  //highscore display
  textSize(40);
  fill(0);
  text("Highscore: "+int(highScore), width-200, height/10);

}

void displayControls(){
  if(timer < 150){
    textAlign(CENTER);
    textSize(45);
    fill(0);
    text("MousePress or Touch", width/4, height/10);
  }else{
    textAlign(CENTER);
    textSize(55);
    fill(0);
    text("Score: "+int(score), width/10, height/10);
  }
}


void gameComplete(){
  //you win text
  textAlign(CENTER);
  textSize(random(190,100));
  fill(random(255), random(255), random(255));
  text("You Win!", width/2, height/2);
}

void rintangan(){
    if((timer > 100)&&(timer < 120)){
      //info mulai
      textAlign(CENTER);
      textSize(100);
      fill(random(150,255), random(150,255), random(150,255));
      textSize(200);
      text("Start..!!", width/2, height/2);
    }
    
//bagian level_1==========================
    if((timer > 120)&&(timer < 140)){
      //info mulai
      textAlign(CENTER);
      textSize(100);
      fill(random(200,255), random(200,255), random(200,255));
      textSize(200);
      text("level 1",width/2,height/2);
    }
    
    
    if(timer > 150){
      rintangan[1].duri(height-60);
    }
         
    if(timer > 250){
      rintangan[2].duri(height-60);
    }
    
    if(timer > 350){
      rintangan[3].duri(height-60);
    }
    
    if(timer > 450){
      rintangan[4].duri(height-60);
    }
    
    if(timer > 550){
      rintangan[5].duri(height-60);
    }
    
    if(timer > 650){
      rintangan[6].duri(height-60);
    }
    
    if(timer > 750){
      rintangan[7].duri(height-60);
     }
    
    if(timer > 850){
      rintangan[8].duri(height-60);
    }
    
    if(timer > 950){
      rintangan[9].duri(height-60);
    }
    
    if(timer > 1050){
      rintangan[10].duri(height-60);
    }
    
    if(timer > 1150){
      rintangan[11].duri(height-60);
    }
    
    if(timer > 1250){
      rintangan[12].duri(height-60);
    }
    if((timer > 1300)&&(timer < 1350)){
      textAlign(CENTER);
      textSize(100);
      fill(255);
      text("Level Up",width/2,height/2);
    }
    //=============12 rintangan===============
//bagian level_2==========================
    if((timer > 1500)&&(timer < 1550)){
      //info mulai
      textAlign(CENTER);
      textSize(100);
      fill(random(200,255), random(200,255), random(200,255));
      textSize(200);
      text("level 2",width/2,height/2);
    }
 
    
    if(timer > 1650){
      rintangan[13].duri(height-60);
     }
    
    if(timer > 1700){
      rintangan[14].duri(height-60);
    }
    
    if(timer > 1800){
      rintangan[15].duri(height-60);
    }
    
    if(timer > 1850){
      rintangan[16].duri(height-60);
    }
    
    if(timer > 1950){
      rintangan[17].duri(height-60);
    }
    
    if(timer > 2000){
      rintangan[18].duri(height-60);
    }
    
    if(timer > 2100){
      rintangan[19].duri(height-60);
     }
 
    if(timer > 2150){
      rintangan[20].duri(height-60);
    }
    if(timer > 2250){
      rintangan[21].duri(height-60);
     }
    
    if(timer > 2300){
      rintangan[22].duri(height-60);
    }
    
    if(timer > 2400){
      rintangan[23].duri(height-60);
    }
    
    if(timer > 2450){
      rintangan[24].duri(height-60);
    }
    
    if(timer > 2550){
      rintangan[25].duri(height-60);
    }
    
    if(timer > 2600){
      rintangan[26].duri(height-60);
    }
    
    if(timer > 2700){
      rintangan[27].duri(height-60);
     }
 
    if(timer > 2750){
      rintangan[28].duri(height-60);
    }
    if(timer > 2850){
      rintangan[29].duri(height-60);
     }
    
    if(timer > 2900){
      rintangan[30].duri(height-60);
    }
    
    if(timer > 3000){
      rintangan[31].duri(height-60);
    }
    
    if(timer > 3050){
      rintangan[32].duri(height-60);
    }
    
    if(timer > 3150){
      rintangan[33].duri(height-60);
    }
    
    if(timer > 3200){
      rintangan[34].duri(height-60);
    }
    
    if(timer > 3300){
      rintangan[35].duri(height-60);
     }
 
    if(timer > 3450){
      rintangan[36].duri(height-60);
    }
    
    if((timer > 3500)&&(timer < 3550)){
      textAlign(CENTER);
      textSize(100);
      fill(255);
      text("Level Up",width/2,height/2);
    }
//============24 rintangan============  
//bagian level_3==========================
    if((timer > 3550)&&(timer < 3600)){
      //info mulai
      textAlign(CENTER);
      textSize(100);
      fill(random(200,255), random(200,255), random(200,255));
      textSize(200);
      text("level 3",width/2,height/2);
    }
    
    if (timer > 3600){
      rintangan[1].kotak(height-150);
      rintangan[83].duri(height-60);
     }
    if (timer > 3625){
      rintangan[37].duri(height-60);
    }
    if(timer > 3650){
      rintangan[2].kotak(height-150);
      
rintangan[82].duri(height-60);
    }
    if (timer > 3675){
      rintangan[38].duri(height-60);
    }
    if(timer > 3700){
      rintangan[3].kotak(height-150);
      rintangan[81].duri(height-60);
    }
    //selisih jarak 25=======================
    
    if(timer > 3800){
      rintangan[4].kotak(height-150);
      rintangan[80].duri(height-60);
    }
    if (timer > 3825){
      rintangan[39].duri(height-60);
    } 
    if(timer > 3850){
      rintangan[5].kotak(height-150);
      rintangan[79].duri(height-60);
    }
    //selisih jarak 25===========
    
    if(timer > 3950){
      rintangan[6].kotak(height-150);
      rintangan[78].duri(height-60);
    }
    
    if(timer > 4000){
      rintangan[7].kotak(height-150);
      rintangan[77].duri(height-60);
    }
    if (timer > 4050){
      //rintangan[40].duri(660);
    }
    if(timer > 4100){
      rintangan[8].kotak(height-150);
      rintangan[76].duri(height-60);
    }
    //12 rintangan
    
    if (timer > 4200){
      rintangan[9].kotak(height-150);
      rintangan[75].duri(height-60);
     }
    if (timer > 4225){
      rintangan[41].duri(height-60);
    }
    if(timer > 4250){
      rintangan[10].kotak(height-150);
      rintangan[74].duri(height-60);
    }
    if (timer > 4275){
      rintangan[42].duri(height-60);
      rintangan[73].duri(height-60);
    }
    if(timer > 4300){
      rintangan[11].kotak(height-150);
      rintangan[72].duri(height-60);
    }
    //selisih jarak 25=======================
    
    if(timer > 4400){
      rintangan[12].kotak(height-150);
      rintangan[71].duri(height-60);
    }
    if (timer > 4425){
      rintangan[43].duri(height-60);
    } 
    if(timer > 4450){
      rintangan[13].kotak(height-150);
      rintangan[70].duri(height-60);
    }
    //selisih jarak 25===========
    
    if(timer > 4550){
      rintangan[14].kotak(height-150);
      
rintangan[69].duri(height-60);
    }
    
    if(timer > 4600){
      rintangan[15].kotak(height-150);
      rintangan[68].duri(height-60);
    }
    if (timer > 4650){
      //rintangan[44].duri(660);
    }
    if(timer > 4700){
      rintangan[16].kotak(height-150);
      rintangan[67].duri(height-60);
    }
    //12 rintangan
    
    if (timer > 4800){
      rintangan[17].kotak(height-150);
      rintangan[66].duri(height-60);
     }
    if (timer > 4825){
      rintangan[43].duri(height-60);
    }
    if(timer > 4850){
      rintangan[18].kotak(height-150);
      
rintangan[65].duri(height-60);
    }
    if (timer > 4875){
      rintangan[44].duri(height-60);
    }
    if(timer > 4900){
      rintangan[19].kotak(height-150);
      rintangan[64].duri(height-60);
    }
    //selisih jarak 25=======================
    
    if(timer > 5000){
      rintangan[20].kotak(height-150);
      rintangan[63].duri(height-60);
    }
    if (timer > 5025){
      rintangan[45].duri(height-60);
    } 
    if(timer > 5050){
      rintangan[21].kotak(height-150);
      rintangan[62].duri(height-60);
    }
    //selisih jarak 25===========
    
    if(timer > 5150){
      rintangan[22].kotak(height-150);
      rintangan[61].duri(height-60);
    }
    
    if(timer > 5200){
      rintangan[23].kotak(height-150);
      rintangan[60].duri(height-60);
    }
    if (timer > 5250){
      //rintangan[46].duri(660);
    }
    if(timer > 5300){
      rintangan[24].kotak(height-150);
      rintangan[59].duri(height-60);
    }
    //12 rintangan
    
    if (timer > 5350){
      rintangan[25].kotak(height-150);
      rintangan[58].duri(height-60);
     }
    if (timer > 5400){
      //rintangan[47].duri(height-80);
    }
    if(timer > 5450){
      rintangan[26].kotak(height-150);
      rintangan[57].duri(height-60);
    }
    if (timer > 5500){
      //rintangan[48].duri(height-80);
    }
    if(timer > 5550){
      rintangan[27].kotak(height-150);
      rintangan[56].duri(height-60);
    }
    //selisih jarak 25=======================
    
    if(timer > 5600){
      rintangan[28].kotak(height-150);
      rintangan[55].duri(height-60);
    }
    if (timer > 5650){
      //rintangan[49].duri(height-80);
    } 
    if(timer > 5700){
      rintangan[29].kotak(height-150);
      rintangan[54].duri(height-60);
    }
    //selisih jarak 25===========
    
    if(timer > 5750){
      rintangan[30].kotak(height-150);
      rintangan[53].duri(height-60);
    }
    
    if(timer > 5800){
      rintangan[31].kotak(height-150);
      rintangan[52].duri(height-60);
    }
    if (timer > 5850){
      //rintangan[50].duri(660);
    }
    if(timer > 5900){
      rintangan[32].kotak(height-150);
      rintangan[51].duri(height-60);
    }
    if((timer > 5950)&&(timer < 6000)){
      textAlign(CENTER);
      textSize(100);
      fill(255);
      text("Level Up",width/2,height/2);
    }
    //12 rintangan
 //48 rintangan=================
 //bagian level_4==========================
    if((timer > 6050)&&(timer < 6100)){
      //info mulai
      textAlign(CENTER);
      textSize(100);
      fill(random(200,255), random(200,255), random(200,255));
      textSize(200);
      text("level 4",width/2,height/2);
    }
    if(timer > 6150){
      rintangan[33].kotak(height-150);
    }
    if(timer > 6200){
      rintangan[34].kotak(height-150);
    }if(timer > 6250){
      rintangan[35].kotak(height-150);
    }
    
 } 