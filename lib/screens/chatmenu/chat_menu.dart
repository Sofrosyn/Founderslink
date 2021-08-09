import 'package:floor/constants/constants.dart';
import 'package:floor/screens/userfilter/user_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatMenuScreen extends StatefulWidget {
  static String routeName = "/chat_menu";
  @override
  _ChatMenuScreenState createState() => _ChatMenuScreenState();
}

class _ChatMenuScreenState extends State<ChatMenuScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'title': '',
        // 'page' : ,
      },
      {
        'title': '',
        // 'page' : ,
      },
      {
        'title': '',
        // 'page' : ,
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      // width: width * 1,
      // height: height * 1,
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: AssetImage(
            // '',
            'assets/images/man_image.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.KchatMeunbackgroundSCColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.KchatMeunbackgroundSCColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 23,
                ),
                Icon(
                  Icons.message,
                  color: Colors.black,
                  size: 23,
                ),
              ],
            ),
          ),
          actions: [
            Icon(
              Icons.calendar_today,
              color: Colors.black,
              size: 24,
            ),
            Icon(
              Icons.more_vert,
              color: AppColors.KgrayColor,
              size: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
        ),

        floatingActionButton: Container(
          width: width * 0.12,

          child: FittedBox(
            child: FloatingActionButton(

              onPressed: () {
               Navigator.pushNamed(context, UserFilterScreen.routeName);
              },
              child: const Icon(Icons.add),
              backgroundColor: AppColors.KblueColor,
            ),
          ),
        ),

        body: Container(
          height: height * 1,
          width: width * 1,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(

                    decoration: InputDecoration(
                      hintText: 'Search Chat Lobbies',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow,width: 10),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            // height: height * 0.007,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                              color: AppColors.KblackColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.filter_list,color: AppColors.KwhiteColor,),
                          ),
                        ),
                      ),

                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                      ),
                      Text(
                        'Recruiting',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'Lobbies hosted by:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.1,
                    width: width * 1,
                    child: GridView.count(
                      crossAxisCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        5,
                            (index) => Container(
                          // margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                                ),
                              ),
                              SizedBox(
                                height: height * 0.008,
                              ),
                              Text(
                                'Student',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.003,
                  ),
                  Text(
                    'Most active Niches',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.007,
                  ),
                  Container(
                    height: height * 0.15,
                    width: width * 1,
                    child: GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      childAspectRatio: 5 / 2,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        5,
                            (index) => Row(
                          children: [
                            SizedBox(
                              height: height * 0.8,
                              width: width * 0.26,
                              child: Card(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.handyman_sharp,
                                        size: 14,
                                      ),
                                      Text(
                                        ' investing',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Active Lobbies/ Events',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.23,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      color: AppColors.KwhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      // border: Border(
                      //   left: BorderSide(
                      //     color: Colors.green,
                      //     style: BorderStyle.solid,
                      //     width: 1,
                      //   ),
                      // ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Raising pre-seed round for SaaS company',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                ),
                              ),

                              Icon(
                                Icons.more_horiz,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.008,
                          ),
                          Container(
                            width: width * 0.9,
                            child: Row(
                              children: [
                                Container(
                                  height: height * 0.035,
                                  width: width * 0.25,
                                  child: GridView.count(
                                    crossAxisCount: 4,
                                    children: List.generate(
                                      4, (index) => Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg'),
                                      ),
                                    ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.15,
                                  height: height * 0.04,
                                  child: Card(
                                    color: AppColors.KgrayColor,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Saas',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.15,
                                  height: height * 0.04,
                                  child: Card(
                                    color: AppColors.KgrayColor,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'B2B',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2,
                                  height: height * 0.04,
                                  child: Card(
                                    color: AppColors.KgrayColor,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Social ',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 12
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width * 0.7,
                                  child: Text(
                                    'Lorem ipsum dolar sit amet Lorem ipsum dolar sit amet Lorem \nipsum dolar sit amet',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: null,
                                  child: Text(
                                    'Join',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.greenAccent[200],
                                    ),
                                    minimumSize:
                                    MaterialStateProperty.all(Size(45, 10)),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: width * 0.9,

                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.45,
                                  height: height * 0.05,
                                  child: Card(
                                    color: AppColors.KgrayColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.handyman_sharp,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.handyman_sharp,
                                            size: 14,
                                          ),
                                          Text(
                                            ' LGBTQA+Founders',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.3,
                                  height: height * 0.05,
                                  child: Card(
                                    color: AppColors.KgrayColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.handyman_sharp,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.handyman_sharp,
                                            size: 14,
                                          ),
                                          Text(
                                            ' Co-Founder',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
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
                  SizedBox(
                    height: height * 0.015,
                  ),

                  // TODO: Second Card

                  Container(
                    height: height * 0.25,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      color: AppColors.KwhiteColor,
                      borderRadius: BorderRadius.circular(5),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Colorado Founders and Investors Meeting n...',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.more_horiz,
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Container(
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Jun',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '22',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '7:00 PM',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.04,
                                    child: Card(
                                      color: AppColors.KgrayColor,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Saas',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.04,
                                    child: Card(
                                      color: AppColors.KgrayColor,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'B2B',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2,
                                    height: height * 0.04,
                                    child: Card(
                                      color: AppColors.KgrayColor,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Social ',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 12
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),





                          Container(
                            width: width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height * 0.035,
                                  width: width * 0.27,
                                  child: GridView.count(
                                    crossAxisCount: 4,
                                    children: List.generate(
                                      4, (index) => Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg'),
                                      ),
                                    ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: null,
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.greenAccent[200],
                                    ),
                                    minimumSize:
                                    MaterialStateProperty.all(Size(45, 10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.9,
                            child: Text(
                              'Lorem ipsum dolar sit amet Lorem ipsum dolar sit amet Lorem \nipsum dolar sit amet',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.9,

                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.45,
                                  height: height * 0.05,
                                  child: Card(
                                    color: AppColors.KgrayColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.handyman_sharp,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.handyman_sharp,
                                            size: 14,
                                          ),
                                          Text(
                                            ' LGBTQA+Founders',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.3,
                                  height: height * 0.05,
                                  child: Card(
                                    color: AppColors.KgrayColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.handyman_sharp,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.handyman_sharp,
                                            size: 14,
                                          ),
                                          Text(
                                            ' Co-Founder',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
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


                  SizedBox(
                    height: height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ),




        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: CircularNotchedRectangle(),
          child: Container(
            decoration: BoxDecoration(),
            height: height * 0.085,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: _selectedPageIndex == 0
                            ? Colors.blueGrey[900]
                            : Colors.black45,
                      ),
                      onPressed: () => _selectPage(0),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 80),
                  child: IconButton(
                    icon: Icon(
                      Icons.mobile_friendly_rounded,
                      color: _selectedPageIndex == 1
                          ? Colors.blueGrey[900]
                          : Colors.black45,
                    ),
                    onPressed: () => _selectPage(1),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: _selectedPageIndex == 2
                      ? Colors.blueGrey[900]
                      : Colors.black45,
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.phone_android_sharp),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
