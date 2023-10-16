import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:track_flow/feature_2/models/screens/widgets/transactions.dart';
import 'package:track_flow/feature_3/models/screens/form_screen.dart';
import 'package:track_flow/feature_1/screens/login_screen.dart';
import 'package:track_flow/feature_1/widgets/btn.dart';
import 'package:track_flow/feature_1/widgets/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  static const String routeName = '/Home';

  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

class _HomeState extends State<Home> {
  User? userId = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF5591F),
          title: const Text("Home"),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: CustomButton(
                    curve: 12,
                    color: AppColor(context).secondary,
                    title: "Form Screen",
                    onTap: () {
                      Navigator.of(context).pushNamed(FormScreen.routeName);
                    },
                    size: 18,
                    height: 50,
                  )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "previous transactions :",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("client")
                      .where("userId", isEqualTo: userId?.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something went wrong!");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("No Data Found!"),
                      );
                    }

                    if (snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var amount = snapshot.data!.docs[index]['Amount'];
                          var fromAccount =
                              snapshot.data!.docs[index]['From Account'];
                          String toAccount =
                              snapshot.data!.docs[index]['To Account'];

                          return TransactionWidget(
                            fromAccount: fromAccount,
                            toAccount: toAccount,
                            amount: amount,
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: CustomButton(
                      color: AppColor(context).red,
                      title: "LogOut",
                      onTap: () async {
                        await signOut();
                        if (mounted) {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        }
                      },
                      width: 100,
                      size: 15,
                      height: 30,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
