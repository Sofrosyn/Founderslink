import 'package:floor/constants/constants.dart';
import 'package:floor/screens/chatmenu/chat_menu.dart';
import 'package:floor/screens/frameone/components/frame_one_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class UserFilterScreen extends StatefulWidget {
  static String routeName = "/user_filter";
  @override
  _UserFilterScreenState createState() => _UserFilterScreenState();
}
class _UserFilterScreenState extends State<UserFilterScreen> {

  int _value = 1;

  double sliderValue = 25.0;

  bool checkValue = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.KwhiteColor,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 18,
        ),
        title: Text(
          'Filter User Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          // fontSize: 12,
          // color: Colors.black,
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height * 1,
          width: width * 1,
          color: AppColors.KwhiteColor,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Type',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),

                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  child: GridView.count(
                    crossAxisCount: 5,
                    children: List.generate(
                      5, (index) => Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://www.entertales.com/wp-content/uploads/forever-single-girl-1280x720.jpg'),
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

                Text(
                  'Interests',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.13,
                  width: double.infinity,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    crossAxisCount: 3,
                    childAspectRatio: 7 / 2,
                    children: List.generate(
                      7,
                          (index) => SizedBox(
                            // width: width * 0.2,
                            // height: height * 0.2,
                            child: Card(
                              color: AppColors.KgrayColor,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.handyman_sharp,
                                      size: 17,
                                    ),
                                    Text(
                                      ' Co-Founding',
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
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Niche',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17
                  ),
                ),
                Container(
                  height: height * 0.13,
                  width: double.infinity,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    crossAxisCount: 3,
                    childAspectRatio: 7 / 2,
                    children: List.generate(
                      7,
                          (index) => SizedBox(
                        // width: width * 0.2,
                        // height: height * 0.2,
                        child: Card(
                          color: AppColors.KgrayColor,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.handyman_sharp,
                                  size: 17,
                                ),
                                Text(
                                  ' Co-Founding',
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
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Distance',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SfSlider(
                  min: 0.0,
                  max: 100.0,
                  value: sliderValue,
                  interval: 100,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value){
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool val) {
                        setState(() {
                          checkValue = val;
                        });
                      },
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Any Distance',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.all(10),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(100, 10)),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                      decoration: BoxDecoration(
                        color: AppColors.KgrayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: DropdownButton(
                          elevation: 100,
                            isExpanded: true,
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'People that are looking to...',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.007,
                    ),
                    Container(

                      decoration: BoxDecoration(
                        color: AppColors.KgrayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: DropdownButton(
                            elevation: 100,
                            isExpanded: true,
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'People that are looking to...',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.007,
                    ),
                    Container(

                      decoration: BoxDecoration(
                        color: AppColors.KgrayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: DropdownButton(
                            elevation: 100,
                            isExpanded: true,
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'People that are looking to...',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.007,
                    ),
                    Container(

                      decoration: BoxDecoration(
                        color: AppColors.KgrayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: DropdownButton(
                            elevation: 100,
                            isExpanded: true,
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'People that are looking to...',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                    ),

                  ],
                ),
                // Spacer(),
                SizedBox(
                  height:  height * 0.07,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black,
                      ),
                      minimumSize: MaterialStateProperty.all(Size(280, 35)),
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
