import 'package:floor/constants/constants.dart';
import 'package:floor/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'components/people_cards.dart';


class PeopleScreen extends StatefulWidget {
  static String routeName = "/people";


  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {


  int _selectedPageIndex = 0;



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
          title: Center(child: Text('User Search',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: AppColors.KblackColor),)),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 23,
                  ),
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

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 10.0),
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
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

                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          // width: 2.0,
                        ),
                      ),

                      border: OutlineInputBorder(

                        borderSide: BorderSide(color: Colors.white,width: 10),
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

                  SizedBox(
                    height: height * 0.02,
                  ),

                  PeopleCards(),
                  PeopleCards(),
                  PeopleCards(),
                  PeopleCards(),
                  PeopleCards(),
                  PeopleCards(),
                  PeopleCards(),
                  PeopleCards(),
                  PeopleCards(),




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
