import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {


  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.grey,
              Colors.blueGrey,
            ],
          )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.message_outlined,
                    ),
                    SizedBox(),
                    Image.asset('assets/images/floor_icon.png'),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.calendar_today,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(
                            CupertinoIcons.ellipsis_vertical,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.ac_unit_sharp,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  ' People In Your Niche',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/jasmin.png',
                              height: 70,
                              width: 70,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Jasmin G.Rangle',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: " (She/Her)",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text(
                                    '2x Founder, B2B Advisor',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'Denvor, CO',
                                  style:
                                      TextStyle(fontSize: 18, color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              padding: EdgeInsets.all(8.0),
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
                          height: 5.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Color(0xFFF1F1F1),
                            ),
                            child: Text('👨🏾📈BlackVC'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/jasmin.png',
                              height: 70,
                              width: 70,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Jonathan D.Dye',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: " (He/Him)",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text(
                                    'Mentor for social media Startups',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'Denvor, CO',
                                  style:
                                      TextStyle(fontSize: 18, color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              padding: EdgeInsets.all(8.0),
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
                          height: 5.0,
                        ),
                        Row(
                          children: [
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
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Color(0xFFF1F1F1),
                                ),
                                child: Text('👨🏾📈BlackVC'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 05.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 150.0,
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
                          Text('View More People'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Your Channels',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
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
                  child: Text(
                    'Chat Topics',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _topicsContainer(
                        'assets/images/headhunting.png',
                        'Recruiting',
                        "w/ Jonathan B. Angela F, Laura W., James M. and 10 others"
                    ),
                    SizedBox(width: 15.0,),
                    _topicsContainer(
                        'assets/images/headhunting.png',
                        'Recruiting',
                        "w/ Jonathan B. Angela F, Laura W., James M. and 10 others"
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _topicsContainer(
                        'assets/images/headhunting.png',
                        'Recruiting',
                        "w/ Jonathan B. Angela F, Laura W., James M. and 10 others"
                    ),
                    SizedBox(width: 15.0,),
                    _topicsContainer(
                        'assets/images/headhunting.png',
                        'Recruiting',
                        "w/ Jonathan B. Angela F, Laura W., James M. and 10 others"
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _topicsContainer(
                        'assets/images/headhunting.png',
                        'Recruiting',
                        "w/ Jonathan B. Angela F, Laura W., James M. and 10 others"
                    ),
                    SizedBox(width: 15.0,),
                    _topicsContainer(
                        'assets/images/headhunting.png',
                        'Recruiting',
                        "w/ Jonathan B. Angela F, Laura W., James M. and 10 others"
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _topicsContainer(
                        'assets/images/headhunting.png',
                        'Recruiting',
                        "w/ Jonathan B. Angela F, Laura W., James M. and 10 others"
                    ),
                    SizedBox(width: 15.0,),
                    _topicsContainer(
                        'assets/images/headhunting.png',
                        'Recruiting',
                        "w/ Jonathan B. Angela F, Laura W., James M. and 10 others"
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
              ],
            ),
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
              Image.asset('assets/images/Vector.png'),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: Text(
                      "w/ Jonathan B. Angela F, Laura W., James M. and 10 others")),
            ],
          )
        ],
      ),
    );
  }

  _topicsContainer(image, txt, description) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: 170,
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
