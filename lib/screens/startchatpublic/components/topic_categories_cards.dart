import 'package:floor/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TopicCategoriesCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.47,
      // height: height * 0.5,
      child: Card(
        color: AppColors.KlightgrayColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      fontSize: 15
                    ),
                  ),
                ],
              ),
              Text(
                'Other students and entreprenuers to collaborate with',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

