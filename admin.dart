import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' ;
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' ;
import 'signuppage.dart';
import 'main.dart';


class AdminPage extends StatefulWidget {

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                                builder: (context) => VotePage(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'VOTES',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  SizedBox(height: 33),
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
                                builder: (context) => RatePage(),
                              ),
                            );
                          }
                        },

                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'RATING',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  SizedBox(height: 33),
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
                                builder: (context) => ReportPage(),
                              ),
                            );
                          }
                        },

                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'REPORT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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


class VotePage extends StatefulWidget {
  const VotePage({super.key});

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}



class RatePage extends StatefulWidget {

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}


class ReportPage extends StatefulWidget {

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
