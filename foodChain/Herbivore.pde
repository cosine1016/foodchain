//草食動物クラス
class Herbivore extends Animal {
  
  //コンストラクタ
  Herbivore( float _x, float _y, int _full){
    super(_x,_y,_full,1);
    
  }
  
  //当たり判定メソッド
  void Collision(int a){
    //草食動物と一年草の衝突判定
    for( int i = 0; i < annList.size(); i++){
      Annual annWoke2 = (Annual)annList.get(i);
      //距離５以下なら捕食メソッドへ
      if(dist( aniX, aniY, annWoke2.graX, annWoke2.graY) < 10){
        annList.remove(i);
        Predation(i);
      }
    }
      //草食動物と多年草の衝突判定
    for( int i = 0; i < perList.size(); i++){
      Perennial perWoke2 = (Perennial)perList.get(i);
      //距離５以下なら捕食メソッドへ
      if(dist( aniX, aniY, perWoke2.graX, perWoke2.graY) < 10){
        perList.remove(i);
        Predation(i);
      }
    }
    
    //メスとオスの衝突判定
    if ((aniSex == 1) && (aniAge >= 300)){
      //メスのみ判定に入る
      for( int i = 0; i < herList.size(); i++){
        Herbivore herWoke2 = (Herbivore)herList.get(i);
        //距離５以下のオスなら生殖メソッドへ
        if((dist(aniX, aniY, herWoke2.aniX, herWoke2.aniY) < 5) && !(i == a) && (herWoke2.aniSex == 0 ) && (herWoke2.aniAge >= 300)){
          Reproduction(i);
        }
      }
    }
  }
  
  //捕食メソッド
  void Predation(int a){
    aniLife = aniFull;
  }
  
  //生殖メソッド
  void Reproduction(int a){
    if (aniPre == 0){
      //妊娠していないなら停止して妊娠変数を１に
      aniPre = 1;
      aniSpd = 0;
      //父親の遺伝情報と掛け合わせる
      Herbivore herWoke2 = (Herbivore)herList.get(a);
      childFull = (int)((herWoke2.aniFull + aniFull)/2 + random(100));
    }else{
      //妊娠しているなら妊娠変数を加速
      aniPre++;
      aniLife--;
    }
    if (aniPre >= 300){
      //妊娠変数が300に達したら出産及び速度を戻す
      for (int i = 0; i < 2;i++){
        herList.add(new Herbivore( aniX, aniY, childFull));
        aniPre = 0;
        aniSpd = 1;
      }
    }
  }
  
  //死亡メソッド
  void Die(int a){
    if( (int)random(2) == 1){
      annList.add(new Annual( aniX, aniY, (int)random(3) + 2));
    }else{
      perList.add(new Perennial( aniX, aniY, (int)random(3) + 1));
    }
    //死亡
    herList.remove(a);
    
  }
}