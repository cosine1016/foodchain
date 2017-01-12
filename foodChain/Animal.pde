//動物クラス
abstract class Animal{
  float aniX;      //現在のx座標
  float aniY;      //現在のy座標
  float aniGoalX;  //目的地のx座標
  float aniGoalY;  //目的地のy座標
  float aniRad;    //向いてる角度
  float aniSpd;    //速度
  color aniCol;    //色別
  
  //コンストラクタ
  Animal( float _x, float _y, color _col){
   aniX = _x;
   aniY = _y;
   aniGoalX = random(fldX) + 10;
   aniGoalY = random(fldY) + 10;
   aniRad = random(360);
   aniSpd = 1;
   aniCol = _col;
  }
  
  //座標を更新
  void moveUpdate(){
    
    //角度更新
    aniRad += random(10) - 5;
    
    //フィールド外に出ないように角度調整
    if (aniX + cos(radians(aniRad))*aniSpd <= 13 || aniX + cos(radians(aniRad))*aniSpd >= 7 + fldX ){
      aniRad = 180 - aniRad;
    }
    if (aniY + sin(radians(aniRad))*aniSpd <= 13 || aniY + sin(radians(aniRad))*aniSpd >= 7 + fldY ){
      aniRad *= -1;
    }
    
    //座標更新
    aniX += cos(radians(aniRad))*aniSpd;
    aniY += sin(radians(aniRad))*aniSpd;
    
  }
  
  //画面に点を表示
  void screen(){
    
    //表示
    noStroke();
    fill( aniCol);
    ellipse( aniX, aniY, 10, 10);
    
  }
  
  //抽象化捕食クラス
  abstract void Eat();
}