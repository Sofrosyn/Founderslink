
import 'package:floor/constants/constants.dart';
import 'package:floor/screens/frameone/frame_one.dart';
import 'package:floor/screens/startchatpublic/components/add_niches_tags.dart';
import 'package:floor/screens/startchatpublic/components/topic_categories_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartChatPublicBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: height * 1,
          width: width * 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.06,
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          // color: Colors.pink[100],
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          // color: Colors.pink[100],
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                      hintText: 'What do you want to talk about ?',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        // color: Colors.pink[100],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.012,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.05,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  'Add Niches:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),

                Wrap(
                  children: [
                    AddNichesTags(),
                    AddNichesTags(),
                    AddNichesTags(),
                    AddNichesTags(),
                  ],
                ),


                SizedBox(
                  height: height * 0.012,
                ),
                Text(
                  'Topic Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
                SizedBox(
                  height: height * 0.012,
                ),
                Container(
                  height: height * 0.08,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TopicCategoriesCards(),
                      TopicCategoriesCards(),
                      TopicCategoriesCards(),
                      TopicCategoriesCards(),



                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Invite Co-Hosts/Followers',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
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

                // Spacer(),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, FrameOneScreen.routeName);

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
    );
  }
}
