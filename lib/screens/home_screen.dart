import 'package:calculator/constants/contstants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../widgets/box_neo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool darkMode = false;
  String eqution = '0';
  String result = '0';
  String experssion = '';
  double equtionFontSize = 40.0;
  double resultFontSize = 50.0;
  
  btnPressed(String btnText){
    setState(() {
      if (btnText=='C'){
        equtionFontSize = 40.0;
        resultFontSize = 50.0;
        eqution = '0';
        result = '0';
      } else if(btnText == '⌫'){
        equtionFontSize = 50.0;
        resultFontSize = 40.0;
        eqution = eqution.substring(0,eqution.length-1);
        if(btnText.isEmpty){
          eqution = '0';
        }
      } else if(btnText == '='){
        equtionFontSize = 40.0;
        resultFontSize = 50.0;

        experssion = eqution;
        experssion == experssion.replaceAll('÷', '/');
        experssion == experssion.replaceAll('×', '*');

        try {
          Parser p = Parser();
          Expression exp = p.parse(experssion);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          
        } catch (e) {
          result = 'pashmammm';
        }
      } else{
        equtionFontSize = 50.0;
        resultFontSize = 40.0;
        if(eqution=='0'){
          eqution = btnText;
        }else{
          eqution = eqution+btnText;
        }
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                           darkMode?darkMode=false:darkMode=true;
                          });
                        },
                        child: SizedBox(
                          width: 100.0,
                          child: BoxNeo(
                              darkMode:darkMode,
                              borderRadius: BorderRadius.circular(40.0),
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                              child: SizedBox(
                                width: 70,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                  Icon(
                                    Icons.wb_sunny,
                                    color:darkMode?Colors.grey:Colors.redAccent,
                                  ),
                                  Icon(
                                    Icons.nightlight_round,
                                    color:darkMode?Colors.green:Colors.grey
                                  ),
                                  ],
                                ),
                                ),
                                            
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: resultFontSize,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.red,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '=',
                            style: TextStyle(
                              fontSize: equtionFontSize,
                              color: darkMode ? Colors.green : Colors.grey,
                            ),
                          ),
                          Text(
                            eqution,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: darkMode ? Colors.green : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottonNeo(
                          darkMode: darkMode,
                          title: 'C',
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '(',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: ')',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '÷',
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottonNeo(
                          darkMode: darkMode,
                          title: '7',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '8',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '9',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '×',
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottonNeo(
                          darkMode: darkMode,
                          title: '4',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '5',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '6',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '-',
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottonNeo(
                          darkMode: darkMode,
                          title: '1',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '2',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '3',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '+',
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottonNeo(
                          darkMode: darkMode,
                          title: '0',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '.',
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '⌫',
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                        BottonNeo(
                          darkMode: darkMode,
                          title: '=',
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget BottonNeo(
    {String? title, double padding = 17, Color? textColor, bool? darkMode}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: BoxNeo(
      darkMode: darkMode!,
      borderRadius: BorderRadius.circular(40.0),
      padding: EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (() => btnPressed(title!)),
        child: SizedBox(
          width: padding * 2,
          height: padding * 2,
          child: Center(
            child: Text(
              title!,
              style: TextStyle(
                color: textColor ?? (darkMode ? Colors.white : Colors.black),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

}

