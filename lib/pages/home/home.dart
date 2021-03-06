import 'dart:io';
// import 'dart:math';

import 'package:car_clean/constant/constant.dart';
import 'package:car_clean/pages/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  DateTime currentBackPressTime;
  final serviceProviderList = [
    {
      'name': 'LUX Services ',
      'address': 'Абай 38, Алматы.',
      'locationLat': 43.237356,
      'locationLang': 76.877568,
      'image': 'assets/service_provider/carwash.jpeg',
      'cost': '10',
      'rating': '4.5',
      'distance': '3.5 км',
      'heroTag': 'hero_2'
    },
    {
      'name': 'TI Detailing ',
      'address': 'Жарокова 18, Алматы.',
      'locationLat': 43.225849,
      'locationLang': 76.900057,
      'image': 'assets/service_provider/provider3.jpeg',
      'cost': '10',
      'rating': '5',
      'distance': '3.5 км',
      'heroTag': 'hero_1'
    },
    {
      'name': 'Shik ',
      'address': 'Сатпаев 167, Алматы.',
      'locationLat': 43.209618,
      'locationLang': 76.840685,
      'image': 'assets/service_provider/carwash1.jpeg',
      'cost': '10',
      'rating': '4.5',
      'distance': '3.5 км',
      'heroTag': 'hero_3'
    },
    {
      'name': 'Keruen ',
      'address': 'Байтурсынов 157, Алматы.',
      'locationLat': 43.241545,
      'locationLang': 76.927701,
      'image': 'assets/service_provider/provider.jpeg',
      'cost': '10',
      'rating': '4',
      'distance': '3.5 км',
      'heroTag': 'hero_4'
    },
    {
      'name': 'Shine Wash ',
      'address': 'Толе би 51, Алматы.',
      'locationLat': 43.254611,
      'locationLang': 76.942204,
      'image': 'assets/service_provider/provider_1.jpg',
      'cost': '10',
      'rating': '5',
      'distance': '3.5 км',
      'heroTag': 'hero_5'
    },
    {
      'name': 'Ceramic ',
      'address': 'Абдуллиных 56, Алматы.',
      'locationLat': 43.256674,
      'locationLang': 76.960526,
      'image': 'assets/service_provider/provider_3.jpg',
      'cost': '10',
      'rating': '4.5',
      'distance': '3.5 км',
      'heroTag': 'hero_6'
    },
    {
      'name': 'VIP ',
      'address': 'Мендикулова 45, Алматы.',
      'locationLat': 43.230321,
      'locationLang': 76.953834,
      'image': 'assets/service_provider/carwash.jpeg',
      'cost': '10',
      'rating': '4.5',
      'distance': '3.5 км',
      'heroTag': 'hero_7'
    },
    {
      'name': 'Wash ',
      'address': 'Елеубекова 38, Алматы.',
      'locationLat': 43.226443,
      'locationLang': 76.965086,
      'image': 'assets/service_provider/provider.jpeg',
      'cost': '10',
      'rating': '4.5',
      'distance': '3.5 км',
      'heroTag': 'hero_8'
    }
  ];

  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    super.initState();

    // DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    // _testRef.set("Hello world ${Random().nextInt(100)}");

    serviceProviderList.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element['name']),
          draggable: false,
          infoWindow:
              InfoWindow(title: element['name'], snippet: element['address']),
          position: LatLng(element['locationLat'], element['locationLang'])));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _serviceProviderFinalList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 185.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 600),
              child: ServiceProvider(
                heroTag: serviceProviderList[index]['heroTag'],
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 175.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: Container(
                  padding: EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: serviceProviderList[index]['heroTag'],
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                        serviceProviderList[index]['image']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          widthSpace,
                          Container(
                            width: 275.0 - 60.0 - 10.0 - 28.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  serviceProviderList[index]['name'],
                                  style: black14BoldTextStyle,
                                ),
                                height5Space,
                                Text(
                                  serviceProviderList[index]['address'],
                                  style: grey12RegularTextStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                height5Space,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      serviceProviderList[index]['rating'],
                                      style: black12RegularTextStyle,
                                    ),
                                    width5Space,
                                    Icon(
                                      Icons.star,
                                      size: 16.0,
                                      color: Colors.lime,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Дистанция',
                                style: grey12RegularTextStyle,
                              ),
                              height5Space,
                              Text(
                                serviceProviderList[index]['distance'],
                                style: black14BoldTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Стоимость',
                                style: grey12RegularTextStyle,
                              ),
                              height5Space,
                              Text(
                                serviceProviderList[index]['cost'],
                                style: black14BoldTextStyle,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                fixPadding, 5.0, fixPadding, 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1.0,
                                color: primaryColor,
                              ),
                            ),
                            child: Text(
                              'Забронировать',
                              style: black12RegularTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  logoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        double width = MediaQuery.of(context).size.width;
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Вы уверены то хотите выйти?',
                      style: black14BoldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1.0,
                                color: blackColor,
                              ),
                              color: whiteColor,
                            ),
                            child: Text(
                              'Отмена',
                              style: black16MediumTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: primaryColor,
                            ),
                            child: Text(
                              'Выйти',
                              style: white16MediumTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          'CarClean',
          style: appBarTextStyle,
        ),
      ),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(serviceProviderList[0]['locationLat'],
                        serviceProviderList[0]['locationLang']),
                    zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
                zoomControlsEnabled: false,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: serviceProviderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _serviceProviderFinalList(index);
                  },
                ),
              ),
            )
          ],
        ),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Нажмите еще раз чтобы выйти.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
            serviceProviderList[_pageController.page.toInt()]['locationLat'],
            serviceProviderList[_pageController.page.toInt()]['locationLang']),
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  Drawer drawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            heightSpace,
            heightSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: AssetImage('assets/user/user_1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Icon(
                  //   Icons.person_outline_rounded,
                  //   size: 100,
                  // ),
                ),
                height5Space,
                InkWell(
                  child: Text(_auth.currentUser.email.toString(), style: black14RegularTextStyle,),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: Icon(
                Icons.home,
                color: blackColor,
              ),
              title: Text(
                'Главная',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBooking(),
                  ),
                );
              },
              leading: Icon(
                Icons.security,
                color: blackColor,
              ),
              title: Text(
                'Мои брони',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Favorites(),
                  ),
                );
              },
              leading: Icon(
                Icons.favorite,
                color: blackColor,
              ),
              title: Text(
                'Избранные',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAddress(),
                  ),
                );
              },
              leading: Icon(
                Icons.location_on,
                color: blackColor,
              ),
              title: Text(
                'Мой адрес',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUs(),
                  ),
                );
              },
              leading: Icon(
                Icons.email,
                color: blackColor,
              ),
              title: Text(
                'Свяжитесь с нами',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
              leading: Icon(
                Icons.settings,
                color: blackColor,
              ),
              title: Text(
                'Настройки',
                style: black14RegularTextStyle,
              ),
            ),
            ListTile(
              onTap: () => logoutDialog(),
              leading: Icon(
                Icons.exit_to_app,
                color: primaryColor,
              ),
              title: Text(
                'Выйти',
                style: primaryColor14RegularTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
