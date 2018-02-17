class rintangan{
  //attributes
  int _startX;
  int _duriX;
  int _duriY;
  int _kotakX;
  int _kotakY;
  int _papanX;
  int _papanY;
  int _speed;
  boolean _abaikan;
  
  rintangan(int x){ //hanya memiliki satu argumen, yang startX, kotakX dan duriX semuanya sesuai
    _startX = x;
    _kotakX = _startX;
    _duriX = _startX;
    _papanX = _startX;
    _abaikan = false;
  }
  
  void duri(int y){ //hambatan duri ( mematikan dari depan dan atas)
    _duriY = y; //koordinat y dari rintangan, ditetapkan sesuai dengan argumen yang dibangun
    strokeWeight(2);
    stroke(150);
    fill(200,200,200);
    triangle(_duriX, _duriY, _duriX+30, _duriY, _duriX+15, _duriY-50);
    _duriX -= _speed;
  }
  
  void kotak(int y){ 
    _kotakY = y; 
    rectMode(CENTER);
    strokeWeight(2);
    stroke(150);
    fill(0);
    rect(_kotakX, _kotakY, 50, 50); 
    _kotakX -= _speed;
  }
  void papan(int y){
    _papanY = y;
    rectMode(CENTER);
    noStroke();
    fill(150,80,0);
    rect(_papanX,_papanY,500,50);
    _papanX -= _speed;
  }
  
  void abaikan(){ //Digunakan untuk membuat objek Player mampu melompat di atas rintangan persegi
    _abaikan = true;
  }
  
//Dapatkan metode yang bisa digunakan saat memeriksa tabrakan dengan objek Player
  //untuk hambatan duri
  int duriGetX1(){
    return _duriX+5; //Kembali koordinat depan spike 
  }
  int duriGetX2(){
    return _duriX+75; //Kembali koordinat belakang spike
  }
  int duriGetY1(){
    return _duriY-50; //Kembali koordinat atas spike
  }
  int duriGetY2(){
    return _duriY; //Kembali koordinat bawah spike
  }
  
  //untuk hambatan kotak
  int kotakGetX1(){ //Kembalikan koordinat depan kotak
    return _kotakX-25;
  }
  int kotakGetX2(){ //Kembalikan koordinat belakang kotak
    return _kotakX+75;
  }
  int kotakGetY1(){ //Kembalikan koordinat atas kotak
    return _kotakY-25;
  }
  int kotakGetY2(){ //Kembalikan koordinat bawah kotak
    return _kotakY+25;
  }
  
   //untuk hambatan papan
  int papanGetX1(){ //Kembalikan koordinat depan papan
    return _papanX-250;
  }
  int papanGetX2(){ //Kembalikan koordinat belakang papan
    return _papanX+250;
  }
  int papanGetY1(){ //Kembalikan koordinat atas papan
    return _papanY-25;
  }
  int papanGetY2(){ //Kembalikan koordinat bawah papan
    return _papanY+25;
  }
  
  void pindah(int speed){ //menentukan kecepatan dimana rintangan bergerak sepanjang sumbu x dengan kecepatan == _speed
    _speed = speed;
  }
} 