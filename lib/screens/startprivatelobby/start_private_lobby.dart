import 'package:floor/constants/constants.dart';
import 'package:floor/screens/startchatprivate/components/start_chat_private_body.dart';
import 'package:floor/screens/startprivatelobby/components/meeting_cards.dart';
import 'package:floor/widgets/regular_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartPrivateLobbyScreen extends StatefulWidget {
  static String routeName = "/start_privat_lobby";
  @override
  _StartPrivateLobbyScreenState createState() => _StartPrivateLobbyScreenState();
}
class _StartPrivateLobbyScreenState extends State<StartPrivateLobbyScreen> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.KwhiteColor,
          title: Center(child: Text('Start Private Lobby',style: TextStyle(color: Colors.black,fontSize: 17),)),
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18,
            ),
          ),
          actions: [
            Icon(
              Icons.calendar_today,
              color: AppColors.KblackColor,
              size: 18,
            ),
            Icon(
              Icons.more_vert,
              color: AppColors.KgrayColor,
              size: 18,
            ),
            Icon(
              Icons.notifications,
              color: AppColors.KblackColor,
              size: 18,
            ),
          ],
        ),
        backgroundColor: AppColors.KwhiteColor,
        body: Container(
          height: height * 1,
          width: width * 1,
          child:   SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 17
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.065,
                    child: TextField(
                      controller: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.KgrayColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.KgrayColor,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Meeting Title',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.KgrayColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Text(
                    'Invite attendees',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 17
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),



                  Container(
                    width: width * 0.95,
                    padding: EdgeInsets.only(left: 5),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg'),
                        ),
                        title: Text(
                          'Jasmin G. Rangle',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          '2x Founder, B2B Advisor',
                          style: TextStyle(
                            color: Colors.pink[200],
                            fontSize: 9,
                          ),
                        ),
                        trailing: Icon(
                          Icons.person_add,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: width * 0.95,
                    padding: EdgeInsets.only(left: 5),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg'),
                        ),
                        title: Text(
                          'Jasmin G. Rangle',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          '2x Founder, B2B Advisor',
                          style: TextStyle(
                            color: Colors.pink[200],
                            fontSize: 9,
                          ),
                        ),
                        trailing: Icon(
                          Icons.person_add,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 130,
                          ),
                          child: TextButton(
                            onPressed: null,
                            child: Text(
                              'Search or Add new friends',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              minimumSize:
                              MaterialStateProperty.all(Size(160, 25)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Meeting Duration',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 17
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),

                  MeetingCardPrivateLobby(
                    icon: Icons.arrow_forward_ios_rounded,
                    iconColor: AppColors.KblueColor,
                    textMeeting: 'Private Meeting 15 minutes',
                    textMin: '15 Minutes',
                  ),
                  MeetingCardPrivateLobby(
                    icon: Icons.arrow_forward_ios_rounded,
                    iconColor: AppColors.KredColor,
                    textMeeting: 'Private Meeting 15 minutes',
                    textMin: '15 Minutes',
                  ),
                  MeetingCardPrivateLobby(
                    icon:Icons.arrow_forward_ios_rounded,
                    iconColor: AppColors.KgreenColor,
                    textMeeting: 'Private Meeting 15 minutes',
                    textMin: '15 Minutes',
                  ),
                  // Spacer(),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        // Navigator.pushNamed(context, UsersOfficeHoursScreen.routeName);
                      },
                      child: Text(
                        'Launch',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black,
                        ),
                        minimumSize: MaterialStateProperty.all(Size(200, 40)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // backgroundColor: AppColors.KappBackgroundColor
      ),
    );
  }
}
