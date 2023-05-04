//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:login_clevercost_1/constants.dart';
import 'basic_buttom.dart';
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

  double _containerHeight = 350.0;
  bool rememberMe = false;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_onEmailFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_onEmailFocusChange);
    _passwordFocusNode.removeListener(_onPasswordFocusChange);
    super.dispose();
  }

  void _onEmailFocusChange() {
    setState(() {
      if (_emailFocusNode.hasFocus) {
        _containerHeight = 150.0;
      } else {
        _containerHeight = 350.0;
      }
    });
  }

  void _onPasswordFocusChange() {
    setState(() {
      if (_passwordFocusNode.hasFocus) {
        _containerHeight = 150.0;
      } else {
        _containerHeight = 350.0;
      }
    });
  }

  signIn() {
    Navigator.push(context, companyRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                //Clevercost Logo
                SizedBox(
                  height: _containerHeight,
                  width: double.infinity,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    color: kBluePrimary,
                    child: Center(
                      child: Image.asset('lib/images/CleverCostLogo_v3.png'),
                    ),
                  ),
                ),

                SizedBox(height: 30), //Spacing

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
                      focusNode: _emailFocusNode, //Email-FocusNode
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
                      focusNode: _passwordFocusNode, //Password-FocusNode
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
                  child: BasicButton(
                    buttonTitle: 'Log in',
                    onTap: signIn,
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

                SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
