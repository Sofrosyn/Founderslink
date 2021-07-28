import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen2 extends StatefulWidget {

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: 14.0, right: 14.0, top: 12.0, bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                    SizedBox(
                      width: 120.0,
                    ),
                    Text(
                      'Lobby Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '59:63',
                  ),
                ],
              ),
              Text(
                ' Hosts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              border:
                                  Border.all(color: Color(0xFF04FF1D), width: 5),
                            ),
                            child: Image.asset('assets/images/host1.png')),
                        Text(
                          'James',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/host2.png'),
                            _MuteHost(),
                          ],
                        ),
                        Text(
                          'James',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/host1.png'),
                            _MuteHost(),
                          ],
                        ),
                        Text(
                          'James',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/host2.png'),
                            _MuteHost(),
                          ],
                        ),
                        Text(
                          'James',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/host1.png'),
                            _MuteHost(),
                          ],
                        ),
                        Text(
                          'James',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/host2.png'),
                            _MuteHost(),
                          ],
                        ),
                        Text(
                          'James',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  ' Floor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          border:
                              Border.all(color: Color(0xFF04FF1D), width: 3),
                        ),
                        child: Image.asset('assets/images/host2.png')),
                    Text(
                      'Alice',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: _floorRow(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
                child: _floorRow(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: _floorRow(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/images/host2.png')),
                      Text(
                        'James',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      size: 28,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(text: 'Leave', btnClr: 0xFFFF0303,),
                  AppButton(text: 'Lobby info', btnClr: 0xFF000000,),
                  AppButton(text: 'Raise Hand', btnClr: 0xFF2CC09C,),

                ],
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.add,size: 32,),
      // ),
    );
  }

  Widget _floorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/host1.png')),
            Text(
              'James',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/host1.png')),
            Text(
              'James',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}

class AppButton extends StatelessWidget {
  AppButton({this.text, this.btnClr});

  final String text;
  final int btnClr;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30,
      color: Color(btnClr),
      onPressed: () {},
      child: Text(text ,style: TextStyle(color: Colors.white,fontSize: 15),),
    );
  }
}

class _MuteHost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 1,
      bottom: 1,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(2),
          child: Image.asset('assets/images/mute.png')),
    );
  }
}
