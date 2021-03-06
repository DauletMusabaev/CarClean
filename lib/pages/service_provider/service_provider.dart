import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

class ServiceProvider extends StatefulWidget {
  final String heroTag;

  const ServiceProvider({Key key, @required this.heroTag}) : super(key: key);
  @override
  _ServiceProviderState createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  Set<Marker> markers;
  bool favorite = false;
  bool services = true, about = false;
  bool bodyWash = true,
      interiorCleaning = false,
      engineDetailing = false,
      lightService = false;
  int total = 0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
    markers = Set.from([]);
  }

  calculateTotal() {
    total = 0;
    if (bodyWash) {
      total = total + 10;
    }
    if (interiorCleaning) {
      total = total + 30;
    }
    if (engineDetailing) {
      total = total + 50;
    }
    if (lightService) {
      total = total + 30;
    }
    setState(() {
      total = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: (services)
          ? Material(
              elevation: 1.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SelectDateTime(total: this.total,),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  color: primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    'Забронировать (\$$total)',
                    style: white18BoldTextStyle,
                  ),
                ),
              ),
            )
          : Container(
              height: 0.0,
              width: 0.0,
            ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 350.0,
                pinned: true,
                forceElevated: true,
                automaticallyImplyLeading: false,
                backgroundColor: primaryColor,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.heroTag,
                    child: Container(
                      width: width,
                      // height: 350.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/service_provider/provider3.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              nameAddressReview(),
              serviceAboutReviewsTabs(),
              (services) ? servicesData() : aboutData()
            ],
          ),
        ),
      ),
    );
  }

  nameAddressReview() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TI Detailing ',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          Text(
            'Жароков 18, Алматы',
            style: grey14MediumTextStyle,
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '5',
                style: black14RegularTextStyle,
              ),
              width5Space,
              Icon(
                Icons.star,
                color: Colors.lime,
                size: 18.0,
              ),
              Icon(
                Icons.star,
                color: Colors.lime,
                size: 18.0,
              ),
              Icon(
                Icons.star,
                color: Colors.lime,
                size: 18.0,
              ),
              Icon(
                Icons.star,
                color: Colors.lime,
                size: 18.0,
              ),
              Icon(
                Icons.star,
                color: Colors.lime,
                size: 18.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  serviceAboutReviewsTabs() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (!services) {
                    setState(() {
                      services = true;
                      about = false;
                    });
                  }
                },
                child: Container(
                  width: (width - 2.0) / 2,
                  height: 40.0,
                  alignment: Alignment.center,
                  color: (services) ? primaryColor : whiteColor,
                  child: Text(
                    'Услуги ',
                    style: (services)
                        ? white14BoldTextStyle
                        : black14BoldTextStyle,
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  if (!about) {
                    setState(() {
                      services = false;
                      about = true;
                    });
                  }
                },
                child: Container(
                  width: (width - 2.0) / 2,
                  height: 40.0,
                  alignment: Alignment.center,
                  color: (about) ? primaryColor : whiteColor,
                  child: Text(
                    'Относительно',
                    style:
                        (about) ? white14BoldTextStyle : black14BoldTextStyle,
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.grey,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  servicesData() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Body Wash Start
              InkWell(
                onTap: () {
                  setState(() {
                    bodyWash = !bodyWash;
                  });
                  calculateTotal();
                },
                child: Container(
                  width: (width - fixPadding * 6.0 - 2.0) / 2,
                  height: (width - fixPadding * 6.0 - 2.0) / 2,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        color: blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: (width - fixPadding * 6.0 - 2.0) / 2,
                        height: (width - fixPadding * 6.0 - 2.0) / 2,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: (bodyWash) ? primaryColor : whiteColor,
                                border: Border.all(
                                  width: 1.0,
                                  color: primaryColor,
                                ),
                              ),
                              child: Icon(
                                Icons.directions_car,
                                size: 29.0,
                                color: (bodyWash) ? whiteColor : primaryColor,
                              ),
                            ),
                            heightSpace,
                            height5Space,
                            Text(
                              'Мойка авто',
                              style: black14BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '\$10',
                              style: black18BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: (bodyWash)
                            ? Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              // Body Wash End

              // Interior Cleaning Start
              InkWell(
                onTap: () {
                  setState(() {
                    interiorCleaning = !interiorCleaning;
                  });
                  calculateTotal();
                },
                child: Container(
                  width: (width - fixPadding * 6.0 - 2.0) / 2,
                  height: (width - fixPadding * 6.0 - 2.0) / 2,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        color: blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: (width - fixPadding * 6.0 - 2.0) / 2,
                        height: (width - fixPadding * 6.0 - 2.0) / 2,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: (interiorCleaning)
                                    ? primaryColor
                                    : whiteColor,
                                border: Border.all(
                                  width: 1.0,
                                  color: primaryColor,
                                ),
                              ),
                              child: Icon(
                                Icons.airline_seat_recline_extra,
                                size: 29.0,
                                color: (interiorCleaning)
                                    ? whiteColor
                                    : primaryColor,
                              ),
                            ),
                            heightSpace,
                            height5Space,
                            Text(
                              'Уборка салона ',
                              style: black14BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '\$30',
                              style: black18BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: (interiorCleaning)
                            ? Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              // Interior Cleaning End
            ],
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Engine Detailing Start
              InkWell(
                onTap: () {
                  setState(() {
                    engineDetailing = !engineDetailing;
                  });
                  calculateTotal();
                },
                child: Container(
                  width: (width - fixPadding * 6.0 - 2.0) / 2,
                  height: (width - fixPadding * 6.0 - 2.0) / 2,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        color: blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: (width - fixPadding * 6.0 - 2.0) / 2,
                        height: (width - fixPadding * 6.0 - 2.0) / 2,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: (engineDetailing)
                                    ? primaryColor
                                    : whiteColor,
                                border: Border.all(
                                  width: 1.0,
                                  color: primaryColor,
                                ),
                              ),
                              child: Icon(
                                Icons.dashboard,
                                size: 29.0,
                                color: (engineDetailing)
                                    ? whiteColor
                                    : primaryColor,
                              ),
                            ),
                            heightSpace,
                            height5Space,
                            Text(
                              'Осмотр двигателя',
                              style: black14BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '\$50',
                              style: black18BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: (engineDetailing)
                            ? Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              // Engine Detailing End

              // Light Service Start
              InkWell(
                onTap: () {
                  setState(() {
                    lightService = !lightService;
                  });
                  calculateTotal();
                },
                child: Container(
                  width: (width - fixPadding * 6.0 - 2.0) / 2,
                  height: (width - fixPadding * 6.0 - 2.0) / 2,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        color: blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: (width - fixPadding * 6.0 - 2.0) / 2,
                        height: (width - fixPadding * 6.0 - 2.0) / 2,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color:
                                    (lightService) ? primaryColor : whiteColor,
                                border: Border.all(
                                  width: 1.0,
                                  color: primaryColor,
                                ),
                              ),
                              child: Icon(
                                Icons.highlight,
                                size: 29.0,
                                color:
                                    (lightService) ? whiteColor : primaryColor,
                              ),
                            ),
                            heightSpace,
                            height5Space,
                            Text(
                              'Оптика',
                              style: black14BoldTextStyle,
                            ),
                            heightSpace,
                            Text(
                              '\$30',
                              style: black18BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: (lightService)
                            ? Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              // Light Service End
            ],
          ),
        ],
      ),
    );
  }

  aboutData() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Время работы',
            style: black18BoldTextStyle,
          ),
          height5Space,
          Text(
            'Открыты сейчас (09:00 AM - 22:00 PM)',
            style: primaryColor12RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Относительно ',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit pharetra luctus turpis quis senectus vitae dis nisl porttitor. Et id venenatis, potenti sapien purus aliquam est. Tellus ut tincidunt id mi cum. Bibendum vestibulum blandit semper aenean egestas nunc dignissim id.',
            style: black14RegularTextStyle,
            textAlign: TextAlign.justify,
          ),
          heightSpace,
          heightSpace,
          Text(
            'Локация',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GoogleMap(
                markers: markers,
                onMapCreated: (GoogleMapController controller) {
                  Marker m = Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(51.361005, -0.1746394));
                  setState(() {
                    markers.add(m);
                  });
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(43.226443, 76.965086), zoom: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ratingBar(ratingNumber) {
    print(ratingNumber);
    if (ratingNumber == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
    if (ratingNumber == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
    if (ratingNumber == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
    if (ratingNumber == 4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
    if (ratingNumber == 5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
          Icon(Icons.star, color: Colors.lime, size: 15.0),
        ],
      );
    }
  }
}
