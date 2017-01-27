//多年草クラス
class Perennial extends Grass{
  
  //コンストラクタ
    Perennial( float _x, float _y, int _seed){
    super(_x,_y,_seed,1);
  }
  
  //繁殖メソッド
  void Breeding(){
    //一定周期で新たな種をまく（個数：graSeed）
    if (graAge == 1000 ||
        graAge == 2000 ||
        graAge == 3000 ||
        graAge == 4000 ){
      for (int i = 0; i < graSeed; i++){
        //フィールド外に出ないように調整
        float childX;
        float childY;
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
        //子供をリストに追加
        chaList.add(new Chara(childX,childY,"BORN"));
        perList.add(new Perennial( childX, childY , childSeed));
      }
    }
  }
  
  
  //死亡メソッド
  void Die(int index){
    //DIEと表示するオブジェクトを追加
    chaList.add(new Chara(graX,graY,"DIE"));
    //死亡
    perList.remove(index);
  }
}