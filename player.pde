class Player{
  //atribut (dipengaruhi oleh argumen)
  int _PlayerX; //posisi x untuk player
  int _PlayerY; //posisi y untuk player
  int _PlayerSize; //ukuran player
  int _startY; //posisi mulai player
  
  //atribut (tidak terpengaruh oleh argumen)
  int gravitasi = 6; //gravitasi player
  float lamalompatan = 20; //digunakan untuk menentukan berapa lama lompatan berlangsung
  int batasmelompat = 25; //batas untuk melompat
  boolean lompat = false; //Digunakan untuk memicu lompatan
  float jumpAngle = 0; //Digunakan untuk memicu lompatan sudut dimana objek player diputar
  float incrementAngle = PI/20; //kenaikan di mana jumpAngle akan berubah saat melompat
  boolean tanah = true; //Digunakan untuk menentukan kapan objek pemain diperbolehkan untuk melompat

  Player(int x, int y, int size){ // objek Player memiliki tiga argumen (ukuran, x, y)
    //pengaturan atribut sama dengan argumen
    _PlayerX = x;
    _PlayerY = y;
    _PlayerSize = size;
    _startY = y; //Digunakan untuk menentukan kapan gravitasi aktif
  }
  
  void jump(){ //membuat pemain melompat, ini akan dikontrol oleh orang yang bermain game
    if(tanah){ //jika pemain ada di tanah == benar
      lompat = true; //atur boolean menjadi benar, yang memicu lompatan "physics ()" 
    }
  }
  
  void physics(){ //dimasukkan ke dalam "draw ()" untuk terus memperbarui
    //gravitasi
    if(_PlayerY < _startY){ // jika posisi objek pemain kurang dari posisi awal y
      _PlayerY += gravitasi; //kenaikan posisi objek pemain dengan gravitasi
      tanah = false; 
    }else{
      tanah = true; 
    }
    
    // lompatan dipicu oleh metode "jump ()"
    if(lompat){
      _PlayerY -= 12; // menambahkan posisi y pemain yang mensimulasikan lompatan
      lamalompatan += 1; // menambah lompatan, yang menentukan kapan harus berhenti melompat 
    }
    if(lamalompatan >= batasmelompat){ //Saat player mencapai batas maka lompat berhenti
      lompat = false;
      lamalompatan = 0; //lamalompatan di setel ulang
    }
    //berputar saat di udara
    if(!tanah){
      jumpAngle += incrementAngle; //menambah jumpAngle, mengaktifkan rotate di "display ()"
    }
    if(tanah){
      jumpAngle = 0; //reset jumpAngle sehingga objek Player selalu bahkan ketika di "lantai"
    }
  }
  
  //Dapatkan metode untuk digunakan saat memeriksa tabrakan dengan rintangan
  int getX(){ 
    return _PlayerX + _PlayerSize/2; //mengembalikan lokasi koordinat depan pemain
  }
  int getY(){
    return _PlayerY + _PlayerSize/2; //mengembalikan lokasi koordinat bawah pemain
  }


  void display(){ //dimasukkan ke dalam "draw ()" untuk terus memperbarui
    pushMatrix(); //matriks yang diperlukan untuk memuat transformasi rotasi
    
    rectMode(CENTER); //atur rectMode
    translate(_PlayerX, _PlayerY); // atur 0,0 digunakan untuk memutar dengan benar
    rotate(jumpAngle); //selalu berputar, tapi jumpAngle diatur ke 0, yang berarti tidak berputar
    
    //Mirip dengan fungsi pemandangan ia memiliki warna gradien
    strokeWeight(2);
    stroke(22, 85, 60);
    fill(53, 240, 165);
    rect(0, 0, _PlayerSize, _PlayerSize);
    noStroke();
    fill(56, 243, 168);
    ellipse(0, 0, _PlayerSize*0.9, _PlayerSize*0.9);
    fill(59, 246, 171);
    ellipse(0, 0, _PlayerSize*0.8, _PlayerSize*0.8);
    fill(62, 249, 174);
    ellipse(0, 0, _PlayerSize*0.7, _PlayerSize*0.7);
    fill(65, 252, 177);
    ellipse(0, 0, _PlayerSize*0.6, _PlayerSize*0.6);
    fill(68, 255, 180);
    ellipse(0, 0, _PlayerSize*0.5, _PlayerSize*0.5);
    popMatrix();//matriks yang diperlukan untuk memuat transformasi rotasi
  }
}