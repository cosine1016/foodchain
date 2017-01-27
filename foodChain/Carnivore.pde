//肉食動物クラス
class Carnivore extends Animal {

  //コンストラクタ
  Carnivore( float _x, float _y, int _full){
    super(_x,_y,_full,0);
    
  }
  
  //当たり判定メソッド
  void Collision(int index){
    //草食動物と肉食動物の衝突判定
    for( int i = 0; i < herList.size(); i++){
      //距離５以下なら捕食メソッドへ
      if(dist( aniX, aniY, herList.get(i).aniX, herList.get(i).aniY) < 5){
        Predation(i);
      }
    }
    
    //メスとオスの衝突判定
    if ((aniSex == 1) && (aniAge >= 1000)){
      //メスのみ判定に入る
      for( int i = 0; i < carList.size(); i++){
        //距離５以下のオスなら生殖メソッドへ
        if((dist(aniX, aniY, carList.get(i).aniX, carList.get(i).aniY) < 5) && 
                 (carList.get(i).aniSex == 0 ) &&
                 (carList.get(i).aniAge >= 1000)){
          Reproduction(i);
        }
      }
    }
  }
  
  //捕食メソッド
  void Predation(int index){
    //捕食
    //EATを表示するオブジェクトを追加
    chaList.add(new Chara(aniX,aniY,"EAT"));
    //対象を殺害
    herList.get(index).Die(index);
    //体力回復
    aniLife = aniFull;
  }
  
  //生殖メソッド
  void Reproduction(int index){
    if (aniPre == 0){
      //妊娠していないなら停止して妊娠変数を１に
      aniPre = 1;
      aniSpd = 0;
      //父親の遺伝情報と掛け合わせる
      childFull = (int)((carList.get(index).aniFull + aniFull)/2 + random(100) - 50);
    }else{
      //妊娠しているなら妊娠変数を増加
      aniPre++;
      //妊娠中は満腹度消費増加
      aniLife--;
    }
    if (aniPre >= 500){
      //妊娠変数が500に達したら出産及び速度を戻す
      carList.add(new Carnivore( aniX, aniY, childFull));
      //BORNを表示するオブジェクトを追加
      chaList.add(new Chara(aniX,aniY,"BORN"));
      aniPre = 0;
      aniSpd = CarSpeed;
    }
  }
  
  //死亡メソッド
  void Die(int index){
    //死亡時植物の種をまく（４個）
    for(int i = 0; i < 4;i++){
      float childX;
      float childY;
      //フィールド外に出ないように調整
      for(;;){
        childX = aniX + random(100) - 50;
        if (!(childX <= 13 || childX >= 7 + fldX )){break;}
      }
      for(;;){
        childY = aniY + random(100) - 50;
        if (!(childY <= 13 ||childY >= 7 + fldY)){break;}
      }
      //一年草と多年草のどちらが生まれるかはランダムで決定
      if( (int)random(2) == 1){
        annList.add(new Annual( childX, childY, (int)random(3) + 2));
      }else{
        perList.add(new Perennial( childX, childY, (int)random(3) + 1));
      }
    }
    //DIEを表示するオブジェクトを追加
    chaList.add(new Chara(aniX,aniY,"DIE"));
    //死亡
    carList.remove(index);
  }
  
}