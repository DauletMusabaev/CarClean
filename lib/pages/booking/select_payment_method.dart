import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';

class SelectPaymentMethod extends StatefulWidget {
  int total;
  SelectPaymentMethod({this.total});
  @override
  _SelectPaymentMethodState createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  String selectedPaymentMethod = 'Card';

  successOrderDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 60.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: primaryColor, width: 1.0),
                      ),
                      child: Icon(
                        Icons.check,
                        size: 24.0,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Удачно!",
                      style: grey18BoldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Выберите способ оплаты',
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
      bottomNavigationBar: Material(
        elevation: 1.0,
        child: InkWell(
          onTap: () => successOrderDialog(),
          child: Container(
            width: double.infinity,
            height: 50.0,
            color: primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Продолжить',
              style: white18BoldTextStyle,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(fixPadding * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Оплатить:',
                  style: primaryColor18BoldTextStyle,
                ),
                width5Space,
                Text(
                  "\$${widget.total}",
                  style: black18MediumTextStyle,
                ),
              ],
            ),
          ),
          paymentTile(Icons.credit_card_rounded, 'Карта'),
          heightSpace,
          heightSpace,
          //paymentTile('assets/payment/paypal.png', 'Paypal'),
          heightSpace,
          paymentTile(Icons.attach_money, 'Наличные'),
        ],
      ),
    );
  }

  paymentTile(icon, name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          setState(() {
            selectedPaymentMethod = name;
          });
        },
        child: Container(
          height: 95.0,
          padding: EdgeInsets.all(fixPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: whiteColor,
            border: Border.all(
              width: 0.8,
              color: (selectedPaymentMethod == name)
                  ? primaryColor
                  : Colors.transparent,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: blackColor.withOpacity(0.25),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              // Image.asset(
              //   image,
              //   width: 70.0,
              //   fit: BoxFit.fitHeight,
              // ),
              widthSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: black18BoldTextStyle,
                    ),
                    (selectedPaymentMethod == name)
                        ? Container(
                            width: 24.0,
                            height: 24.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: whiteColor,
                              border: Border.all(
                                width: 1.0,
                                color: primaryColor,
                              ),
                            ),
                            child: Container(
                              width: 16.0,
                              height: 16.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: primaryColor,
                              ),
                            ),
                          )
                        : Container(
                            height: 0.0,
                            width: 0.0,
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
