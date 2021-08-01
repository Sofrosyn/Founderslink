import 'package:floor/constants/constants.dart';
import 'package:floor/screens/chatmenu/chat_menu.dart';
import 'package:floor/screens/startchatprivate/components/meeting_duration_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartChatPrivateBody extends StatelessWidget {
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
                  'Select Channel',
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
                  height: height * 0.13,
                  width: width * 0.85,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(
                      3,
                          (index) => ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          child: Card(
                            color: AppColors.KlightgrayColor,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Text(
                                    '#Marketing',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Icon(
                                    Icons.shop_outlined,
                                    size: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.8,
                  child: GridView.count(
                    crossAxisCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      8,
                          (index) => Container(
                        margin: EdgeInsets.only(left: 10),

                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',

                          ),),
                      ),
                    ),
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

                MeetingDurationCard(
                  icon: Icons.arrow_forward_ios_rounded,
                  iconColor: AppColors.KblueColor,
                  textMeeting: 'Private Meeting 15 minutes',
                  textMin: '15 Minutes',
                ),
                MeetingDurationCard(
                  icon: Icons.arrow_forward_ios_rounded,
                  iconColor: AppColors.KredColor,
                  textMeeting: 'Private Meeting 15 minutes',
                  textMin: '15 Minutes',
                ),
                MeetingDurationCard(
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
                      Navigator.pushNamed(context, ChatMenuScreen.routeName);
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
                      fixedSize: MaterialStateProperty.all(Size(200, 40)),
                    ),
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
