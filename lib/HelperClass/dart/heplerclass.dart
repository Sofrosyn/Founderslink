import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppImages {
  static const logo = 'images/logo.png';
  static const graduate = 'images/graduated.png';
  static const profile = 'images/profile.png';
  static const founder = 'images/founder.png';
  static const team = 'images/team.png';
  static const ellipse = 'images/ellipse.png';
  static const social_1 = 'images/social.png';
  static const user_1 = 'images/user_1.png';
  static const subscription_1 = 'images/subscription_1.png';
  static const emoj_waving = 'images/emoj_waving-hand.png';
  static const emoji_crying = 'images/emoji_crying-face.png';
  static const public = 'images/public.png';
  static const private = 'images/private.png';
  static const ping = 'images/ping.png';
  static const msg = 'images/msg.png';
  static const filter = 'images/filter.png';
  static const ic_home = 'images/ic_home.png';
  static const ic_group = 'images/ic_group.png';
  static const ic_profile = 'images/ic_profile.png';
  static const ic_chat = 'images/ic_chat.png';
  static const ic_floor = 'images/floor.png';

   static const bg_investor = 'images/bg_investor.jpg';
  static const bg_member = 'images/bg_member.jpg';
  static const bg_student = 'images/bg_student.jpg';
  static const bg = 'images/bg.png';

  static Widget logoWidget = SizedBox(
    width: 100.w,
    height: 100.h,
    child: Image.asset('assets/images/logo.jpg'),
  );
}

class AppColor {
  static const bg = const Color(0xffE5E5E5);
  static const nblue = const Color(0xff47D7F6);
  static const purple = const Color(0xffBF7EFF);
  static const grey = const Color(0xffEAE6E6);
  static const blue = const Color(0xff0B69F5);
    static const blueLight = const Color(0xff1FAFEC);
    static const greenLight = const Color(0xff80FF6B);

  static const chip = const Color(0xffFFBE18); //
  static const chipblue = const Color(0xff5EF4FE);
  static const chipyellow = const Color(0xffFFB74A);
  static const box = const Color(0xffF6F3F3);//
  static const investor = const Color(0xffB257D2);
}

List<String> industryList = [
  "B2B",
  "B2C",
  "C2C",
  "D2C",
  "E2P",
  "E2E",
  "P2P",
  "Fintech",
  "EdTech",
  "Proptech",
  "Travel Tech",
  "Real estate ",
  "AI/ ML",
  "Renewable energy",
  "Block chain",
  "Crypto",
  "Gaming",
  "AR/ VR",
  "ERP/CRM",
  "Audio tech",
  "Cosmetics",
  "Biotechnology",
  "Clean Tech ",
  "E-commerce",
  "Gig Economy ",
  "IOT",
  "HR Tech",
  "Messaging",
  "Social Impact",
  "Hospitality",
  "SAAS",
  "PAAS",
  "Logistics",
  "Health",
  "Gov Tech",
  "Future of Work",
  "Community",
  "Cloud applications ",
  "Insurance",
  "Legal Tech",
  "Agriculture",
  "Food and Beverage",
  "Entertainment",
  "Nonprofit",
  "ITC/ Voice Search ",
  "NFT",
  "Fashion",
  "Automotive",
  "Aerospace",
  "Marketing",
  "Infrastructure",
  "Construction",
  "Social networking ",
  "Crowdfunding",
  "Cannabis/ CBD",
  "Technology",
  "Consumer",
  "Mobile apps",
  "Matchmaking",
  "Dating/ Romance ",
  "Self improvement ",
  "Coaching",
  "Fitness/ activity tracking",
];

List<String> locationList = [];

List<String> goalsList = [
  "Looking for exclusive deal flow",
  "Looking to mentor entrepreneurs",
  "Looking for a Co-founder",
  "Looking to connect with investors",
  "Looking for team members",
  "Looking for early employees",
  "Looking for co-investors",
  "Looking for interns",
  "Looking for Advisors/ Mentors",
  "Looking for Advisees / Mentees",
  "Looking for domain experts",
  "Looking for beta users / feedback",
  "Looking to discover people in my niche",
  "Looking to discover people with similar interests",
  "Looking to discover new products",
  "Looking to join new communities",
  "Looking for advice",
  "Looking for entrepreneurial inspiration",
  "Looking for job opportunities",
  "Looking for gig work",
  "Keeping all of my options open",
];

List<String> experineceList = [
  "None, I'm looking to gain experience",
  "Less than one year",
  "1 year",
  "2 years",
  "3 years ",
  "4 years",
  "5 years",
  "6 years",
  "7 years",
  "8 years",
  "9 years ",
  "10+ years ",
  "Exited a company",
  "Exited 2 companies",
  "Serial Entrepreneur",
];

List<String> pronounsList = [
    "Any pronouns",
    "He/Him",
    "Co/Co",
    "Dhey/Dhem",
    "Elle/Elles",
    "Elle/he",
    "Elle/they",
    "En/En",
    "Ey/En",
    "Ey/em",
    "Fey/fem",
    "He/Him",
    "Hir/Hirs",
    "MySelf",
    "Per/per",
    "She/her",
    "She/he",
    "They/he",
    "They/she",
    "They/she/he",
    "They/them",
    "Vae/vem",
    "Ve/ver",
    "Ve/vis",
    "Xe/him",
    "Xe/she",
    "Xe/he/she",
    "Xe/he/they",
    "Xe/she/they",
    "Xe/they",
    "Xe/xem ",
    "Xie/hir",
    "Yo/yo",
    "Ze/zie",
    "Ze/zi",
  ];


  Widget buildChip(String label,  {img, color, bool isSelected=false}) {
    return Chip(
      // labelPadding: EdgeInsets.all(2.0),
      avatar: img==null?null: Image.asset(
        img,
        width: 30,
        height: 30,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
      elevation: 1.0,
      shadowColor: Colors.grey[60],
      // padding: EdgeInsets.fromLTRB(10, 0, 10,  0),
    );
  }