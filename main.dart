//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'signuppage.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart' ;
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' ;

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ],
  );
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.purple),
    debugShowCheckedModeBanner: false,
    home: EntryPage(),
  ));
}



class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fron.jpg'),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                '     TCE HOSTEL',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
                SizedBox(height: 20),
                Image.asset(
                  'images/logo5.png',
                  height: 300,
                  width: 300,
                  scale: 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myitems=[
    Image.asset('images/hostel.jpg'),
    Image.asset('images/hostel1.jpg'),
    Image.asset('images/hostel2.jpg'),
    Image.asset('images/hostel3.jpg'),
    Image.asset('images/hostel4.jpg'),
  ];
  int mycurrentindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fron.jpg'),
              ),
              /*gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8A2387),
                  Color(0xFFE94057),
                  Color(0xFFF27121),
                ],
              ),*/
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 55),
                  Text(
                    'TCE HOSTEL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 33),
                  CarouselSlider(items: myitems, options: CarouselOptions(
                    autoPlay: true,
                    height: 250,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayInterval: Duration(seconds: 2),
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index,reason){
                      setState(() {
                        mycurrentindex = index;
                      });
                    },
                  ),
                  ),
                  SizedBox(height: 20),
                  AnimatedSmoothIndicator(activeIndex: mycurrentindex, count: myitems.length,
                  effect: WormEffect(
                    dotHeight: 9,
                    dotWidth: 9,
                    spacing: 11,
                    dotColor: Colors.grey.shade500,
                    activeDotColor: Colors.white,
                    paintStyle: PaintingStyle.fill,
                  ),
                  ),
                  SizedBox(height: 33),
                  Text(
                    'CHECK FOR MORE DETAILS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage('images/malebutton.png') ,
                      ),
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage('images/femalebutton.png') ,
                      ),
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage('images/admin.jpg') ,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50),),
                            )
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage1(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'BOYS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50),),
                        )
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage2(),
                              ),
                            );
                          }
                        },
                        
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'GIRLS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50),),
                            )
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          }
                        },

                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'ADMIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

