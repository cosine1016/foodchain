//フィールドの広さの定義
public int fldX = 800;
public int fldY = 450;

ArrayList carList;

//初期設定
void setup(){
  size( 1200, 675);
  
  //肉食動物クラスの定義
  carList = new ArrayList();
  for( int i = 0; i < 30; i++){
    //アレイリストに肉食動物オブジェクトを追加
    carList.add(new Carnivore( random(fldX - 20) + 10,random(fldY - 20) + 10));
  }
  
}

//メインループ
void draw(){
  background(255);
  
  
  
  //枠の表示
  noFill();
  stroke(1);
  rect( 10, 10, fldX, fldY);
  
  //肉食動物クラスを作業クラスに出して更新及び表示
  for( int i = 0; i < carList.size(); i++){
    Carnivore carWoke = (Carnivore)carList.get(i);
    carWoke.moveUpdate();
    carWoke.screen();
  }
  
}