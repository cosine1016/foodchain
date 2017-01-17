//肉食動物クラス
class Carnivore extends Animal {

  //コンストラクタ
  Carnivore( float _x, float _y, int _full){
    super(_x,_y,_full,color(255,0,0));
    
  }
  
  //当たり判定メソッド
  void Collision(int a){
    //草食動物と肉食動物の衝突判定
    for( int i = 0; i < herList.size(); i++){
      Herbivore herWoke2 = (Herbivore)herList.get(i);
      //距離５以下なら捕食メソッドへ
      if(dist( aniX, aniY, herWoke2.aniX, herWoke2.aniY) < 5){
        Predation(i);
      }
    }
    if ((aniSex == 1) && (aniAge >= 1000)){
      //メスのみ判定に入る
      for( int i = 0; i < carList.size(); i++){
        Carnivore carWoke2 = (Carnivore)carList.get(i);
        //距離５以下のオスなら生殖メソッドへ
        if((dist(aniX, aniY, carWoke2.aniX, carWoke2.aniY) < 5) && !(i == a) && (carWoke2.aniSex == 0 ) && (aniAge >= 1000)){
          Reproduction(i);
        }
      }
    }
  }
  
  //捕食メソッド
  void Predation(int a){
    //捕食
    Herbivore herWoke2 = (Herbivore)herList.get(a);
    herWoke2.Die(a);
    //体力回復
    aniLife = aniFull;
  }
  
  //生殖メソッド
  void Reproduction(int a){
    if (aniPre == 0){
      //妊娠していないなら停止して妊娠変数を１に
      aniPre = 1;
      aniSpd = 0;
      //父親の遺伝情報と掛け合わせる
      Carnivore carWoke2 = (Carnivore)carList.get(a);
      childFull = (int)((carWoke2.aniFull + aniFull)/2 + random(100));
    }else{
      //妊娠しているなら妊娠変数を加速
      aniPre++;
      aniLife--;
    }
    if (aniPre >= 1000){
      //妊娠変数が1000に達したら出産及び速度を戻す
      carList.add(new Carnivore( aniX, aniY, childFull));
      aniPre = 0;
      aniSpd = 1;
    }
  }
  
  
  //死亡メソッド
  void Die(int a){
    //死亡
    carList.remove(a);
    //種をまく予定
  }
  
  
}