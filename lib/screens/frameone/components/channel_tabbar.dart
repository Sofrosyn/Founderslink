import 'package:floor/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class PublicTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 8),
          leading: CircleAvatar(
            radius: 30.0,
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
                  fontSize: 17,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 5,
                ),
                child: Icon(
                  Icons.circle,
                  color: AppColors.KgreenColor,
                  size: 16,
                ),
              )
            ],
          ),
          subtitle: Text(
            'Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 8),
          leading: CircleAvatar(
            radius: 30.0,
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
                  fontSize: 17,
                ),
              ),

            ],
          ),
          subtitle: Text(
            'Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

