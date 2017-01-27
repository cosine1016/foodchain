public int fldX = 800; //フィールドの横の広さ
public int fldY = 450; //フィールドの縦の広さ
public int carSexParc; //肉食動物の雄の個体数をカウントする関数
public int herSexParc; //草食動物の雄の個体数をカウントする関数
public float CarSpeed = 1;    //肉食動物の速度を1に設定
public float HerSpeed  = 0.7; //草食動物の速度を0.7に設定
int Fcount;             //フレーム数をカウントする関数


public ArrayList<Carnivore> carList;  //肉食動物のリスト
public ArrayList<Herbivore> herList;  //草食動物のリスト
public ArrayList<Annual>    annList;  //一年草のリスト
public ArrayList<Perennial> perList;  //多年草のリスト
public ArrayList<Chara>     chaList;  //フィールドに表示する文字のリスト
public ArrayList<Graph>     graphList;//個体数生体分率のリスト

//初期設定
void setup(){
  //ウィンドウサイズを定義
  size( 1200, 675);
  //text関数の中心を中央に設定
  textAlign(CENTER);
  
  //肉食動物クラスの定義
  carList = new ArrayList();
  for( int i = 0; i < 20; i++){
    //アレイリストに肉食動物オブジェクトを追加
    carList.add(new Carnivore( random(fldX - 20) + 20,random(fldY - 20) + 20, (int)random(100) + 1500));
    //初期処理
    carList.get(i).aniSetup();
  }
  
  //草食動物クラスの定義
  herList = new ArrayList();
  for( int i = 0; i < 100; i++){
    //アレイリストに草食動物オブジェクトを追加
    herList.add(new Herbivore( random(fldX - 20) + 20, random(fldY - 20) + 20 , (int)random(100) + 1000));
    //初期処理
    herList.get(i).aniSetup();
  }
  
  //一年草クラスの定義
  annList = new ArrayList();
  for( int i = 0; i < 300; i++){
    //アレイリストに一年草オブジェクトを追加
    annList.add(new Annual( random(fldX - 20) + 20, random(fldY - 20) + 20 , (int)random(3) + 2));
    //初期処理
    annList.get(i).graSetup();
  }
  
  //多年草クラスの定義
  perList = new ArrayList();
  for( int i = 0; i < 300; i++){
    //アレイリストに多年草オブジェクトを追加
    perList.add(new Perennial( random(fldX - 20) + 20, random(fldY - 20) + 20 , (int)random(3) + 1));
    //初期処理
    perList.get(i).graSetup();
  }
  
  //文字クラスの定義
  chaList = new ArrayList();
  //個体数生存分率構造体の定義
  graphList = new ArrayList();
}


//メインループ
void draw(){
  //背景を白に（画面のリセット）
  background(255);
  //フレーム数をカウント
  Fcount++;
  
  //枠の表示（塗りつぶし無し・線の太さは１）
  noFill();
  stroke(1);
  rectMode(CORNER);
  rect( 10, 10, fldX, fldY);
  
  //肉食動物クラスを更新
  for( int i = 0; i < carList.size(); i++){
    carList.get(i).update(i);
  }
  
  //草食動物クラスを更新
  for( int i = 0; i < herList.size(); i++){
    herList.get(i).update(i);
  }
  
  //一年草クラスを更新
  for( int i = 0; i < annList.size(); i++){
    annList.get(i).update(i);
  }
  
   //多年草クラスを更新
  for( int i = 0; i < perList.size(); i++){
    perList.get(i).update(i);
  }
  
  //肉食動物の当たり判定
  for( int i = 0; i < carList.size(); i++){
    carList.get(i).Collision(i);
  }
  
  //草食動物の当たり判定
  for( int i = 0; i < herList.size(); i++){
    herList.get(i).Collision(i);
  }
  
  //一年草クラスを表示
  for( int i = 0; i < annList.size(); i++){
    annList.get(i).screen();
  }
  //多年草クラスを表示
  for( int i = 0; i < perList.size(); i++){
    perList.get(i).screen();
    perList.get(i).Breeding();
  }
  
  //雄の個体数のカウントを0に
  carSexParc = 0;
  //肉食動物クラスを表示
  for( int i = 0; i < carList.size(); i++){
    carList.get(i).screen();
  }
  
  //雄の個体数のカウントを0に
  herSexParc = 0;
  //草食動物クラスを表示
  for( int i = 0; i < herList.size(); i++){
    herList.get(i).screen();
  }
  
  //文字リストの更新及び表示
  for( int i = 0; i < chaList.size(); i++){
    chaList.get(i).update(i);
  }
  
  //フィールド外のユーザインタフェース関数
  disPlay();
}

