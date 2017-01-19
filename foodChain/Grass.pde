//抽象化植物クラス
abstract class Grass{
  float graX;     //x座標
  float graY;     //y座標
  int   graAge;   //年齢
  int   graSpan;  //寿命
  int   graSeed;  //種子の数（遺伝変数）
  int   graType;  //種類（0なら一年草、1なら多年草）
  int   graSize;  //表示の大きさ
  color graCol;   //色
  
  //コンストラクタ
  Grass( float _x, float _y, int _seed, int _type){
    graX = _x;
    graY = _y;
    graSeed = _seed;
    graType = _type;
    if (graType == 0){
      graSpan = 2000;
      graCol  = color( 0, 255, 0);
    }else if(graType == 1){
      graSpan = 10000;
      graCol  = color( 0, 80, 0);
    }
  }
  
  
  //更新メソッド
  void update(int a){
    
    //歳をとる
    graAge++;
    
    //子供か大人か区別する
    if ( graAge <= graSpan*0.2){
      graSize = 5;
    }else{
      graSize = 7;
    }
    
    
    //寿命なら死亡
    if ( graAge >= graSpan ){
      Die(a);
    }
    
  }
  
  void screen(){
    noStroke();
    fill(graCol);
    if ( graAge <= graSpan*0.2){
      ellipse( graX, graY, 7, 7);
    }else{
      ellipse( graX, graY, 10, 10);
    }

  }
  
  //初期処理
  void graSetup(){
    //初期年齢をランダム化
    graAge += random(1000);
    
  }
  
  //抽象化死亡メソッド
  abstract void Die(int a);
  
}