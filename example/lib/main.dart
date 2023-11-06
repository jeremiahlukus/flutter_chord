import 'package:flutter/material.dart';
import 'package:flutter_chord/flutter_chord.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chord',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final chordStyle = TextStyle(fontSize: 20, color: Colors.green);
  final textStyle = TextStyle(fontSize: 18, color: Colors.white);
  final scrollController = ScrollController();
  String _lyrics = '';
  int transposeIncrement = 0;
  int scrollSpeed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chord Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.teal,
              child: TextFormField(
                initialValue: _lyrics,
                style: textStyle,
                maxLines: 50,
                onChanged: (value) {
                  setState(() {
                    _lyrics = value;
                  });
                },
              ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            transposeIncrement--;
                          });
                        },
                        child: Text('-'),
                      ),
                      SizedBox(width: 5),
                      Text('$transposeIncrement'),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            transposeIncrement++;
                          });
                        },
                        child: Text('+'),
                      ),
                    ],
                  ),
                  Text('Transpose')
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: scrollSpeed <= 0
                            ? null
                            : () {
                                setState(() {
                                  scrollSpeed--;
                                });
                              },
                        child: Text('-'),
                      ),
                      SizedBox(width: 5),
                      Text('$scrollSpeed'),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            scrollSpeed++;
                          });
                        },
                        child: Text('+'),
                      ),
                    ],
                  ),
                  Text('Auto Scroll')
                ],
              ),
            ],
          ),
          Divider(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.black,
              child: LyricsRenderer(
                scrollController: scrollController,
                lyrics: _lyrics,
                textStyle: textStyle,
                chordStyle: chordStyle,
                onTapChord: (String chord) {
                  print('pressed chord: $chord');
                },
                transposeIncrement: transposeIncrement,
                scrollSpeed: scrollSpeed,
                widgetPadding: 24,
                lineHeight: 4,
                horizontalAlignment: CrossAxisAlignment.start,
                leadingWidget: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Text(
                    'Leading Widget',
                    style: chordStyle,
                  ),
                ),
                trailingWidget: Text(
                  'Trailing Widget',
                  style: chordStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _lyrics =
        "{capo: 3}\n\n1\n[G]Christ [C9]has [G]come to be [C9]life,\nThe [G]processed di[C9]vine Trini[G]ty.[C9]\n[G]God [C9]the [G]Father’s the [C9]source,\nA [G]fountain e[C9]merging to [G]be[C9]\nGod the [D]Son as a [C9]gushing-up [G]spring.\nIn the [Am]Spirit, a river, for [C9]life impar[G]ting\nOh, [Em]how can this miracle [C]be?\nThe [Am]Triune God flowing in [D]me!\nOh, [G]I’ve [C9]got [G]rivers of [C9]life,\nFlowing [G]out of my [C9]innermost [G]being![C9]\n[G]I’ve [C9]got [G]rivers of [C9]life,\nFlowing [G]out of my [C9]innermost [G]being!\n\n{soc}\n  As this [Em]life [D]flows through [G]me,\n  [Em]I’m sup[C]plied a[D]bundant[G]ly!\n  [Em]His [C]life [G]nullifies [D]sin;\n  [Em]Pow'r s[C]prings [G]now from with[D]in!\n  To be [Em-C]free, over[G]coming spon[D]taneous[G]ly!\n{eoc}\n\n2\nYet this life though it frees,\nIs not meant for mere victory.\nGod is full of intent\nAnd never could flow aimlessly.\nSo this life has a totality,\nA consummate issue encompassing me.\nLife moves and life grows,\nLife shapes as it flows,\nNow I share in this life’s destiny.\nOh, I’ve got rivers of life,\nFlowing out of my innermost being!\nI’ve got rivers of life,\nFlowing out of my innermost being!\n\n{soc}\n  We’ll abide mutually,\n  God and man revealed to be\n  Lamb, Wife, Spirit, and Bride.\n  Come! Drink! And riverside,\n  Grows the tree,\n  Our enjoyment for eternity!\n{eoc}\n\n3\nSo I’ve no cause to frown\nAs one who’s received this zoe.\nI know life runs its course,\nAnd triumphs inevitably.\nI’m required just to stay in the flow.\nIf I do the drinking\nThen God gives the growth.\nSo there’s joy in my heart,\nAnd a spring in my step,\nAnd a smile on my face as I sing,\nOh, I’ve got rivers of life,\nFlowing out of my innermost being!\nI’ve got rivers of life,\nFlowing out of my innermost being!\n\n{comment: (Do not repeat chorus)}";
  }
}
