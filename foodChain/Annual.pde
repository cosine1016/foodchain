//一年草クラス
class Annual extends Grass{
  
  //コンストラクタ
  Annual( float _x, float _y, int _seed){
    super(_x,_y,_seed,0);
    
    
  }
  
  //死亡メソッド
  void Die(int index){
    //枯れるとき新たな種をまく（個数：graSeed）
    for (int i = 0; i < graSeed; i++){
      float childX;
      float childY;
      //フィールド外に出ないように調整
      for(;;){
        childX = graX + random(100) - 50;
        if (!(childX <= 13 || childX >= 7 + fldX )){break;}
      }
      for(;;){
        childY = graY + random(100) - 50;
        if (!(childY <= 13 ||childY >= 7 + fldY)){break;}
      }
      //graSeedの値をランダムで増減（１以上）
      int childSeed = graSeed;
      if ( (int)random(10) == 0){
        childSeed += 1 - random(2)*2;
      }
      if (childSeed == 0){graSeed = 1;};
      //BORNを表示するオブジェクトを追加
      chaList.add(new Chara(childX,childY,"BORN"));
      //子供をリストに追加
      annList.add(new Annual( childX, childY , childSeed));
      
    }
    //DIEを表示するオブジェクトを追加
    chaList.add(new Chara(graX,graY,"DIE"));
    //死亡
    annList.remove(index);
    
    
  }
  
  
}