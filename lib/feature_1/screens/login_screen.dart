import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:track_flow/feature_1/services/signin_services.dart';
import 'package:track_flow/feature_2/models/screens/home.dart';
import 'package:track_flow/feature_1/screens/signup_screen.dart';
import 'package:track_flow/feature_1/widgets/btn.dart';
import 'package:track_flow/feature_1/widgets/color.dart';
import 'package:track_flow/feature_1/widgets/decoration.dart';
import 'package:track_flow/feature_1/widgets/form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FocusNode username, password, logIn;
  TextEditingController uNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  bool loading = false;
  bool obscure = true;

  @override
  void initState() {
    username = FocusNode();
    password = FocusNode();
    logIn = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    logIn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(90)),
                      color: Color(0xffF5591F),
                      gradient: LinearGradient(
                        colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Image.asset(
                            "assets/images/app_logo.png",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20, top: 20),
                          alignment: Alignment.bottomRight,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomFormField(
                      prefix: const Icon(
                        Icons.email,
                        color: Color(0xffF5591F),
                      ),
                      fillColor: Colors.white,
                      label: "Username",
                      labelColor: Colors.white,
                      maxLength: 30,
                      border: AppDecoration.of(context).border2,
                      hint: "Username",
                      focus: username,
                      controller: uNameController,
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onEditDone: () {
                        username.unfocus();
                        FocusScope.of(context).requestFocus(password);
                      },
                    ),
                  ),

                  // password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomFormField(
                      prefix: const Icon(
                        Icons.password,
                        color: Color(0xffF5591F),
                      ),
                      fillColor: const Color.fromARGB(255, 238, 238, 238),
                      maxLength: 30,
                      label: "Password",
                      labelColor: Colors.white,
                      border: AppDecoration.of(context).border2,
                      hint: "Password",
                      obscure: obscure,
                      focus: password,
                      controller: passController,
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: obscure
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppColor.of(context)
                                      .primary
                                      .withOpacity(0.3),
                                  size: 25.0,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: AppColor.of(context).primary,
                                  size: 25.0,
                                )),
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onEditDone: () {
                        password.unfocus();
                        FocusScope.of(context).requestFocus(logIn);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),

                  //LogIn
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: CustomButton(
                      curve: 50,
                      color: AppColor(context).secondary1,
                      title: "login",
                      loading: loading,
                      size: 18,
                      focus: logIn,
                      height: 50,
                      onTap: uNameController.text.isEmpty ||
                              passController.text.isEmpty
                          ? null
                          : () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                loading = true;
                              });
                              await signIn(context, uNameController.text,
                                  passController.text);
                              if (FirebaseAuth.instance.currentUser != null) {
                                if (mounted) {
                                  Navigator.of(context)
                                      .pushNamed(Home.routeName);
                                }
                              }
                              setState(() {
                                loading = false;
                              });
                            },
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't Have Any Account?  "),
                        GestureDetector(
                          child: const Text(
                            "Register Now",
                            style: TextStyle(color: Color(0xffF5591F)),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
