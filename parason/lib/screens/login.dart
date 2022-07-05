// import 'package:chat_app/pages/chat_welcome.dart';
import 'dart:convert';
// import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:parason/screens/home.dart';

import '../Widgets/beziercointainer.dart';
// import 'package:form_field_validator/form_field_validator.dart
// import '../pages/home.dart';
// import 'signup.dart';
// import 'package:chat_app/Widget/bezierContainer.dart';
// import 'package:chat_app/screens/signup_page.dart';
// import 'package:chat_app/Tabs/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
var user_name;
var pass_word;
 var value;
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // TextEditingController user_name = TextEditingController();
    // TextEditingController pass_word= TextEditingController();
    
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                // top: -height * .15,
                // right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 150),
                      // RichText(
                      //   textAlign: TextAlign.center,
                      //   text: const TextSpan(
                      //     text: 'GANGA VILAS',
                      //     style: TextStyle(
                      //       fontSize: 30,
                      //       fontWeight: FontWeight.w700,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/parason.png',
                              // height: 200,
                              // width: 300,
                              // fit: BoxFit.fitWidth
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 27, 76, 155),
                                      size: 30.0,
                                    ),
                                    
                                    // icon: Icon(Icons.person),
                                    
                                    hintText: ' User name',
                                    labelText: 'User Name*',
                                  ),
                                  // controller:user_name,
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      user_name = value;
                                      
                                      print("1111111111111111111111111111111111111111111111111111111111");
                                      print(user_name);
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.password_outlined,
                                      color: Color.fromARGB(255, 27, 76, 155),
                                      size: 30.0,
                                    ),
                                    // icon: Icon(Icons.person),
                                    hintText: 'enter password',
                                    labelText: 'Password',
                                  ),
                                  //  controller:pass_word,
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      pass_word = value;
                                      print("55555555555555555555555555555555555555555555555555555555555");
                                      print(pass_word);
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: const [
                              Color.fromARGB(255, 27, 76, 155),
                              Color.fromARGB(255, 27, 76, 155),
                            ],
                          ),
                        ),
                        child: InkWell(
                          
                          onTap: () {
                           
                            print("############################");
                            print(user_name);
                            print(pass_word);
                            loginapi(user_name, pass_word);
                            print("777777777777777777777777777777777777777777777777777");
                            
                            
                            // };
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
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
        ),
      ),
    );
  }

  loginapi(user_name, pass_word) async {
    print(user_name);
    print(pass_word);
    var v ;
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=gokul; sid=ed9ee6effb12b1ea001348f609c2824413d6a85c55a64c67419885ce; system_user=yes; user_id=gokul%40aerele.in; user_image='
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/parason.api.login'));
    request.body = json.encode({
      "usr": user_name,
      "pwd": pass_word,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

      v = jsonDecode(await response.stream.bytesToString())["message"];
          print("12222222222222222222222222222222222222222222222222222222");
          print(v);
          // setState(() {
          //   value=v;

          // });



          if (v["validator"] == "true") {
                              print("HHHHHHHHHHHHHHHHHHHHHHHHHHHh \n\n");
                              print(value);
                              print(MediaQuery.of(context).size.width);
                              print(MediaQuery.of(context).size.height);
                              print("object");
                              // if (user.toString() ==  "gokul" && password.toString() == "123"){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Homescreen(postData:v),
                                ),
                              );
                            }
    } else {
      
    }
  }
}
