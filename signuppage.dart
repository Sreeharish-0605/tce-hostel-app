import 'package:flutter/material.dart';
import 'boys.dart';
import 'girls.dart';
import 'main.dart';
import 'admin.dart';

class LoginPage1 extends StatefulWidget {
  @override
  LoginPage1State createState() => LoginPage1State();
}

class LoginPage1State extends State<LoginPage1> {
  bool isHiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

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
              image: AssetImage('images/background.jpg'),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'images/logo5.png',
                  //color: Colors.white,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 450,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            suffixIcon: Icon(
                              Icons.mail,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if(!RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}").hasMatch(value))
                            {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          obscureText: isHiddenPassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                size: 19,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            /*if(!RegExp("^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[\!\#\@\$\%\&\/\(\)\=\?\*\-\+\-\_\.\:\;\,\]\[\{\}\^])[A-Za-z0-9!#%]{8,15}").hasMatch(value))
                            {
                              return 'Please Enter Password With 1-low,high,num,sym';
                            }*/
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen1(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password',
                                style:
                                TextStyle(color: Colors.orangeAccent[700]),
                              ),
                            ),
                          ],

                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BoysPage(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      //children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Sign Up To Create New Account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpPage1(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up ',
                                style:
                                TextStyle(color: Colors.orangeAccent[700]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}

class ForgotPasswordScreen1 extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  void resetPassword() {
    // Implement the password reset logic here.
    // Typically, you'd make an API call to your backend for this.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your email to reset your password:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple),
              onPressed: resetPassword,
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}




class SignUpPage1 extends StatefulWidget {
  @override
  SignUpPage1State createState() => SignUpPage1State();
}

class SignUpPage1State extends State<SignUpPage1> {
  bool isHiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _rollnumberController = TextEditingController();
  final _nameController = TextEditingController();
/*
  Future SignUpPage() async {
  if (passwordconfirm()){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:_emailController.text,
    password:_passwordController.text,
    );

    addUserDetails(
        _emailController.text,
        int.parse(_rollnumberController.text),
        _nameController.text,
    );
  }
  }

  Future addUserDetails(String Name,int Roll,String Email) async{
    await FirebaseFirestore.instance.collection('users').add(
      {
        'Name':Name,
        'Roll':Roll,
        'email':Email,


      }
    );
  }
*/
  bool passwordconfirm(){
    if (_passwordController.text ==  _repasswordController.text)
      return true;
    else
      return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/background.jpg'),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'images/logo5.png',
                  //color: Colors.white,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 460,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            suffixIcon: Icon(
                              Icons.person,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            if(!RegExp("[A-Za-z]").hasMatch(value))
                            {
                              return 'Please Enter Valid Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          controller: _rollnumberController,
                          decoration: InputDecoration(
                            labelText: 'Roll Number',
                            suffixIcon: Icon(
                              Icons.person_pin_sharp,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your roll number';
                            }
                            if(!RegExp("^[0-9]{5}").hasMatch(value))
                            {
                              return 'Please Enter Valid Roll Number(5 digits)';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            suffixIcon: Icon(
                              Icons.mail,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if(!RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}").hasMatch(value))
                            {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          obscureText: isHiddenPassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                size: 19,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            /*if(!RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%^&-+=()])(?=S).{8, 20}").hasMatch(value))
                            {
                              return 'Please Enter Password With 1-low,high,num,sym';
                            }*/
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          obscureText: isHiddenPassword,
                          controller: _repasswordController,
                          decoration: InputDecoration(
                            labelText: 'Re-Enter Password',
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                size: 19,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Re-enter your password';
                            }
                            if ((_repasswordController.text!=_passwordController.text)){
                              return 'Password do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BoysPage(),
                              ),
                            );
                          }
                        },

                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'SIGN UP',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}






//girls


class LoginPage2 extends StatefulWidget {
  @override
  LoginPage2State createState() => LoginPage2State();
}

class LoginPage2State extends State<LoginPage2> {
  bool isHiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

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
              image: AssetImage('images/background.jpg'),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'images/logo5.png',
                  //color: Colors.white,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 450,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            suffixIcon: Icon(
                              Icons.mail,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if(!RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}").hasMatch(value))
                            {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          obscureText: isHiddenPassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                size: 19,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            /*if(!RegExp("^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[\!\#\@\$\%\&\/\(\)\=\?\*\-\+\-\_\.\:\;\,\]\[\{\}\^])[A-Za-z0-9!#%]{8,15}").hasMatch(value))
                            {
                              return 'Please Enter Password With 1-low,high,num,sym';
                            }*/
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen2(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password',
                                style:
                                TextStyle(color: Colors.orangeAccent[700]),
                              ),
                            ),
                          ],

                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GirlsPage(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      //children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Sign Up To Create New Account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpPage2(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up ',
                                style:
                                TextStyle(color: Colors.orangeAccent[700]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}

class ForgotPasswordScreen2 extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  void resetPassword() {
    // Implement the password reset logic here.
    // Typically, you'd make an API call to your backend for this.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your email to reset your password:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetPassword,
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}




class SignUpPage2 extends StatefulWidget {
  @override
  SignUpPage2State createState() => SignUpPage2State();
}

class SignUpPage2State extends State<SignUpPage2> {
  bool isHiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _rollnumberController = TextEditingController();
  final _nameController = TextEditingController();
/*
  Future SignUpPage() async {
  if (passwordconfirm()){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:_emailController.text,
    password:_passwordController.text,
    );

    addUserDetails(
        _emailController.text,
        int.parse(_rollnumberController.text),
        _nameController.text,
    );
  }
  }

  Future addUserDetails(String Name,int Roll,String Email) async{
    await FirebaseFirestore.instance.collection('users').add(
      {
        'Name':Name,
        'Roll':Roll,
        'email':Email,


      }
    );
  }
*/
  bool passwordconfirm(){
    if (_passwordController.text ==  _repasswordController.text)
      return true;
    else
      return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/background.jpg'),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'images/logo5.png',
                  //color: Colors.white,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 460,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            suffixIcon: Icon(
                              Icons.person,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            if(!RegExp("[A-Za-z]").hasMatch(value))
                            {
                              return 'Please Enter Valid Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          controller: _rollnumberController,
                          decoration: InputDecoration(
                            labelText: 'Roll Number',
                            suffixIcon: Icon(
                              Icons.person_pin_sharp,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your roll number';
                            }
                            if(!RegExp("^[0-9]{5}").hasMatch(value))
                            {
                              return 'Please Enter Valid Roll Number(5 digits)';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            suffixIcon: Icon(
                              Icons.mail,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if(!RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}").hasMatch(value))
                            {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          obscureText: isHiddenPassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                size: 19,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            /*if(!RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%^&-+=()])(?=S).{8, 20}").hasMatch(value))
                            {
                              return 'Please Enter Password With 1-low,high,num,sym';
                            }*/
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          obscureText: isHiddenPassword,
                          controller: _repasswordController,
                          decoration: InputDecoration(
                            labelText: 'Re-Enter Password',
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                size: 19,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Re-enter your password';
                            }
                            if ((_repasswordController.text!=_passwordController.text)){
                              return 'Password do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GirlsPage(),
                              ),
                            );
                          }
                        },

                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'SIGN UP',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}



//admin

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

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
              image: AssetImage('images/background.jpg'),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'images/logo5.png',
                  //color: Colors.white,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 330,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            suffixIcon: Icon(
                              Icons.mail,
                              size: 19,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if(!RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}").hasMatch(value))
                            {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          obscureText: isHiddenPassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                size: 19,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            /*if(!RegExp("^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[\!\#\@\$\%\&\/\(\)\=\?\*\-\+\-\_\.\:\;\,\]\[\{\}\^])[A-Za-z0-9!#%]{8,15}").hasMatch(value))
                            {
                              return 'Please Enter Password With 1-low,high,num,sym';
                            }*/
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password',
                                style:
                                TextStyle(color: Colors.orangeAccent[700]),
                              ),
                            ),
                          ],

                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminPage(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'SIGN IN',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  void resetPassword() {
    // Implement the password reset logic here.
    // Typically, you'd make an API call to your backend for this.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your email to reset your password:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple),
              onPressed: resetPassword,
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}



