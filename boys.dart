import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' ;
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' ;
import 'signuppage.dart';
import 'main.dart';


class BoysPage extends StatefulWidget {
  @override
  _BoysPageState createState() => _BoysPageState();
}
class _BoysPageState extends State<BoysPage> {
  int myindex1=0;
  final _formKey = GlobalKey<FormState>();
  List Pages1=[
    HomePage1(),
    MealPage1(),
    ReportPage1(),
    ProfilePage1(),
  ];
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage1();
      case 1:
        return MealPage1();
      case 2:
        return ReportPage1();
      case 3:
        return ProfilePage1();
      default:
        return Container();
    }
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'MENS HOSTEL',
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirm Logout"),
                            content: Text("Are you sure you want to logout?"),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                              ),
                              TextButton(
                                child: Text("Logout"),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                  // Perform the logout action and navigate to the HomePage
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),
      body: _getPage(myindex1),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 25,
                  offset: Offset(8, 20)
              ),
            ]
        ),
        child : ClipRRect(
          borderRadius : BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.black,
            currentIndex: myindex1,
            onTap: (index){
              setState(() {
                myindex1=index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'HOME'),
              BottomNavigationBarItem(icon: Icon(Icons.food_bank),label: 'FOOD'),
              BottomNavigationBarItem(icon: Icon(Icons.report),label: 'REPORT'),
              BottomNavigationBarItem(icon: Icon(Icons.face),label: 'PROFILE'),
            ],
          ),
        ),
      ),
    );
  }
}



class HomePage1 extends StatefulWidget {
  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final myitems = [
    Image.asset('images/hostel.jpg'),
    Image.asset('images/hostel1.jpg'),
    Image.asset('images/hostel2.jpg'),
    Image.asset('images/hostel3.jpg'),
    Image.asset('images/hostel4.jpg'),
  ];

  int mycurrentindex = 0;

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
                image: AssetImage('images/backgr.jpg'),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CarouselSlider(
                    items: myitems,
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 250,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayInterval: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          mycurrentindex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedSmoothIndicator(
                    activeIndex: mycurrentindex,
                    count: myitems.length,
                    effect: WormEffect(
                      dotHeight: 9,
                      dotWidth: 9,
                      spacing: 11,
                      dotColor: Colors.grey.shade500,
                      activeDotColor: Colors.grey.shade900,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enjoy Your Stay As Home',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '* Free Wifi',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
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
                            builder: (context) => ContactUsPage1(),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              SizedBox(height: 20),
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
                        builder: (context) => RoomBookingPage1(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Room Book',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
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


class MealPage1 extends StatefulWidget {
  @override
  State<MealPage1> createState() => _MealPage1State();
}

class _MealPage1State extends State<MealPage1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final myitems = [
    Image.asset('images/hostel.jpg'),
    Image.asset('images/hostel1.jpg'),
    Image.asset('images/hostel2.jpg'),
    Image.asset('images/hostel3.jpg'),
    Image.asset('images/hostel4.jpg'),
  ];

  int mycurrentindex = 0;
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
                image: AssetImage('images/backgr.jpg'),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CarouselSlider(
                    items: myitems,
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 250,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayInterval: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          mycurrentindex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedSmoothIndicator(
                    activeIndex: mycurrentindex,
                    count: myitems.length,
                    effect: WormEffect(
                      dotHeight: 9,
                      dotWidth: 9,
                      spacing: 11,
                      dotColor: Colors.grey.shade500,
                      activeDotColor: Colors.grey.shade900,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'TCE Foods',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //children: [
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
                                builder: (context) => MealPlanTableDemo1(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'FOOD MENU',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  SizedBox(
                    height: 15,
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
                                builder: (context) => VotePage1(),
                              ),
                            );
                          }
                        },

                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'FOOD VOTE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  SizedBox(
                    height: 15,
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
                                builder: (context) => RatingDemo1(),
                              ),
                            );
                          }
                        },

                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'FOOD RATING',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    //],
                  //),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class ReportPage1 extends StatefulWidget {
  @override
  _ReportPage1State createState() => _ReportPage1State();
}

class _ReportPage1State extends State<ReportPage1> {
  TextEditingController _textController = TextEditingController();
  String selectedCategory = "";

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
        image: AssetImage('images/backgr.jpg'),
        ),
        ),
        ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 120,
                ),
                Text(
                  'Select a Category:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategory = "Maintenance";
                          _textController.clear();
                        });
                      },
                      child: Text('Maintenance'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategory = "Cleanliness";
                          _textController.clear();
                        });
                      },
                      child: Text('Cleanliness'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategory = "Security";
                          _textController.clear();
                        });
                      },
                      child: Text('Security'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategory = "Others";
                          _textController.clear();
                        });
                      },
                      child: Text('Others'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Category: $selectedCategory',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _textController,
                  maxLines: null,
                  maxLength: 3000,
                  decoration: InputDecoration(
                    hintText: 'Enter your report',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple
                  ),
                  onPressed: () {
                    // Handle the submission of the text here
                    String enteredText = _textController.text;
                    print('Category: $selectedCategory');
                    print('Report Text: $enteredText');
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
                ],
                ),
        );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}


