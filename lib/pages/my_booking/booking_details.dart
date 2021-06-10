import 'package:car_clean/constant/constant.dart';
import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Больше информации',
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
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            color: primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Отменить бронь',
              style: white18BoldTextStyle,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          serviceProviderDetails(),
          devider(),
          carDetail(),
          devider(),
          dateTimeDetail(),
          devider(),
          services(),
          devider(),
          totalAmount(),
        ],
      ),
    );
  }

  serviceProviderDetails() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сведения о поставщике услуг',
            style: primaryColor18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'TI Detailing',
            style: black16MediumTextStyle,
          ),
          height5Space,
          Text(
            '18, Жарокова, Алматы.',
            style: black14RegularTextStyle,
          ),
        ],
      ),
    );
  }

  carDetail() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сведения о машине',
            style: primaryColor18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Модель машины:',
                style: black14BoldTextStyle,
              ),
              width5Space,
              Text(
                'Camry',
                style: black14RegularTextStyle,
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Номер машины:',
                style: black14BoldTextStyle,
              ),
              width5Space,
              Text(
                '787 PFA 02',
                style: black14RegularTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  dateTimeDetail() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сведения о времени и дате',
            style: primaryColor18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            '12 Jun, 2021',
            style: black16MediumTextStyle,
          ),
          height5Space,
          Text(
            '05:00 PM',
            style: black14RegularTextStyle,
          ),
        ],
      ),
    );
  }

  services() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Услуги',
            style: primaryColor18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Мойка авто',
                style: black14MediumTextStyle,
              ),
              width5Space,
              Text(
                '\$10',
                style: black14MediumTextStyle,
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Детализация двигателя',
                style: black14MediumTextStyle,
              ),
              width5Space,
              Text(
                '\$50',
                style: black14MediumTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  totalAmount() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Сумма',
            style: black18BoldTextStyle,
          ),
          width5Space,
          Text(
            '\$60',
            style: primaryColor22BoldTextStyle,
          ),
        ],
      ),
    );
  }

  devider() {
    return Container(
      width: double.infinity,
      height: 5.0,
      color: greyColor.withOpacity(0.5),
    );
  }
}
