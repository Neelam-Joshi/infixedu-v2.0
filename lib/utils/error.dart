// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:infixedu/config/app_config.dart';
import 'package:infixedu/utils/fontconstant/constant.dart';

class ErrorPage extends StatefulWidget {

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child:
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                  //   image: DecorationImage(
                  // image: AssetImage(AppConfig.loginBackground),
                  // fit: BoxFit.fill),
                    color:Color(0xffFDFFBB),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          offset:Offset(2,2),
                          color: Colors.black12
                      )
                    ]
                ),
                child: Container(
                    margin: const EdgeInsets.only(bottom:10),
                    height: MediaQuery.of(context).size.height * 0.40,
                    decoration: BoxDecoration(
                      color:Color(0xffBCF0ff),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),

                    ),
                    child:Container(
                      margin: const EdgeInsets.only(bottom:10),
                      height: MediaQuery.of(context).size.height * 0.40,
                      decoration: BoxDecoration(
                        color:Color(0xffffffff),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child:Center(
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppConfig.appLogo),
                              )),
                        ),
                      ),
                    )

                ),

              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.3,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage(AppConfig.loginBackground),
              //         fit: BoxFit.fill,
              //       ),
              //       boxShadow: [
              //         BoxShadow(
              //             blurRadius: 5,
              //             offset:Offset(2,2),
              //             color: Colors.black12
              //         )
              //       ]
              //   ),
              //   // child: Center(
              //   //   child: Container(
              //   //     height: 150.0,
              //   //     width: 150.0,
              //   //     decoration: BoxDecoration(
              //   //         image: DecorationImage(
              //   //           image: AssetImage(AppConfig.appLogo),
              //   //         )),
              //   //   ),
              //   // ),
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.3,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage(AppConfig.loginBackground),
              //         fit: BoxFit.fill,
              //       ),
              //       boxShadow: [
              //         BoxShadow(
              //             blurRadius: 5,
              //             offset:Offset(2,2),
              //             color: Colors.black12
              //         )
              //       ]
              //   ),
              //   // child: Center(
              //   //   child: Container(
              //   //     height: 150.0,
              //   //     width: 150.0,
              //   //     decoration: BoxDecoration(
              //   //         image: DecorationImage(
              //   //           image: AssetImage(AppConfig.appLogo),
              //   //         )),
              //   //   ),
              //   // ),
              // ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Invalid Purchase. Please activate from your server.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 24.0,
                            fontFamily: sansBold,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
