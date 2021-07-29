
import 'package:floor/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateChannelBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Container(
            height: height * 1,
            width: width * 1,
            color: AppColors.KwhiteColor,
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Create Channel',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Container(
                      width: width * 0.3,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                          color: AppColors.KgrayColor,
                          // Set border width
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)), // Set rounded corner radius
                        // Make rounded corner of border

                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.upload,
                            size: 76,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Title',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        // color: Colors.black,
                        fontSize: 15
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.07,
                      child: TextField(
                        controller: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.KgrayColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.KblackColor,
                            ),
                          ),
                          filled: true,
                          fillColor: AppColors.KwhiteColor,
                          hintText: 'Channel Title',

                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.KgrayColor
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      ' Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextField(
                      controller: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.KgrayColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.KblackColor,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.KwhiteColor,
                        hintText: 'Description',

                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.KgrayColor
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      ' Team Members',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.05,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: null,
                        child: Container(
                          width: width * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add Team member',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.plus_one,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(AppColors.KwhiteColor,),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.05,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: null,
                        child: Container(
                          width: width * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Invite via email...',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(AppColors.KwhiteColor,),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.05,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: null,
                        child: Container(
                          width: width * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Find team members',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(AppColors.KwhiteColor,),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Center(
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Launch',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                       AppColors.KcreateChanalSCColor,
                      ),
                      fixedSize: MaterialStateProperty.all(Size(400, 40)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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