class ProfilePage1 extends StatefulWidget {
  @override
  _ProfilePage1State createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  final _nameController1 = TextEditingController();
  final _roomnumberController1 = TextEditingController();
  final _phonenumberController1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/backgr.jpg'),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Container(
                          width: 200,
                          child: TextFormField(
                            controller: _nameController1,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              suffixIcon: Icon(
                                Icons.person,
                                size: 19,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              if (!RegExp("[A-Za-z]").hasMatch(value)) {
                                return 'Please enter a valid name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 200,
                          child: TextFormField(
                            controller: _phonenumberController1,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              suffixIcon: Icon(
                                Icons.phone,
                                size: 19,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your roll number';
                              }
                              if (!RegExp("^[0-9]{10}").hasMatch(value)) {
                                return 'Please Enter Valid Roll Number(10 digits)';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 200,
                          child: TextFormField(
                            controller: _roomnumberController1,
                            decoration: InputDecoration(
                              labelText: 'Room Number',
                              suffixIcon: Icon(
                                Icons.room,
                                size: 19,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your roll number';
                              }
                              if (!RegExp("[a-zA-Z0-9_.-]*").hasMatch(value)) {
                                return 'Please Enter Valid Roll Number(5 digits)';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                          onPressed: () {
                            // Add functionality to save the data here.
                          },
                          child: Text('SAVE'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 200,
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('images/malebutton.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class MealPlanTableDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Meal Plan"),
      ),
      body:Stack(
          children: [
      Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/backgr.jpg'),
        ),
      ),
    ),
      Center(
        child: MealPlanTable1(),
      ),
    ],
      ),
    );
  }
}

class MealPlanTable1 extends StatelessWidget {
  // Define a data structure for meal plans
  final List<Map<String, String>> mealPlans = [
    {
      'day': 'Monday',
      'morning': 'Pongal',
      'afternoon': 'Variety Rice',
      'evening': 'Nuts',
      'night': 'Chappati',
    },
    {
      'day': 'Tuesday',
      'morning': 'Dosa',
      'afternoon': 'SAMBAR',
      'evening': 'Bajji',
      'night': 'Parotta',
    },
    {
      'day': 'Wednesday',
      'morning': 'Bread',
      'afternoon': 'Biriyani',
      'evening': 'Paalbun',
      'night': 'Idly',
    },
    {
      'day': 'Thursday',
      'morning': 'Dosa',
      'afternoon': 'Parupu/karakulamu',
      'evening': 'Bonda',
      'night': 'Chappati',
    },
    {
      'day': 'Friday',
      'morning': 'Idly',
      'afternoon': 'Sambar',
      'evening': 'Vadai',
      'night': 'Dosa',
    },
    {
      'day': 'Saturday',
      'morning': 'Pongal',
      'afternoon': 'Pulikulambu',
      'evening': 'Sundal',
      'night': 'Poori',
    },
    {
      'day': 'Sunday',
      'morning': 'Rava Dosa',
      'afternoon': 'Biriyani',
      'evening': 'Millet',
      'night': 'Dosa',
    },
  ];

    @override
    Widget build(BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Day')),
              DataColumn(label: Text('Morning')),
              DataColumn(label: Text('Afternoon')),
              DataColumn(label: Text('Evening')),
              DataColumn(label: Text('Night')),
            ],
            rows: mealPlans.map((mealPlan) {
              return DataRow(
                cells: [
                  DataCell(Text(mealPlan['day'] ?? '')),
                  DataCell(Text(mealPlan['morning'] ?? '')),
                  DataCell(Text(mealPlan['afternoon'] ?? '')),
                  DataCell(Text(mealPlan['evening'] ?? '')),
                  DataCell(Text(mealPlan['night'] ?? '')),
                ],
              );
            }).toList(),
          ),
        ),
      );
    }
  }





