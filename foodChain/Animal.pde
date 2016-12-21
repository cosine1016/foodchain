//動物クラス
class Animal{
  float aniX;
  float aniY;
  float aniRad;
  float aniSpd;
  color aniCol;
  
  //コンストラクタ
  Animal( float _x, float _y, color _col){
   aniX = _x;
   aniY = _y;
   aniRad = random(360);
   aniSpd = 1;
   aniCol = _col;
  }
  
  //座標を更新
  void moveUpdate(){
    
    //角度更新
    if((int)random(100) == 0){
      aniRad += random(180) - 90;
    }else{
      aniRad += random(20) - 10;
    }
    
    //フィールド外に出ないように角度調整
    if ((aniX + cos(radians(aniRad))*aniSpd <=12) || (aniX + cos(radians(aniRad))*aniSpd >= 8 + fldX)){
      aniRad = 180 - aniRad;
    }
    if ((aniY + sin(radians(aniRad))*aniSpd <= 12) || (aniY + sin(radians(aniRad))*aniSpd >= 8 + fldY)){
      aniRad = - aniRad;
    }
    
    //座標更新
    aniX += cos(radians(aniRad))*aniSpd;
    aniY += sin(radians(aniRad))*aniSpd;
    aniSpd = random(100) / 100 + 0.5;
    
  }
  
  //画面に点を表示
  void screen(){
    
    //表示
    noStroke();
    fill(aniCol);
    ellipse(aniX,aniY,7,7);
  }
}