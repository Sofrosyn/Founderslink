import 'package:floor/constants/constants.dart';
import 'package:floor/widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PeopleCards extends StatelessWidget {
  const PeopleCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  SizedBox(
      height: height * 0.17,
      width: width * 1,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 9.0,horizontal: 9.0
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(

                    padding: const EdgeInsets.only(right: 7.0),
                    child: Image.asset(
                      'assets/images/girl.png',
                      height: height * 0.07,
                      width: width * 0.15,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Jasmin G.Rangle',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: " (She/Her)",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 13)),
                          ],
                        ),
                      ),
                      RegularText(
                        text:  '2x Founder, B2B Advisor',
                        size: 15,
                        color: AppColors.KgrayColor,
                      ),

                      RegularText(
                        text:  'Denvor, CO',
                        size: 15,
                        color: AppColors.KgrayColor,

                      ),
                    ],
                  ),
                  SizedBox(width: width * 0.07),
                  Container(
                    width: width * 0.12,
                    height: height * 0.05,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFF1F1F1),
                    ),
                    child: Icon(
                      CupertinoIcons.person_badge_plus,
                      size: 25,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 1,
                height: height * 0.04,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),                                    child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0xFFF1F1F1),
                        ),
                        child: Text('👨🏾📈BlackVC'),
                      ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Color(0xFFF1F1F1),
                          ),
                          child: Text('👩💼 womenfounder'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
