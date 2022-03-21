import 'dart:ui';
import 'package:flutter/material.dart';

class AppActionOverlay extends StatefulWidget {
  final handler;

  const AppActionOverlay({Key? key, this.handler}) : super(key: key);

  @override
  State<AppActionOverlay> createState() => _AppActionOverlayState();
}

class _AppActionOverlayState extends State<AppActionOverlay> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.handler(false);
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            print('qrqrw');
          },
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Center(
                child: Container(
                  height: 250,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: AlertDialog(
                      backgroundColor: Colors.transparent,
                      title: Text('Rename or Remove'),
                      content: TextField(),
                      actions: [
                        MyTextButton(),
                          
                        IconButton(iconSize: 45,onPressed: (){}, icon: Icon(Icons.delete_sweep_sharp)
                   ) ]),
                ),
              )),
        ),
      ),
    );
  }
}

class MyTextButton extends StatefulWidget {
  const MyTextButton({ Key? key }) : super(key: key);

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.elliptical(80, 80)),color: Colors.white,),
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width*0.3,
      child: Center(child: Text('yes',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
    );
  }
}
