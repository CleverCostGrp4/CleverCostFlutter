//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_clevercost_1/constants.dart';
import '../../../basic_buttom.dart';
import '../../../company_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Add form key
  final _formKey =
      GlobalKey<FormState>(); //final _formKey = GlobalKey<FormBuilderState>();
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
      _containerHeight = _emailFocusNode.hasFocus ? 150.0 : 300.0;
    });
  }

  void _onPasswordFocusChange() {
    setState(() {
      _containerHeight = _passwordFocusNode.hasFocus ? 150.0 : 300.0;
    });
  }

  Future<void> _launchURLRegister() async {
    final Uri url = Uri.parse('https://dashboard.clevercost.com/register');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchURLForgot() async {
    final Uri url =
        Uri.parse('https://dashboard.clevercost.com/password/reset');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }



  void signIn() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, companyRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          setState(() {
            _containerHeight = 300.0;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Form(
                key: _formKey,
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
                          child:
                              Image.asset('lib/images/CleverCostLogo_v3.png'),
                        ),
                      ),
                    ),

                    SizedBox(height: 15), //Spacing

                    // Account e-mail Label
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
                    SizedBox(height: 5), //Spacing

                    // Email input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          validator: _validateEmail,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            hintText: 'Email',
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Password Label
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
                    SizedBox(height: 5), //Spacing

                    // Password input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          obscureText: true,
                          validator: _validatePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            hintText: 'Password',
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10), //Spacing

                    //Remember me on this device
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
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
                                    "Remember me",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: _launchURLForgot,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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

                    GestureDetector(
                      onTap: _launchURLRegister,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    SizedBox(height: 300.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
