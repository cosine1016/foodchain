//多年草クラス
class Perennial extends Grass{
  
  //コンストラクタ
    Perennial( float _x, float _y, int _seed){
    super(_x,_y,_seed,1);
  }
  
  void Breeding(){
    if (graAge == 2000 ||
        graAge == 4000 ||
        graAge == 6000 ||
        graAge == 8000 ){
      for (int i = 0; i < graSeed; i++){
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
        int childSeed = graSeed;
        if ( (int)random(10) == 0){
          childSeed += 1 - random(2)*2;
        }
        if (childSeed == 0){graSeed = 1;};
        perList.add(new Perennial( childX, childY , childSeed));
        
      }
    }
  }
  
  
  //死亡メソッド
  void Die(int a){
    perList.remove(a);
  }
  
  
}