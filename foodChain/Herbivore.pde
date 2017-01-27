//草食動物クラス
class Herbivore extends Animal {
  
  //コンストラクタ
  Herbivore( float _x, float _y, int _full){
    super(_x,_y,_full,1);
    
  }
  
  //当たり判定メソッド
  void Collision(int index){
    //草食動物と一年草の衝突判定
    for( int i = 0; i < annList.size(); i++){
      //距離５以下なら捕食メソッドへ
      if(dist( aniX, aniY, annList.get(i).graX, annList.get(i).graY) < 10){
        //植物を殺害
        annList.remove(i);
        Predation(i);
      }
    }
      //草食動物と多年草の衝突判定
    for( int i = 0; i < perList.size(); i++){
      //距離５以下なら捕食メソッドへ
      if(dist( aniX, aniY, perList.get(i).graX, perList.get(i).graY) < 10){
        //植物を殺害
        perList.remove(i);
        Predation(i);
      }
    }
    
    //メスとオスの衝突判定
    if ((aniSex == 1) && (aniAge >= 300)){
      //メスのみ判定に入る
      for( int i = 0; i < herList.size(); i++){
        //距離５以下のオスなら生殖メソッドへ
        if((dist(aniX, aniY, herList.get(i).aniX, herList.get(i).aniY) < 5) &&
                !(i == index) && 
                (herList.get(i).aniSex == 0 ) && 
                (herList.get(i).aniAge >= 300)){
          Reproduction(i);
        }
      }
    }
  }
  
  //捕食メソッド
  void Predation(int index){
    //EATと表示するオブジェクトを追加
    chaList.add(new Chara(aniX,aniY,"EAT"));
    //満腹度を最大に
    aniLife = aniFull;
  }
  
  //生殖メソッド
  void Reproduction(int index){
    if (aniPre == 0){
      //妊娠していないなら停止して妊娠変数を１に
      aniPre = 1;
      aniSpd = 0;
      //父親の遺伝情報と掛け合わせる
      childFull = (int)((herList.get(index).aniFull + aniFull)/2 + random(100));
    }else{
      //妊娠しているなら妊娠変数を加速
      aniPre++;
      aniLife--;
    }
    if (aniPre >= 300){
      //妊娠変数が300に達したら出産及び速度を戻す
      for (int i = 0; i < 2;i++){
        herList.add(new Herbivore( aniX, aniY, childFull));
        //BORNと表示するオブジェクトを追加
        chaList.add(new Chara(aniX,aniY,"BORN"));
        aniPre = 0;
        aniSpd = HerSpeed;
      }
    }
  }
  
  //死亡メソッド
  void Die(int index){
    //死亡時植物の種をまく（１個）
    //一年草と多年草のどちらが生まれるかはランダムで決定
    if( (int)random(2) == 1){
      annList.add(new Annual( aniX, aniY, (int)random(3) + 2));
    }else{
      perList.add(new Perennial( aniX, aniY, (int)random(3) + 1));
    }
    chaList.add(new Chara(aniX,aniY,"DIE"));
    //死亡
    herList.remove(index);
    
  }
}