class RatingDemo1 extends StatefulWidget {
  @override
  _RatingDemo1State createState() => _RatingDemo1State();
}

class _RatingDemo1State extends State<RatingDemo1> {
  int rating = 0;

  void updateRating(int newRating) {
    setState(() {
      rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Meal Plan"),
      ),
      body: Stack(
          children: [
      Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/backgr.jpg'),
        ),
      ),
    ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rate Us",
              style: TextStyle(fontSize: 25,color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "1-Very Poor",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "2-Poor",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "3-Average",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "4-Good",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "5-Excellent",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: Icon(
                      i <= rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      updateRating(i);
                    },
                  ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Rating: ${rating == 0 ? 'Not rated' : rating}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
            ],
            ),
    );
  }
}


class VotePage1 extends StatefulWidget {
  @override
  State<VotePage1> createState() => _VotePage1State();
}

class _VotePage1State extends State<VotePage1> {
  List<String> meals = [
    'Dosa',
    'Idly',
    'Bread',
    'Chappati',
    'Poori',
    'Parotta',
    'Variety rice',
    'Normal Rice With Sambar',
    'Pongal',
    'Kothu parotta',
  ];

  List<int> votes = List.generate(10, (index) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Meal Plan"),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/backgr.jpg'),
              ),
            ),
          ),
          ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(meals[index]),
                trailing: Text('${votes[index]} votes'),
                onTap: () {
                  setState(() {
                    votes[index]++;
                  });
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Votes Submitted'),
                content: Text('Thank you for voting!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}


class ContactUsPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Contact Us'),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/backgr.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 100),
          ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              ContactCard(
                avatarImage: 'images/malebutton.png',
                name: 'Manoharan',
                email: 'manoharan@gmail.com',
              ),
              ContactCard(
                avatarImage: 'images/malebutton.png',
                name: 'prasanna',
                email: 'prassana@gmail.com',
              ),
              ContactCard(
                avatarImage: 'images/malebutton.png',
                name: 'nil',
                email: 'nil@gmail.com',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String avatarImage;
  final String name;
  final String email;

  ContactCard({
    required this.avatarImage,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(avatarImage),
          radius: 30.0,
        ),
        title: Text(name),
        subtitle: SingleChildScrollView(
          child: Text(email),
        ),
      ),
    );
  }
}




class RoomBookingPage1 extends StatefulWidget {
  @override
  _RoomBookingPage1State createState() => _RoomBookingPage1State();
}

class _RoomBookingPage1State extends State<RoomBookingPage1> {
  String selectedBlock = "A";
  double billAmount = 0.0;

  final Map<String, double> blockRates = {
    "A": 80000.0,
    "B": 80000.0,
    "C": 80000.0,
    "D": 80000.0,
    "E": 90000.0,
    "F": 90000.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Room Booking'),
        toolbarHeight: 50.0,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/backgr.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Select Block:'),
                  DropdownButton<String>(
                    value: selectedBlock,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBlock = newValue!;
                        billAmount = blockRates[selectedBlock]!;
                      });
                    },
                    items: blockRates.keys.map((String block) {
                      return DropdownMenuItem<String>(
                        value: block,
                        child: Text(block),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text('Enter Room Number:'),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Room Number',
                      suffixIcon: Icon(
                        Icons.room,
                        size: 19,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text('Bill Amount: Rs. ${billAmount.toStringAsFixed(2)}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    onPressed: () {
                    },
                    child: Text('Book Room'),
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