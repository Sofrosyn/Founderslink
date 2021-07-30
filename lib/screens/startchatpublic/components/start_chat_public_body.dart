
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartChatPublicBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: height * 1,
          width: width * 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: height * 0.05,
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink[100],
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink[100],
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'What do you want to talk about ?',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.pink[100],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
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
                    style: TextStyle(
                      fontSize: 9,
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
                  height: height * 0.015,
                ),
                Container(
                  height: height * 0.1,
                  color: Colors.black,
                  child: GridView.count(
                    crossAxisCount: 2,
                    // childAspectRatio: 0.5,
                    children: List.generate(5, (index) {
                      return Card(
                        color: Colors.pink[100],
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Icon(
                                Icons.handyman_sharp,
                                size: 14,
                              ),
                              Text(
                                ' earlybetatester',
                                // style: TextStyle(

                                // ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  'Topic Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: height * 0.088,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: width * 0.47,
                        child: Card(
                          color: Colors.pink[100],
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.handyman_sharp,
                                      size: 14,
                                    ),
                                    Text(
                                      ' Collaborating',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Other students and entreprenuers to collaborate with',
                                  style: TextStyle(
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.47,
                        child: Card(
                          color: Colors.pink[100],
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.handyman_sharp,
                                      size: 14,
                                    ),
                                    Text(
                                      ' Collaborating',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Other students and entreprenuers to collaborate with',
                                  style: TextStyle(
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.47,
                        child: Card(
                          color: Colors.pink[100],
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.handyman_sharp,
                                      size: 14,
                                    ),
                                    Text(
                                      ' Collaborating',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Other students and entreprenuers to collaborate with',
                                  style: TextStyle(
                                    fontSize: 9,
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
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  'Invite Co-Hosts/Followers',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: width * 0.9,
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
                  height: height * 0.125,
                  child: Stack(
                    children: [
                      Container(
                        width: width * 0.9,
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
                      Positioned(
                        right: 8,
                        bottom: 0,
                        child: Container(
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
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Center(
                  child: TextButton(
                    onPressed: null,
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
