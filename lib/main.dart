import 'package:flutter/material.dart';
import 'package:calculator_app/constant.dart';
import 'package:calculator_app/components.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp( const HomeScreen());
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput='';
  var Answer='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: Column(
                children:[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child:Text(userInput.toString(),style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(Answer.toString(),style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),),
                            ),
                            SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                      child: Column(children: [
                        Row(
                          children: [
                            MyButton(title: '(',onPress: (){
                              userInput +='(';
                              setState(() {
                              });
                            } ),
                            MyButton(title: ')',onPress: (){
                              userInput +=')';
                              setState(() {

                              });
                            } ),
                            MyButton(title: '[',onPress: (){
                              userInput +='%';
                              setState(() {
                              });
                            } ),
                            MyButton(title: ']', color:Color(0xffffa00a) ,onPress: (){
                              userInput +='/';
                              setState(() {
                              });
                            } ),
                          ],

                        ),
                        Row(
                        children: [
                          MyButton(title: 'AC',onPress: (){
                            userInput ='';
                            Answer='';
                            setState(() {
                            });
                          } ),
                          MyButton(title: '+/-',onPress: (){
                            userInput +='+/-';
                            setState(() {

                            });
                          } ),
                          MyButton(title: '%',onPress: (){
                            userInput +='%';
                            setState(() {
                            });
                          } ),
                          MyButton(title: '/', color:Color(0xffffa00a) ,onPress: (){
                            userInput +='/';
                            setState(() {
                            });
                          } ),
                        ],

                      ),
                        Row(
                          children: [
                            MyButton(title: '7',onPress: (){
                              userInput+='7';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '8',onPress: (){
                              userInput+='8';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '9',onPress: (){
                              userInput+='9';
                              setState(() {
                              });
                            } ),
                            MyButton(title: 'x', color:Color(0xffffa00a) ,onPress: (){
                              userInput+='x';
                              setState(() {
                              });
                            } ),
                          ],

                        ),
                        Row(
                          children: [
                            MyButton(title: '4',onPress: (){
                              userInput+='4';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '5',onPress: (){
                              userInput+='5';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '6',onPress: (){
                              userInput+='6';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '-', color:Color(0xffffa00a) ,onPress: (){
                              userInput+='-';
                              setState(() {
                              });
                            } ),
                          ],

                        ),
                        Row(
                          children: [
                            MyButton(title: '1',onPress: (){
                              userInput+='1';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '2',onPress: (){
                              userInput+='2';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '3',onPress: (){
                              userInput+='3';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '+', color:Color(0xffffa00a) ,onPress: (){
                              userInput+='+';
                              setState(() {
                              });
                            } ),
                          ],

                        ),
                        Row(
                          children: [
                            MyButton(title: '0',onPress: (){
                              userInput+='0';
                              setState(() {
                              });
                            } ),
                            MyButton(title: '.',onPress: (){
                              userInput+='.';
                              setState(() {
                              });
                            } ),
                            MyButton(title: 'DEL',onPress: (){
                              userInput =userInput.substring(0,userInput.length - 1);
                              setState(() {
                              });
                            } ),
                            MyButton(title: '=', color:Color(0xffffa00a) ,onPress: (){
                              equal_press();
                              setState(() {
                              });
                            } ),
                          ],

                        ),
                      ],
                      )
                  ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }

  //equal_press_function
  void equal_press(){

    String finalUserInput =userInput.replaceAll('x', '*');
    Parser p= Parser();
    Expression expression =p.parse(finalUserInput);
    ContextModel contextModel =ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    Answer=eval.toString();
  }



}