//ユーザインタフェース関数
void disPlay(){
  //現個体数を構造体に保存
  graphList.add(new Graph( carList.size(), herList.size(), annList.size(), perList.size())); 
  
  //食物連鎖ピラミッドの描画
  rectMode(CENTER);
  //赤色で肉食動物の個体数を最新の構造体から呼び出して描画
  fill(255,0,0);
  rect(1000,500,graphList.get(graphList.size()-1).Car,50);
  //青色で草食動物の個体数を最新の構造体から呼び出して描画
  fill(0,0,255);
  rect(1000,550,graphList.get(graphList.size()-1).Her,50);
  //黄緑色で植物全体の個体数を最新の構造体から呼び出して描画
  fill(0,255,0);
  float grassAll = graphList.get(graphList.size()-1).Ann + graphList.get(graphList.size()-1).Per;
  rect(1000,600,grassAll,50);
  //深緑色で多年草のみの個体数を描画
  rectMode(CORNER);
  fill(0,80,0);
  rect(1000 - (grassAll/2),575,graphList.get(graphList.size()-1).Per,50);
  
  //肉食動物全体のステータスを赤色で表示
  fill(255,0,0);
  text("CARNIVORE",1000,50);
  text("PARCENT",900,70);
  text("ABSOLUTE",1000,70);
  text("GENDER",1100,70);
  text(graphList.get(graphList.size()-1).parcCar,900,90);                                //生物全体に対しての割合
  text(graphList.get(graphList.size()-1).Car,1000,90);                                   //個体数
  text(carSexParc + ":" + (graphList.get(graphList.size()-1).Car - carSexParc),1100,90); //雄雌比
  
  //草食動物全体のステータスを青色で表示
  fill(0,0,255);
  text("HERBIVORE",1000,150);
  text("PARCENT",900,170);
  text("ABSOLUTE",1000,170);
  text("GENDER",1100,170);
  text(graphList.get(graphList.size()-1).parcHer,900,190);                                //生物全体に対しての割合
  text(graphList.get(graphList.size()-1).Her,1000,190);                                   //個体数
  text(herSexParc + ":" + (graphList.get(graphList.size()-1).Her - herSexParc),1100,190); //雄雌比
  
  //一年草全体のステータスを黄緑色で表示
  fill(0,255,0);
  text("ANNUAL",1000,250);
  text("PARCENT",950,270);
  text("ABSOLUTE",1050,270);
  text(graphList.get(graphList.size()-1).parcAnn,950,290); //生物全体に対しての割合
  text(graphList.get(graphList.size()-1).Ann,1050,290);    //個体数
  
  //多年草全体のステータスを深緑色で表示
  fill(0,80,0);
  text("PERENNIL",1000,350);
  text("PARCENT",950,370);
  text("ABSOLUTE",1050,370);
  text(graphList.get(graphList.size()-1).parcPer,950,390); //生物全体に対しての割合
  text(graphList.get(graphList.size()-1).Per,1050,390);    //個体数
  
  //フレーム数が10の倍数でないなら最新の構造体を削除（10の倍数のフレームの情報のみ保存してグラフに反映）
  if(!( Fcount % 10 == 0)){
    graphList.remove(graphList.size()-1);
  }
  //401個めの構造体を削除
  if( graphList.size() == 400){
    graphList.remove(0);
  }
  
  //グラフの描画
  for( int i = 0; i < graphList.size(); i++){
    //割合のグラフを描画
    stroke(255,0,0);
    point( 10 + i, 460 + (100 - graphList.get(i).parcCar) * 2);
    stroke(0,0,255);
    point( 10 + i, 460 + (100 - graphList.get(i).parcHer) * 2);
    stroke(0,255,0);
    point( 10 + i, 460 + (100 - graphList.get(i).parcAnn) * 2);
    stroke(0,80,0);
    point( 10 + i, 460 + (100 - graphList.get(i).parcPer) * 2);
    
    //個体数のグラフを描画
    stroke(255,0,0);
    point( 425 + i, 660 - graphList.get(i).Car / 2);
    stroke(0,0,255);
    point( 425 + i, 660 - graphList.get(i).Her / 2);
    stroke(0,255,0);
    point( 425 + i, 660 - graphList.get(i).Ann / 2);
    stroke(0,80,0);
    point( 425 + i, 660 - graphList.get(i).Per / 2);
  }
}