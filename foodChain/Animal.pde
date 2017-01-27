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
   //初期化
   aniX = _x;               //x座標を引き出した値に設定
   aniY = _y;               //x座標を引き出した値に設定
   aniRad = random(360);    //角度をランダムに
   aniType = _type;         //動物の種類を保存する変数に引数を代入
   aniSex = (int)random(2); //性別をランダムに
   aniPre = 0;              //妊娠変数を０に
   aniAge = 0;              //年齢を０に
   aniLife = _full;         //満腹度を満腹度最大値に設定
   aniFull = _full;         //満腹度最大値を引き出した値に設定
   //動物の種類によっての値の変化
   if (aniType == 0){     //肉食動物の設定
     aniSpan = 20000;         //寿命を20000Fに設定
     aniCol = color(255,0,0); //点の色を赤に
     aniSpd = CarSpeed;       //速度を設定
   }else if(aniType == 1){ //草食動物の設定
     aniSpan = 10000;         //寿命を10000Fに設定
     aniCol = color(0,0,255); //点の色を青に設定
     aniSpd = HerSpeed;       //速度を設定
   }
  }
  
  
  //更新
  void update(int index){
    
    //角度更新
    aniRad += random(10) - 5;
    
    //満腹度減少
    aniLife--;
    
    //年齢増加
    aniAge++;
    
    //妊娠しているなら生殖メソッドへ
    if (!(aniPre == 0)){
      Reproduction(0);  //更新メソッドから移動する場合引数に意味はない
    }
    
    //寿命なら死
    if ((aniLife <= 0) || (aniAge >= aniSpan)){
      Die(index);
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
    
    //雄の個体数をカウント
    //本来なら更新メソッドに置きたい処理だがコリジョンメソッドで個体数が変化してしまうため表示メソッドに
    if(aniSex == 0){ //雄かどうか判定
      if(aniType == 0){ //どちらの動物か判定
        carSexParc++;
      }else{
        herSexParc++;
      }
    }
    
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
  abstract void Collision(int index);
  
  
  //抽象化捕食メソッド
  abstract void Predation(int index);
  
  
  //抽象化生殖メソッド
  abstract void Reproduction(int index);
  
  
  //抽象化死亡メソッド
  abstract void Die(int index);
  
  
}