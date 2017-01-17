//草食動物クラス
class Herbivore extends Animal {
  
  //コンストラクタ
  Herbivore( float _x, float _y, int _full){
    super(_x,_y,_full,color(0,0,255));
    
  }
  
  //当たり判定メソッド
  void Collision(int a){
    
  }
  
  //捕食メソッド
  void Predation(int a){
    
  }
  
  //生殖メソッド
  void Reproduction(int a){
    
  }
  
  //死亡メソッド
  void Die(int a){
    //死亡
    herList.remove(a);
    //種をまく予定
    
  }
}