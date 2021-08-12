import 'package:floor/constants/constants.dart';
import 'package:floor/screens/startchatprivate/components/start_chat_private_body.dart';
import 'package:floor/widgets/regular_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatInfoScreen extends StatefulWidget {
  static String routeName = "/chat_info";
  @override
  _ChatInfoScreenState createState() => _ChatInfoScreenState();
}
class _ChatInfoScreenState extends State<ChatInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.KwhiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.KwhiteColor,
        title: Text('Raising Per-Seed round for Saas Company',style: TextStyle(color: Colors.black,fontSize: 17),),
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

      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 5.0,
            bottom: 2.0
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText(
                  text: 'Discription',
                  size: 20,
                  // color: AppColors.KblackColor,
                  fontWeight: FontWeight.w600,
                ),


                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RegularText(
                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras auctor lorem eget finibus pretium. Ut consectetur mattis ipsum id lacinia. Suspendisse facilisis dictum risus, non commodo massa eleifend non.',
                    textOverFlow: TextOverflow.ellipsis,
                    maximumLine: 4,
                    size: 15,
                    // color: AppColors.KblackColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                RegularText(
                  text: 'Audience',
                  size: 20,
                  // color: AppColors.KblackColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                Container(
                  height: height * 0.09,
                  width: width * 1,
                 child: SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     children: [
                       Container(
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

                       SizedBox(width: width * 0.02,),
                       Container(
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
                       SizedBox(width: width * 0.02,),
                       Container(
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
                       SizedBox(width: width * 0.02,),
                       Container(
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
                       SizedBox(width: width * 0.02,),
                       Container(
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

                       SizedBox(
                         width: width * 0.02,),
                       Row(
                         children: [
                           CircleAvatar(
                             radius: 10,
                             backgroundImage: NetworkImage(
                               'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                             ),
                           ),
                           SizedBox(
                             width: width * 0.005,),
                           CircleAvatar(
                             radius: 10,
                             backgroundImage: NetworkImage(
                               'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                             ),
                           ),
                           SizedBox(
                             width: width * 0.005,),
                           CircleAvatar(
                             radius: 10,
                             backgroundImage: NetworkImage(
                               'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                             ),
                           ),
                           SizedBox(
                             width: width * 0.005,),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               RegularText(
                                 text: '300+',
                                 size: 9,
                                 // color: AppColors.KblackColor,
                                 fontWeight: FontWeight.w600,
                               ),
                             ],
                           ),

                         ],
                       ),

                     ],
                   ),
                 ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RegularText(
                      text: 'view All',
                      size: 10,
                      // color: AppColors.KblackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                RegularText(
                  text: 'Niches in attendance',
                  size: 20,
                  // color: AppColors.KblackColor,
                  fontWeight: FontWeight.w600,
                ),

                // Row(
                //   children: [
                //     Column(
                //       children: [
                //
                //       ],
                //     ),
                //   ],
                // ),
              ],
            )
          ),
        ),
      ),
      // backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
