
import 'package:floor/screens/chatlobby/components/chat_lobby_button.dart';
import 'package:floor/screens/chatlobby/components/mute_image_chatlobby.dart';
import 'package:floor/screens/createchannel/create_channel.dart';
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
                            child: Image.asset('assets/images/girl.png')),
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
                            Image.asset('assets/images/girl.png',
                            ),
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
                            Image.asset('assets/images/girl.png'),
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
                            Image.asset('assets/images/girl.png'),
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
                            Image.asset('assets/images/girl.png'),
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
                            Image.asset('assets/images/girl.png'),
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
                      height: height * 0.07,
                        width: width * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          border:
                          Border.all(color: Color(0xFF04FF1D), width: 3),
                        ),
                        child:  Image.asset('assets/images/man_image.png'),),
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
                child: _floorRow(context),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: _floorRow(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: _floorRow(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                          height: height * 0.05,
                          width: width * 0.1,
                          child:  Image.asset('assets/images/man_image.png'),),
                      Text(
                        'James',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: height * 0.1,
                  width: width * 0.1,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CreateChannelScreen.routeName);
                    },
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
  Widget _floorRow(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
                height: height * 0.055,
                width: width * 0.11,
                child:  Image.asset('assets/images/man_image.png'),),
            Text(
              'James',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Container(
              height: height * 0.055,
              width: width * 0.11,
              child:  Image.asset('assets/images/man_image.png'),),
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
