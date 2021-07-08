
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SuccessPageState();
}

class SuccessPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: 
      Container(child: Column(children: [
        SvgPicture.asset("assets/images/checked.svg", height: 50, width: 50,),
        Container(margin:  EdgeInsets.only(top: 10), child: Text("Order Sent Successfull", style: TextStyle(fontWeight: FontWeight.bold)),),
        _backButton()

      ],),)
      ,),
    );
  }

  Widget _backButton() {
    return  Container(
      height: 55,
      margin: EdgeInsets.only(top: 20, bottom: 100),
      child: RaisedButton(
        textColor: Colors.white,
        elevation: 0,
        onPressed: () {
          
        },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(9.0)),
        padding: const EdgeInsets.only(top: 13.0, bottom: 13),
        child: Text(
          "Ok",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
