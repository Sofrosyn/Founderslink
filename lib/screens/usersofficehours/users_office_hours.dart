import 'package:floor/constants/constants.dart';
import 'package:floor/screens/usersofficehours/components/users_office_hours_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersOfficeHoursScreen extends StatefulWidget {
  static String routeName = "/users_office_hours";
  @override
  _UsersOfficeHoursScreenState createState() => _UsersOfficeHoursScreenState();
}
class _UsersOfficeHoursScreenState extends State<UsersOfficeHoursScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.KwhiteColor,
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
          title: Text(
            'Your Events',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          titleSpacing: 0,
          actions: [
            Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.black,
              size: 22,
            ),
            Icon(
              Icons.more_vert,
              color: AppColors.KgrayColor,
              size: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 22,
              ),
            ),
          ],
        ),
        body: UsersOfficeHoursBody(),
        backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
