import 'package:flutter/material.dart';
import 'package:waterapp/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = 'WaterApp';
  final String cardHello = 'Merhaba';
  final String cardDaily = 'Bugün içtiğiniz su miktarı: ';
  final String cardDailyW = '2 litre';
  final String startUseAppT = 'Programı kullandığınız gün sayısı: ';
  final String startUseAppD = '3';
  final String totalTitle = 'Bugüne kadar içtiğiniz su miktarı: ';
  final String totalW = '300 litre';
  final String averageTitle = 'Ortalama günlük su tüketimi: ';
  final String averageW = '3.5 litre';
  late final List<WModel> _item;

  @override
  void initState() {
    super.initState();
    _item = WItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: ProjectShape().mainCardHeight,
                    child: Card(
                      color: ProjectShape().cardColor,
                      child: Padding(
                        padding: ProjectShape().cardPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _TextH6(atext: cardHello),
                            Padding(
                              padding: ProjectShape().cardPaddingV,
                              child: Text(cardDaily),
                            ),
                            Center(child: _TextH4(btext: cardDailyW))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: ProjectShape().infoCardHeight,
                      child: Card(
                        child: Padding(
                          padding: ProjectShape().cardPadding,
                          child: Column(
                            children: [
                              _TextH6(atext: startUseAppT),
                              _TextH4(btext: startUseAppD),
                              _TextH6(atext: totalTitle),
                              _TextH4(btext: totalW),
                              _TextH6(atext: averageTitle),
                              _TextH4(btext: averageW),
                            ],
                          ),
                        ),
                      ))
                ],
              )),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: _item.length,
              itemBuilder: (context, index) {
                return _Card(item1: _item[index]);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required WModel item1,
  })  : _item1 = item1,
        super(key: key);

  final WModel _item1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ProjectShape().listCardHeight,
      child: Card(
          child: ListTile(
        leading: const Icon(
          Icons.water_drop,
          color: Colors.lightBlueAccent,
        ),
        title: Text(_item1.wdate),
        subtitle: Text('${_item1.wnum} ${_item1.wtype}'),
        // trailing: Text(_item[index].wtype),
      )),
    );
  }
}

class _TextH4 extends StatelessWidget {
  const _TextH4({
    Key? key,
    required String btext,
  })  : _btext = btext,
        super(key: key);

  final String _btext;

  @override
  Widget build(BuildContext context) {
    return Text(
      _btext,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class _TextH6 extends StatelessWidget {
  const _TextH6({
    Key? key,
    required String atext,
  })  : _text = atext,
        super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}

class ProjectShape {
  final cardPadding = const EdgeInsets.all(10.0);
  final cardPaddingV = const EdgeInsets.symmetric(vertical: 10);

  final mainCardHeight = 150.0;
  final infoCardHeight = 355.0;
  final listCardHeight = 75.0;

  final cardColor = Colors.lightBlueAccent;
}