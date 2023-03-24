//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'company_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Email-Controller
  final _emailController = TextEditingController();
  //Password-Controller
  final _passwordController = TextEditingController();

  var companyRoute = MaterialPageRoute(
    builder: (BuildContext context) => CompanyPage(),
  );

  signIn() {
    Navigator.push(context, companyRoute);
  }

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // ignore: prefer_const_literals_to_create_immutables
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Clevercost Logo
                Image.asset('lib/images/clevercost_login.png'),

                //Account e-mail
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Account e-mail',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff43425d),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8), //Spacing

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextField(
                      controller: _emailController, //Email-Controller
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30), //Spacing

                //Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff43425d),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8), //Spacing

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextField(
                      controller: _passwordController, //Password-Controller
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10), //Spacing

                //Remember me on this device
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        rememberMe = !rememberMe;
                      });
                    },
                    child: Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (newValue) {
                            setState(() {
                              rememberMe = newValue!;
                            });
                          },
                        ),
                        Text(
                          "Remember me on this device",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //Log in
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff347dfe),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Sign up

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('or'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 34),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
