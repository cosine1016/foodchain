//一年草クラス
class Annual extends Grass{
  
  //コンストラクタ
  Annual( float _x, float _y, int _seed){
    super(_x,_y,_seed,0);
    
    
  }
  
  //死亡メソッド
  void Die(int a){
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
      int childSeed = (int)(graSeed + random(3) - 1);
      if (childSeed == 0){graSeed = 1;};
      annList.add(new Annual( childX, childY , childSeed));
      
    }
    annList.remove(a);
    
    
  }
  
  
}