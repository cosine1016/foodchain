//抽象化植物クラス
abstract class Grass{
  float graX;     //x座標
  float graY;     //y座標
  int   graAge;   //年齢
  int   graSpan;  //寿命
  int   graSeed;  //種子の数（遺伝変数）
  int   graType;  //種類（0なら一年草、1なら多年草）
  color graCol;   //色
  
  //コンストラクタ
  Grass( float _x, float _y, int _seed, int _type){
    graX = _x;       //x座標を引き出した値に設定
    graY = _y;       //y座標を引き出した値に設定
    graSeed = _seed; //繁殖時の子孫個体数の引き継ぎ
    graType = _type; //植物の種類を保存する変数に引数を代入
    //草の種類ごとに設定を変更
    if (graType == 0){      //一年草の設定
      graSpan = 1000;              //寿命を1000Fに設定
      graCol  = color( 0, 255, 0); //色を黄緑に設定
    }else if(graType == 1){ //多年草の設定
      graSpan = 5000;              //寿命を1000Fに設定
      graCol  = color( 0, 80, 0); //色を黄緑に設定
    }
  }
  
  
  //更新メソッド
  void update(int a){
    
    //歳をとる
    graAge++;
    
    
    //寿命なら死亡
    if ( graAge >= graSpan ){
      Die(a);
    }
    
  }
  
  //表示メソッド
  void screen(){
    noStroke();
    fill(graCol);
    ellipse( graX, graY, 10, 10);
  }
  
  //初期処理
  void graSetup(){
    //初期年齢をランダム化
    graAge += random(1000);
    
  }
  
  //抽象化死亡メソッド
  abstract void Die(int index);
  
}