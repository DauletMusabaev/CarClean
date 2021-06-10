import 'package:car_clean/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Свяжитесь с нами',
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          heightSpace,
          heightSpace,
          // Name textfield start
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: TextField(
                style: black16MediumTextStyle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Имя",
                  hintStyle: grey16MediumTextStyle,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                ),
              ),
            ),
          ),
          // Name textfield end

          heightSpace,
          heightSpace,
          // Email Address textfield start
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: TextField(
                style: black16MediumTextStyle,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: grey16MediumTextStyle,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: primaryColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                  ),
                ),
              ),
            ),
          ),
          // Email Address textfield end

          heightSpace,
          heightSpace,

          // Write here textfield start
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              style: black16MediumTextStyle,
              decoration: InputDecoration(
                hintText: "Напишите здесь",
                hintStyle: grey16MediumTextStyle,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey[400], width: 1.5),
                ),
              ),
            ),
          ),
          // Write here textfield end

          SizedBox(height: 30.0),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () async {
                Fluttertoast.showToast(
                  msg: 'Успешно отправлено',
                  backgroundColor: Colors.grey,
                  textColor: blackColor,
                );
                await Future.delayed(const Duration(seconds: 1), (){});
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(fixPadding * 1.5),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: primaryColor),
                child: Text(
                  'Отправить',
                  style: white18BoldTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
