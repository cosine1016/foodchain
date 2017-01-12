//肉食動物クラス
class Carnivore extends Animal {

  //コンストラクタ
  Carnivore( float _x, float _y){
    super(_x,_y,color(255,0,0));
    
  }
  
  //捕食メソッド
  void Eat(){
    for( int i = 0; i < herList.size(); i++){
      Herbivore herWoke2 = (Herbivore)herList.get(i);
      //草食動物と肉食動物の衝突判定及び捕食
      if(dist( aniX, aniY, herWoke2.aniX, herWoke2.aniY) < 5){
        herList.remove(i);
      }
    }
  }
  
}