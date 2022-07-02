import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dragonwareapp/Values/Colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Values/texttitle.dart';

class ContactState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactStateful();
}

class ContactStateful extends State<ContactState> {
  //form key
  final _formkey = GlobalKey<FormState>();

  // text for textfield
  String email = '';
  String name = '';
  String phone = '';
  String budget = '';
  String service = '';
  String requirement = '';
  String description = '';

  // textfield
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController BudgetController = TextEditingController();
  TextEditingController ServiceController = TextEditingController();
  TextEditingController RequirementController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  //Clearing Text
  _clearText() {
    NameController.clear();
    EmailController.clear();
    PhoneController.clear();
    BudgetController.clear();
    ServiceController.clear();
    RequirementController.clear();
    descriptionController.clear();
  }

  //Resigtering Users
  CollectionReference addUser =
      FirebaseFirestore.instance.collection('Contact');

  Future<void> _registerUser() {
    return addUser.add({
      'Name': name,
      'Email': email,
      'Phone': phone,
      'Service': service,
      'Budget': budget,
      'requirement': requirement,
      'description': description
    }).then((value) {
      print('Contact Added');
      successfullPopup(context, "Successful", "Contact Added Successfully", 'OK');
    }).catchError((_) => print('Something Error In registering Contact'));
  }

  //Disposing Textfield
  @override
  void dispose() {
    NameController.dispose();
    EmailController.dispose();
    PhoneController.dispose();
    BudgetController.dispose();
    ServiceController.dispose();
    RequirementController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      color: appMainColor,
      child: profileView(),
    ));
  }

  Widget profileView() {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Image.asset(
              'assets/images/logo.jpg',
            ),
          ),
          Text(
            'Get In Touch',
            style: Contacttitle,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(17.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1.0, 15.0),
                                blurRadius: 20.0,
                              ),
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextField(
                                            style: TextStyle(
                                                color: appMainColor,
                                                fontFamily: 'titlefont'),
                                            controller: NameController,
                                            decoration: InputDecoration(
                                              fillColor: appMainColor,
                                              enabledBorder:
                                                  new OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                borderSide: BorderSide(
                                                    color: appMainColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: appMainColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              labelText: 'Name',
                                              labelStyle: TextStyle(
                                                  color: appMainColor,
                                                  fontFamily: 'titlefont'),
                                            ),
                                            onChanged: (addresstext) {
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextField(
                                            style: TextStyle(
                                                color: appMainColor,
                                                fontFamily: 'titlefont'),
                                            controller: EmailController,
                                            decoration: InputDecoration(
                                              fillColor: appMainColor,
                                              enabledBorder:
                                                  new OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                borderSide: BorderSide(
                                                    color: appMainColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: appMainColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              labelText: 'Email',
                                              labelStyle: TextStyle(
                                                  color: appMainColor,
                                                  fontFamily: 'titlefont'),
                                            ),
                                            onChanged: (addresstext) {
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextField(
                                            style: TextStyle(
                                                color: appMainColor,
                                                fontFamily: 'titlefont'),
                                            controller: PhoneController,
                                            decoration: InputDecoration(
                                              fillColor: appMainColor,
                                              enabledBorder:
                                                  new OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                borderSide: BorderSide(
                                                    color: appMainColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: appMainColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              labelText: 'Phone',
                                              labelStyle: TextStyle(
                                                  color: appMainColor,
                                                  fontFamily: 'titlefont'),
                                            ),
                                            onChanged: (addresstext) {
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextField(
                                            style: TextStyle(
                                                color: appMainColor,
                                                fontFamily: 'titlefont'),
                                            controller: BudgetController,
                                            decoration: InputDecoration(
                                              fillColor: appMainColor,
                                              enabledBorder:
                                                  new OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                borderSide: BorderSide(
                                                    color: appMainColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: appMainColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              labelText: 'Budget',
                                              labelStyle: TextStyle(
                                                  color: appMainColor,
                                                  fontFamily: 'titlefont'),
                                            ),
                                            onChanged: (addresstext) {
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextField(
                                            style: TextStyle(
                                                color: appMainColor,
                                                fontFamily: 'titlefont'),
                                            controller: ServiceController,
                                            decoration: InputDecoration(
                                              fillColor: appMainColor,
                                              enabledBorder:
                                                  new OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                borderSide: BorderSide(
                                                    color: appMainColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: appMainColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              labelText: 'Service',
                                              labelStyle: TextStyle(
                                                  color: appMainColor,
                                                  fontFamily: 'titlefont'),
                                            ),
                                            onChanged: (addresstext) {
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextField(
                                            style: TextStyle(
                                                color: appMainColor,
                                                fontFamily: 'titlefont'),
                                            controller: RequirementController,
                                            decoration: InputDecoration(
                                              fillColor: appMainColor,
                                              enabledBorder:
                                                  new OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                borderSide: BorderSide(
                                                    color: appMainColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: appMainColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              labelText: 'Requirement',
                                              labelStyle: TextStyle(
                                                  color: appMainColor,
                                                  fontFamily: 'titlefont'),
                                            ),
                                            onChanged: (addresstext) {
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextField(
                                            style: TextStyle(
                                                color: appMainColor,
                                                fontFamily: 'titlefont'),
                                            controller: descriptionController,
                                            decoration: InputDecoration(
                                              fillColor: appMainColor,
                                              enabledBorder:
                                                  new OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                borderSide: BorderSide(
                                                    color: appMainColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: appMainColor,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              labelText: 'Description',
                                              labelStyle: TextStyle(
                                                  color: appMainColor,
                                                  fontFamily: 'titlefont'),
                                            ),
                                            onChanged: (addresstext) {
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                          child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              onPressed: () {
                                                // Navigator.pop(context);
                                                if (_formkey.currentState
                                                    .validate()) {
                                                  setState(() {
                                                    name = NameController.text;
                                                    email =
                                                        EmailController.text;
                                                    phone =
                                                        PhoneController.text;
                                                    budget =
                                                        BudgetController.text;
                                                    service =
                                                        ServiceController.text;
                                                    requirement =
                                                        RequirementController
                                                            .text;
                                                    description =
                                                        descriptionController
                                                            .text;

                                                    _registerUser();
                                                    _clearText();
                                                    // Navigator.pop(context);
                                                  });
                                                }
                                              },
                                              textColor: Colors.white,
                                              splashColor: appMainColor,
                                              color: appMainColor,
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 0, 5, 0),
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        color: appMainColor,
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 4, 4, 4),
                                                        child: Text(
                                                          'Submit',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  )))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  successfullPopup(
      BuildContext dialogContext, String title, String msg, String okbtn) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      overlayColor: Colors.black87,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      titleStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'titlefont'),
      descStyle: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'titlefont'),
      animationDuration: Duration(milliseconds: 400),
    );

    Alert(
        context: dialogContext,
        style: alertStyle,
        title: title,
        desc: msg,
        buttons: [
          DialogButton(
            child: Text(
              okbtn,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              if (!mounted) return;
              setState(() {
                //Your code
                Navigator.of(context, rootNavigator: true).pop();
              });
            },
            color: appMainColor,
          ),
        ]).show();
  }
}
