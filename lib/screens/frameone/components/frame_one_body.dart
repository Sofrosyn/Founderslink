
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrameOneBody extends StatefulWidget {
  @override
  _FrameOneBodyState createState() => _FrameOneBodyState();
}

class _FrameOneBodyState extends State<FrameOneBody> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
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

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: height * 0.055,
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
                      // filled: true,
                      // fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 18,
                      ),
                      hintText: 'Search Messages...',
                      hintStyle: TextStyle(
                        color: Colors.pink[100],
                        fontSize: 12,
                      ),
                      suffixIcon: Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                  child: Container(
                    height: height * 0.045,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[300],
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Public',
                        ),
                        Tab(
                          text: 'Channels',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 8),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Jasmin G.Rangel',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: Icon(
                                    Icons.donut_large,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Text(
                              'Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor',
                              style: TextStyle(
                                fontSize: 9,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 8),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Jasmin G.Rangel',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: Icon(
                                    Icons.donut_large,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Text(
                              'Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor',
                              style: TextStyle(
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Channels',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  Card(
                                    color: Colors.grey[200],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '#Marketing',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.person_add_alt_1_outlined,
                                                size: 48,
                                              ),
                                              SizedBox(
                                                width: width * 0.09,
                                              ),
                                              Text(
                                                'Lorem ipsum dolor Lorem ipsum dolor Lorem\nipsum Lorem ipsum dolor Lorem ipsum \ndolor Lorem ipsum dolor Lorem ipsum dolor',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: height * 0.02,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '306+',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.003,
                                  ),
                                  Card(
                                    color: Colors.grey[200],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '#Marketing',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.person_add_alt_1_outlined,
                                                size: 48,
                                              ),
                                              SizedBox(
                                                width: width * 0.09,
                                              ),
                                              Text(
                                                'Lorem ipsum dolor Lorem ipsum dolor Lorem\nipsum Lorem ipsum dolor Lorem ipsum \ndolor Lorem ipsum dolor Lorem ipsum dolor',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: height * 0.02,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg',
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '306+',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.1,
                  child: FloatingActionButton(
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(
                      Icons.plus_one,
                      color: Colors.white,
                    ),
                    onPressed: null,
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
