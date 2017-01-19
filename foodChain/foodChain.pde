//フィールドの広さの定義
public int fldX = 1600;
public int fldY = 900;

public ArrayList carList;  //肉食動物のリスト
public ArrayList herList;  //草食動物のリスト
public ArrayList annList;  //一年草のリスト
public ArrayList perList;  //多年草のリスト

//初期設定
void setup(){
  size( 1920, 1080);
  
  //肉食動物クラスの定義
  carList = new ArrayList();
  for( int i = 0; i < 50; i++){
    //アレイリストに肉食動物オブジェクトを追加
    carList.add(new Carnivore( random(fldX - 20) + 20,random(fldY - 20) + 20, (int)random(1000) + 4000));
    //初期処理
    Carnivore carWoke = (Carnivore)carList.get(i);
    carWoke.aniSetup();
  }

  
  //草食動物クラスの定義
  herList = new ArrayList();
  for( int i = 0; i < 150; i++){
    //アレイリストに草食動物オブジェクトを追加
    herList.add(new Herbivore( random(fldX - 20) + 20, random(fldY - 20) + 20 , (int)random(1000) + 2000));
    //初期処理
    Herbivore herWoke = (Herbivore)herList.get(i);
    herWoke.aniSetup();
  }
  
  //一年草クラスの定義
  annList = new ArrayList();
  for( int i = 0; i < 300; i++){
    //アレイリストに一年草オブジェクトを追加
    annList.add(new Annual( random(fldX - 20) + 20, random(fldY - 20) + 20 , (int)random(3) + 4));
    //初期処理
    Annual annWoke = (Annual)annList.get(i);
    annWoke.graSetup();
  }
  
  //多年草クラスの定義
  perList = new ArrayList();
  for( int i = 0; i < 300; i++){
    //アレイリストに多年草オブジェクトを追加
    perList.add(new Perennial( random(fldX - 20) + 20, random(fldY - 20) + 20 , (int)random(3) + 1));
    //初期処理
    Perennial perWoke = (Perennial)perList.get(i);
    perWoke.graSetup();
  }
  
}

//メインループ
void draw(){
  background(255);
  
  
  
  //枠の表示
  noFill();
  stroke(1);
  rect( 10, 10, fldX, fldY);
  
  //肉食動物クラスを更新
  for( int i = 0; i < carList.size(); i++){
    Carnivore carWoke = (Carnivore)carList.get(i);
    carWoke.moveUpdate(i);
  }
  
  //草食動物クラスを更新
  for( int i = 0; i < herList.size(); i++){
    Herbivore herWoke = (Herbivore)herList.get(i);
    herWoke.moveUpdate(i);
  }
  
  //一年草クラスを更新
  for( int i = 0; i < annList.size(); i++){
    Annual annWoke = (Annual)annList.get(i);
    annWoke.update(i);
  }
  
   //多年草クラスを更新
  for( int i = 0; i < perList.size(); i++){
    Perennial perWoke = (Perennial)perList.get(i);
    perWoke.update(i);
  }
  
  //肉食動物の当たり判定
  for( int i = 0; i < carList.size(); i++){
    Carnivore carWoke = (Carnivore)carList.get(i);
    carWoke.Collision(i);
  }
  
  //草食動物の当たり判定
  for( int i = 0; i < herList.size(); i++){
   Herbivore herWoke = (Herbivore)herList.get(i);
    herWoke.Collision(i);
  }
  
  //一年草クラスを更新
  for( int i = 0; i < annList.size(); i++){
    Annual annWoke = (Annual)annList.get(i);
    annWoke.screen();
  }
  
   //多年草クラスを更新
  for( int i = 0; i < perList.size(); i++){
    Perennial perWoke = (Perennial)perList.get(i);
    perWoke.screen();
  }
  
  //肉食動物クラスを表示
  for( int i = 0; i < carList.size(); i++){
    Carnivore carWoke = (Carnivore)carList.get(i);
    carWoke.screen();
  }
  
  //草食動物クラスを表示
  for( int i = 0; i < herList.size(); i++){
    Herbivore herWoke = (Herbivore)herList.get(i);
    herWoke.screen();
  }
  
  
}