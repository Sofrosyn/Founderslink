
import 'package:floor/constants/constants.dart';
import 'package:floor/screens/chatmenu/chat_menu.dart';
import 'package:floor/screens/frameone/components/channel_tabbar.dart';
import 'package:floor/screens/frameone/components/public_tabbar.dart';
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
    // _pages = [
    //   {
    //     'title': '',
    //     // 'page' : ,
    //   },
    //   {
    //     'title': '',
    //     // 'page' : ,
    //   },
    //   {
    //     'title': '',
    //     // 'page' : ,
    //   },
    // ];
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
                            color: AppColors.KgrayColor
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.KgrayColor
                        ),
                      ),
                      // filled: true,
                      // fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.KgrayColor,
                        size: 18,
                      ),
                      hintText: 'Search Messages...',
                      hintStyle: TextStyle(
                        color: AppColors.KgrayColor600,
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
                      PublicTabBar(),

                      ChannelTabBar(),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.1,
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, ChatMenuScreen.routeName);

                    },
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
