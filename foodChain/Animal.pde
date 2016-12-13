class Animal{
  float aniX;
  float aniY;
  float aniRad;
  float aniSpd;
  color aniCol;
  
  Animal( float _x, float _y, color _col){
   aniX = _x;
   aniY = _y;
   aniRad = random(360);
   aniSpd = 10;
   aniCol = _col;
  }
  
  //座標を更新
  void moveUpdate(){
    
    //フィールド外に出ないように角度調整
    if ((aniX + cos(radians(aniRad))*aniSpd <= 10) || (aniX + cos(radians(aniRad))*aniSpd >= 10 + fldX)){
      aniRad = 180 - aniRad;
    }
    if ((aniY + sin(radians(aniRad))*aniSpd <= 10) || (aniY + sin(radians(aniRad))*aniSpd >= 10 + fldY)){
      aniRad = - aniRad;
    }
    
    //座標更新
    aniX += cos(radians(aniRad))*aniSpd;
    aniY += sin(radians(aniRad))*aniSpd;
    
    //角度更新
    aniRad += random(30) - 15;
  }
  
  //画面に点を表示
  void screen(){
    
    //表示
    color(aniCol);
    ellipse(aniX,aniY,5,5);
  }
}