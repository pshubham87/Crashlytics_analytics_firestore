import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:track_flow/feature_2/services/log_controller.dart';
import 'package:track_flow/feature_2/services/form_services.dart';
import 'package:track_flow/feature_2/widgets/drop_down.dart';
import 'package:track_flow/widgets/btn.dart';
import 'package:track_flow/widgets/color.dart';
import 'package:track_flow/widgets/decoration.dart';
import 'package:track_flow/widgets/dialogues.dart';
import 'package:track_flow/widgets/form_field.dart';

class FormScreen extends StatefulWidget {
  static const String routeName = '/FormScreen';

  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with WidgetsBindingObserver {
  TextEditingController emailidController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool loading = false;
  DateTime timeStamp = DateTime.now();
  String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  final EventLoggerController _eventLoggerController = EventLoggerController();

  List<String> fromAccount = [
    "State Bank",
    "Bank of Maharashtra",
    "Bank Of Baroda",
    "Axis bank of india",
  ];

  List<String> toAccount = [
    "State Bank",
    "Bank of Maharashtra",
    "Bank Of Baroda",
    "Axis bank of india",
  ];

  String? amountFrom;
  String? amountTo;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    analytics.logEvent(name: 'form_started');
    _eventLoggerController.logScreenEvent('FormScreen_started');
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is paused
      analytics.logEvent(name: 'form_paused');
    } else if (state == AppLifecycleState.resumed) {
      // App is resumed
      analytics.logEvent(name: 'form_resumed');
    } else if (state == AppLifecycleState.detached) {
      // App is detached
      analytics.logEvent(name: 'form_killed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5591F),
        title: const Text("Form Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDropdownField<String>(
                      items: fromAccount,
                      labelTxt: "From Account",
                      onChanged: (val) {
                        setState(() {
                          amountFrom = val;
                        });
                      },
                      value: amountFrom,
                      itemBuilder: (item) => Text(
                        item,
                      ),
                      hint: "From Account",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDropdownField<String>(
                      items: toAccount,
                      labelTxt: "To Account ",
                      onChanged: (val) {
                        setState(() {
                          amountTo = val;
                        });
                      },
                      value: amountTo,
                      itemBuilder: (item) => Text(
                        item,
                      ),
                      hint: "To Account",
                    ),
                    CustomFormField(
                      enabledBorder: InputBorder.none,
                      prefix: const Icon(
                        Icons.money,
                      ),
                      fillColor: Colors.white,
                      label: "Username",
                      labelColor: Colors.white,
                      border: AppDecoration.of(context).border2,
                      hint: "Amount",
                      controller: amountController,
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onEditDone: () {},
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      title: "Submit",
                      color: AppColor(context).secondary,
                      height: 40,
                      onTap: amountController.text.isEmpty ||
                              amountTo == null ||
                              amountFrom == null
                          ? null
                          : () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                loading = true;
                              });
                              formScreen(
                                context,
                                amountFrom.toString(),
                                amountTo.toString(),
                                amountController.text,
                                userId,
                                timeStamp.toString(),
                              ).then((success) {
                                if (success) {
                                  successDialog(
                                    context: context,
                                    title: "Success",
                                    message: "Success !",
                                  );
                                  amountController.clear();
                                  amountTo = null;
                                  amountFrom = null;
                                }
                              });
                              setState(() {
                                loading = false;
                              });
                            },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
