//肉食動物クラス
class Carnivore extends Animal {

  //コンストラクタ
  Carnivore( float _x, float _y){
    super(_x,_y,color(255,0,0));
    
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
  }
  
  //捕食メソッド
  void Predation(int a){
    //捕食
    herList.remove(a);
    //体力回復実装予定
  }
  
  //生殖メソッド
  void Reproduction(int a){
    
  }
  
  
  
}