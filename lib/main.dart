import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();
  String ans = "";

  @override
  Widget build(BuildContext context) {


    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Activity in DevOps'),
          trailing: CupertinoButton(child: Icon(CupertinoIcons.info, size: 25,)
              , onPressed: (){





//
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Members'),
                      content: Container(
                        height: 200,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipOval(child: Image.asset('images/ChristianCaparra.jpg', height: 50)),
                                  SizedBox(width: 10),
                                  Text('Christian Caparra'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ClipOval(child: Image.asset('images/JL.jpg', height: 50)),
                                  SizedBox(width: 10),
                                  Text('John Lloyd Guevarra'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ClipOval(child: Image.asset('images/ChristianCaparra.jpg', height: 50)),
                                  SizedBox(width: 10),
                                  Text('Christian Caparra'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ClipOval(child: Image.asset('images/mike.jpg', height: 50)),
                                  SizedBox(width: 10),
                                  Text('Michael De Ramos'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        CupertinoButton(
                          child: Text(
                            'Close',
                            style: TextStyle(color: CupertinoColors.destructiveRed),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );


              }),
          leading: Icon(CupertinoIcons.chevron_back, size: 25,),
        ),


        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                SizedBox(height: 100,),
                // Row(
                //   children: [
                //     Text('Calculator', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: CupertinoColors.systemBlue),),
                //   ],
                // ),
                SizedBox(height: 40,),


                CupertinoTextField(
                  controller: _num1,

                ),
                SizedBox(height: 10,),
                CupertinoTextField(
                  controller: _num2,


                ),


                CupertinoButton(child: Text('Calculate'), onPressed: (){
                  setState(() {
                    double n1 = double.parse(_num1.text);
                    double n2 = double.parse(_num2.text);
                    double answer = n1 + n2;
                    ans = answer.toString();
                    print(ans);
                  });
                }),

                Text("$ans"),

//updateds

              ],
            ),
          ),
        ));
  }
}
