import 'package:floor/screens/chatmenu/chat_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class UsersOfficeHoursBody extends StatefulWidget {
  @override
  _UsersOfficeHoursBodyState createState() => _UsersOfficeHoursBodyState();
}

class _UsersOfficeHoursBodyState extends State<UsersOfficeHoursBody> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: height * 1,
        width: width * 1,
        child:   SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                TableCalendar(
                  rowHeight: height * 0.05,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),

                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Card(
                  elevation: 5.0,
                  shadowColor: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: height * 0.07,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ryan M. Reindardt',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Mentor for Social media Startups',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0008,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,bottom: 10,right: 13),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 27,
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Wed May 18 @ 4:00 p - 30 min - 10 slots left',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.pushNamed(context, ChatMenuScreen.routeName);
                        },
                        child: Text(
                          'See More Events  ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
