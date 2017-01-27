//文字クラス
class Chara{
  float chaX;
  float chaY;
  String  chaWord;
  int   chaAge;
  
  //コンストラクタ
  Chara( float _x, float _y, String _word){
    chaX = _x;
    chaY = _y - 5;
    chaWord = _word;
    chaAge = 0;
  }
  
  //更新及び表示メソッド
  void update(int a){
    
    //20F表示で消去
    if(chaAge >= 20){
      chaList.remove(a);
    }
    
    //表示
    fill(0);
    textSize(15);
    text(chaWord,chaX,chaY);
    //カウント
    chaAge++;
  }
}