class Graph {
  int All;       //生物総数
  int Car;       //肉食動物個体数
  int Her;       //草食動物個体数
  int Ann;       //一年草個体数
  int Per;       //多年草個体数
  float parcCar; //肉食動物割合
  float parcHer; //草食動物割合
  float parcAnn; //一年草割合
  float parcPer; //多年草割合
  
  Graph(int _car, int _her, int _ann, int _per){
    All = _car + _her + _ann + _per;
    Car = _car;
    Her = _her;
    Ann = _ann;
    Per = _per;
    //割合は計算して保存
    parcCar = ((float)Car * 100 / All);
    parcHer = ((float)Her * 100 / All);
    parcAnn = ((float)Ann * 100 / All);
    parcPer = ((float)Per * 100 / All);
  }
}