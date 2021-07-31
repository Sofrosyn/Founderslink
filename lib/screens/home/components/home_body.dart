
import 'package:floor/constants/constants.dart';
import 'package:floor/screens/chatlobby/chat_lobby.dart';
import 'package:floor/widgets/regular_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                AppColors.KappGradientColorOne,
              AppColors.KappGradientColorTwo,
              ],
            )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              RegularText(
                text:  ' People In Your Niche',
                size: 22,

                fontWeight: FontWeight.bold,
              ),

              SizedBox(
                height: height *.010,
              ),

              SizedBox(
                height: height * 0.17,
                width: width * 1,
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 9.0,horizontal: 9.0
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(

                                padding: const EdgeInsets.only(right: 7.0),
                              child: Image.asset(
                                'assets/images/girl.png',
                                height: height * 0.07,
                                width: width * 0.15,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Jasmin G.Rangle',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: " (She/Her)",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 13)),
                                    ],
                                  ),
                                ),
                                RegularText(
                                  text:  '2x Founder, B2B Advisor',
                                  size: 15,
                                  color: AppColors.KgrayColor,
                                ),

                                RegularText(
                                  text:  'Denvor, CO',
                                  size: 15,
                                  color: AppColors.KgrayColor,

                                ),
                              ],
                            ),
                            SizedBox(width: width * 0.07),
                            Container(
                              width: width * 0.12,
                              height: height * 0.05,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xFFF1F1F1),
                              ),
                              child: Icon(
                                CupertinoIcons.person_badge_plus,
                                size: 25,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(
                          width: width * 1,
                          height: height * 0.04,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [

                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),                                    child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Color(0xFFF1F1F1),
                                    ),
                                    child: Text('👨🏾📈BlackVC'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Color(0xFFF1F1F1),
                                    ),
                                    child: Text('👩💼 womenfounder'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.17,
                width: width * 1,
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 9.0,horizontal: 9.0
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7.0),
                              child: Image.asset(
                                'assets/images/man_image.png',
                                height: height * 0.07,
                                width: width * 0.15,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Jasmin G.Rangle',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: " (She/Her)",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 13)),
                                    ],
                                  ),
                                ),
                                RegularText(
                                  text:  '2x Founder, B2B Advisor',
                                  size: 15,
                                  color: AppColors.KgrayColor,
                                ),

                                RegularText(
                                  text:  'Denvor, CO',
                                  size: 15,
                                  color: AppColors.KgrayColor,

                                ),
                              ],
                            ),
                            SizedBox(width: width * 0.07),
                            Container(
                              width: width * 0.12,
                              height: height * 0.05,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xFFF1F1F1),
                              ),
                              child: Icon(
                                CupertinoIcons.person_badge_plus,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(
                          width: width * 1,
                          height: height * 0.04,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [

                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),                                    child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Color(0xFFF1F1F1),
                                  ),
                                  child: Text('👨🏾📈BlackVC'),
                                ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Color(0xFFF1F1F1),
                                    ),
                                    child: Text('👩💼 womenfounder'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.009,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, ChatLobbyScreen.routeName);
                  },
                  child: Container(
                    width: width * 0.45,
                    height: height * 0.05,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.black, width: 0.7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            // Icons.keyboard_arrow_down_outlined,
                          ),
                          RegularText(
                            text: 'View More People',
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child:
                RegularText(
                  text:   'Your Channels',
                  size: 24,
                  color: AppColors.KblackColor,
                  fontWeight: FontWeight.bold,
                ),


              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _channelsContainer(
                      "#Marketing",
                      Color(0xFF81FFD9),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    _channelsContainer(
                      "#Sales",
                      Color(0xFF577CFF),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child:
                RegularText(
                  text:   'Chat Topics',
                  size: 24,
                  color: AppColors.KblackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _topicsContainer(

                      'assets/icons/recurit_icon.jpeg',
                      'Recruiting',
                      "w/ Jonathan B. Angela F, Laura W., James M. and 10 others",
                    context,
                  ),
                  SizedBox(width: 15.0,),
                  _topicsContainer(

                      'assets/icons/recurit_icon.jpeg',
                      'Recruiting',
                      "w/ Jonathan B. Angela F, Laura W., James M. and 10 others",
                    context,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _topicsContainer(

                    'assets/icons/recurit_icon.jpeg',
                    'Recruiting',
                    "w/ Jonathan B. Angela F, Laura W., James M. and 10 others",
                    context,
                  ),
                  SizedBox(width: 15.0,),
                  _topicsContainer(

                    'assets/icons/recurit_icon.jpeg',
                    'Recruiting',
                    "w/ Jonathan B. Angela F, Laura W., James M. and 10 others",
                    context,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _topicsContainer(

                    'assets/icons/recurit_icon.jpeg',
                    'Recruiting',
                    "w/ Jonathan B. Angela F, Laura W., James M. and 10 others",
                    context,
                  ),
                  SizedBox(width: 15.0,),
                  _topicsContainer(

                    'assets/icons/recurit_icon.jpeg',
                    'Recruiting',
                    "w/ Jonathan B. Angela F, Laura W., James M. and 10 others",
                    context,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _topicsContainer(

                    'assets/icons/recurit_icon.jpeg',
                    'Recruiting',
                    "w/ Jonathan B. Angela F, Laura W., James M. and 10 others",
                    context,
                  ),
                  SizedBox(width: 15.0,),
                  _topicsContainer(

                    'assets/icons/recurit_icon.jpeg',
                    'Recruiting',
                    "w/ Jonathan B. Angela F, Laura W., James M. and 10 others",
                    context,
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
  _channelsContainer(title, color) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: 200,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Image.asset('assets/images/market_logo.jpeg',),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: RegularText(
                    text:  "w/ Jonathan B. Angela F, Laura W., James M. and 10 others")),
            ],
          )
        ],
      ),
    );
  }

  _topicsContainer(image, txt, description,BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.grey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(image),
              SizedBox(width: 7.0,),
              Text(
                txt,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(description),
        ],
      ),
    );
  }
}



