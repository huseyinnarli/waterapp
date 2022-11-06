class WModel {
  final String wdate;
  final String wtype;
  final int wnum;
  WModel({
    required this.wdate,
    required this.wtype,
    required this.wnum,
  });
}

class WItems {
  late final List<WModel> items;

  WItems() {
    items = [
      WModel(wdate: '06/11/2022', wtype: 'Bardak', wnum: 2),
      WModel(wdate: '06/11/2022', wtype: 'Bardak', wnum: 1),
    ];
  }

  void addItem(String date1, String type1, int num1) {
    items.add(WModel(wdate: date1, wtype: type1, wnum: num1));
  }
}
