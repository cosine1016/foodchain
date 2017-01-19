//動物クラス
abstract class Animal{
  float aniX;      //現在のx座標
  float aniY;      //現在のy座標
  float aniRad;    //向いてる角度
  float aniSpd;    //速度
  int   aniType;   //種類（0で肉食動物、1で草食動物
  int   aniSex;    //性別（0でオス、1でメス）
  int   aniPre;    //妊娠変数（1以上で妊娠）
  int   aniAge;    //年齢（一定値で寿命）
  int   aniLife;   //満腹度
  int   aniFull;   //満腹度最大値（遺伝変数）
  int   aniSpan;   //寿命
  color aniCol;    //色
  int childFull;   //子供に遺伝する際の情報置き場
  
  //コンストラクタ
  Animal( float _x, float _y, int _full, int _type){
   aniX = _x;
   aniY = _y;
   aniRad = random(360);
   aniSpd = 1;
   aniType = _type;
   aniSex = (int)random(2);
   aniPre = 0;
   aniAge = 0;
   aniLife = _full;
   aniFull = _full;
   if (aniType == 0){
     aniSpan = 10000;
     aniCol = color(255,0,0);
   }else if(aniType == 1){
     aniSpan = 5000;
     aniCol = color(0,0,255);
   }
  }
  
  
  //更新
  void moveUpdate(int a){
    
    //角度更新
    aniRad += random(10) - 5;
    
    //動けば腹は減るものだ
    aniLife--;
    
    //ついでに年も取るものだ
    aniAge++;
    
    //妊娠しているなら生殖メソッドへ
    if (!(aniPre == 0)){
      Reproduction(0);  //更新メソッドから移動する場合引数に意味はない
    }
    
    if ((aniLife <= 0) || (aniAge >= aniSpan)){  //肉食動物と草食動物の寿命を可変にしたいので考慮の必要あり
      Die(a);
    }
    
    
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
  
  //初期処理
  void aniSetup(){
    //初期年齢をランダム化
    aniAge += random(1000);
    
  }
  
  
  //抽象化当たり判定メソッド
  abstract void Collision(int a);
  
  
  //抽象化捕食メソッド
  abstract void Predation(int a);
  
  
  //抽象化生殖メソッド
  abstract void Reproduction(int a);
  
  
  //抽象化死亡メソッド
  abstract void Die(int a);
  
  
}