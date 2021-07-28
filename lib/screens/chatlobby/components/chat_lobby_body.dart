
import 'package:floor/screens/chatlobby/components/chat_lobby_button.dart';
import 'package:floor/screens/chatlobby/components/mute_image_chatlobby.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatLobbyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 14.0, right: 14.0, top: 12.0, bottom: 12.0),
        child: Container(
          height: height * 1,
          width: width * 1,
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
                            child: Image.asset('assets/images/girl.jpeg')),
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
                            Image.asset('assets/images/man_image.jpeg'),
                            MuteImage(),
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
                            Image.asset('assets/images/man_image.jpeg'),
                            MuteImage(),
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
                      Image.asset('assets/images/man_image.jpeg'),
                            MuteImage(),
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
                            Image.asset('assets/images/man_image.jpeg'),
                            MuteImage(),
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
                            Image.asset('assets/images/man_image.jpeg'),
                            MuteImage(),
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
                        child:  Image.asset('assets/images/man_image.jpeg'),),
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
                          child:  Image.asset('assets/images/man_image.jpeg'),),
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
                  ChatLobbyButton(text: 'Leave', btnClr: 0xFFFF0303,),
                  ChatLobbyButton(text: 'Lobby info', btnClr: 0xFF000000,),
                  ChatLobbyButton(text: 'Raise Hand', btnClr: 0xFF2CC09C,),

                ],
              ),
            ],
          ),
        ),
      ),
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
                child:  Image.asset('assets/images/man_image.jpeg'),),
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
                child:  Image.asset('assets/images/man_image.jpeg'),),
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
