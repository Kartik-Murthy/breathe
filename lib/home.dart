
import 'package:breathe/components/HomeScreenApp.dart';
import 'package:flutter/cupertino.dart';
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
             decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1525166877954-16f07a81119b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1365&q=80'),fit: BoxFit.cover)),
             child: Column(
               children: [
                 SafeArea(
                   child: Container(height: MediaQuery.of(context).size.height/3,width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.only(left: 20,top: 20),
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                             Column(
                        children:  [
                         Text("12:55",style: TextStyle(fontSize: 47,color: Colors.white,),),
                         Text("Tue, 22 Mar",style: TextStyle(fontSize: 22,color: Colors.white,),),
                         Container(width: 105,padding: EdgeInsets.symmetric(vertical: 10),child: Row(
                           children: [
                             Row(children: [Icon(CupertinoIcons.cloud_rain,color: Colors.white,size: 16,),Text("  22°  ",style: TextStyle(fontSize: 15,color: Colors.white,))],),
                              Row(children: [Icon(CupertinoIcons.battery_25,color: Colors.white,size: 16,),Text("  75%",style: TextStyle(fontSize: 15,color: Colors.white,))],),
                           ],
                         ))
                        ],
                      ),
                             
                                ],
                            ),
                   ),
                 ),
               Container(width: MediaQuery.of(context).size.width,
               padding: EdgeInsets.only(left: 20),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                               children: const [
                                 HomeScreenApp("WhatsApp"),
                                 HomeScreenApp("Youtube"),
                                 HomeScreenApp("Instagram"),
                                 HomeScreenApp("Slack")
                              
                                         ],
                                 ),
               ),],
             ),
           ),
          
          backdropstate?AppActionOverlay(handler: longPressHandler,):Container(),
       ],
        ),

    );
  }
}




 