
import 'package:flutter/material.dart';

import 'components/app_long_press.dart';
import 'components/app_action_overlay.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

bool backdropstate=false;
longPressHandler(val){
  setState(() {
    backdropstate=val;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Container(
             decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1530092285049-1c42085fd395?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2hpdGUlMjBmbG93ZXJ8ZW58MHx8MHx8&w=1000&q=80'),fit: BoxFit.cover)),
             child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                     Column(
                children: [
                  RichText(
                    text: TextSpan(
                        text: '12.00\n',
                        style: TextStyle(color: Colors.black, fontSize: 45),
                        children: [
                          TextSpan(
                              text: 'calendar dates\n',
                              style: TextStyle(fontSize: 20)),
                          TextSpan(
                              text: 'weather weather where art thou?',
                              style: TextStyle(fontSize: 20)),
                        ]),
                  ),
                ],
              ),
                     SizedBox(
                height: 30,
              ),
                     Column(
                         children: [
                            for(int i=0;i<5;i++)
                                AppLongPress(handler:longPressHandler,
                                    textWidget: Text('App${i+1}\n',style: TextStyle(fontSize: 35),),),
                                   ],
                           ),
                        ],
                    ),
           ),
          
          backdropstate?AppActionOverlay(handler: longPressHandler,):Container(),
       ],
        ),

    );
  }
}




 