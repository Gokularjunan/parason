import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:parason/main.dart';
import 'package:parason/screens/leaveapplication.dart';

import 'attendencelist.dart';
import 'leavelist.dart';
import 'locator.dart';
Position? _currentPosition;
class Homescreen extends StatefulWidget {
  final postData;
  const Homescreen({ Key? key,required this.postData}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState(postData);
}
var data;
class _HomescreenState extends State<Homescreen> {
  _HomescreenState(postData)
  {data=postData;}

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 228, 234),
      appBar: AppBar(
          backgroundColor: Color(0xFF0066B8),
          title: Image.asset('images/new.png')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    child: ElevatedCardExample(
                      data: {"name": data["first_name"], "dept": "Department","email":data["email"]},
                    )),
                Container(
                    alignment: Alignment.center,
                    child: ElevatedCard2Example(
                      data: const {"text3": "Leave Balance", "text4": ["LeaveType1" ,"10","LeaveType2","20"],}
                    )),
                    Container(
                    alignment: Alignment.center,
                    child: ElevatedCard3Example(data: null,)
                    ),
                
              ],
            ),
          ),
          Container(
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Color(0xFF0066B8),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(1.0))),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle:  TextStyle(
                      fontSize: MediaQuery.of(context).size.width/18,
                      color: Color.fromARGB(255, 228, 18, 18),
                    ),
                  ),
                  onPressed: () {
Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Leaveapplication(),
                              ),
                            );


                  },
                  child:  Text(
                    'Apply Leave',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/18,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle:  TextStyle(
                      fontSize: MediaQuery.of(context).size.width/18,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Locator(),
                              ),
                            );
                    // _getCurrentLocation();
                    // _showToast(context);
                  },
                  child:  Text(
                    'Check in/out',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/18,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ), // IconButton(icon: Icon(Icons.arrow_downward), onPressed: (){},),
              ],
            ),
          )
        ],
      ),
    );
  }
}
_getCurrentLocation() {
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high, forceAndroidLocationManager: true)
      .then((Position position) {
        print(position);
          _currentPosition = position;
      }).catchError((e) {
        print(e);
      });
  }



void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      (_currentPosition ==null) ?

      SnackBar(
        content:  Text('"LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"'),
        action: SnackBarAction(label: 'MARKED', onPressed: scaffold.hideCurrentSnackBar),
                backgroundColor: Colors.blueGrey,
      ):
      SnackBar(
        content:  Text('no Loction'),
        action: SnackBarAction(label: 'MARKED', onPressed: scaffold.hideCurrentSnackBar),
                backgroundColor: Colors.blueGrey,
      )
    );
  }

class ElevatedCardExample extends StatelessWidget {
  var data;

  ElevatedCardExample({required this.data});

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/90),
        // width: 350,
        width: MediaQuery.of(context).size.width/1.02857,
        height: MediaQuery.of(context).size.height/6.4,
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 161, 170, 173).withOpacity(.5),
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: 1,
            height: 250,
            child: Container(
              margin: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [Row(
                    
                    children: [
                      SizedBox(
                      width: 10,
                      height: 40,
                    ),
                     Image.asset('images/1.png',width: 25,height: 25),
                     SizedBox(
                      width: 10,
                      height: 40,
                    ),

                     Text(
                       
                        data["name"],
                        style: TextStyle(
                          // fontFamily:"Raleway",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,

                          color: Color.fromARGB(255, 8, 8, 8),
                        ),
                      ),],),
Row(
  children: [

                      SizedBox(
                      width: 10,
                      height: 20,
                    ),
                                         Image.asset('images/dept4.png',width: 25,height: 25),
                                         SizedBox(
                      width: 10,
                      height: 20,
                    ),

                     Text(
                        data["dept"],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/24,
                          color: Color.fromARGB(255, 16, 16, 17),
                        ),
                      ),],),
Row(
  children: [

                      SizedBox(
                      width: 10,
                      height: 10,
                    ),Image.asset('images/emaill.png',width: 25,height: 25),
                                         SizedBox(
                      width: 10,
                      height: 40,
                    ),
                     Text(
                        data["email"],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/24,
                          color: Color.fromARGB(255, 21, 29, 37),
                        ),
                      ),
                    ],
                  ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class ElevatedCard2Example extends StatelessWidget {
  var data;

  ElevatedCard2Example({required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width/1.02857,
        height: MediaQuery.of(context).size.height/8.88,
        // height: 90,

        
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: 1,
            height: 200,
            child: Container(
              margin: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.width/180,
                              horizontal: 5,
                            ),
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [Row(
                    
                    children: [
                      SizedBox(
                      width: 10,
                      height: 40,
                    ),
                     Text(
                        data["text3"],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),],),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Container(
                            margin: EdgeInsets.only(left: 10,top:5),
                            child: Text("Casual Leave Balance",style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width/24,
                            color: Color.fromARGB(255, 16, 17, 17),
                        ),),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 25),
                            child: Text("5"))
                        ],

                      ),

  

                      ],),)
                  // ],
                )),
          ),
        );
      // ),
    // );
  }
}
class ElevatedCard3Example extends StatelessWidget {
  var data;

  ElevatedCard3Example({required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width/1.02857,
        height: MediaQuery.of(context).size.height/6.15,
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 161, 170, 173).withOpacity(.5),
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: 1,
            height: 200,
            child: Container(
              margin: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.width/72,
                              horizontal: 5,
                            ),
                // alignment: Alignment.bottomLeft,
                child: Column(
                  children: [Row(
                    
                    children: [
                      SizedBox(
                      width: 10,
                      height: 1,
                    ),

 Image.asset('images/attendence.png',width: 20,height: 20),
 SizedBox(
                      width: 5,
                      height: 10,
                    ),

                   
                    TextButton(
                  style: TextButton.styleFrom(
                    textStyle:  TextStyle(
                      fontSize: MediaQuery.of(context).size.width/18,
                      color: Color.fromARGB(255, 228, 18, 18),
                    ),
                  ),
                  onPressed: () {
Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Attendencelist(),
                              ),
                            );
                  },
                  child: 
                   Text(
                    'Attendence List',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/24,
                          color: Color.fromARGB(255, 9, 9, 10),
                    ),
                  ),
                ),

                Container(
  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/3),
  child:   IconButton(
    onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Attendencelist(),
                              ),
                            );
        //action coe when button is pressed
    }, 
    icon: Icon(Icons.arrow_forward_ios
    ,                                    size: 15.0,
),
  ),
)
],),
Divider(
                  color: Color.fromARGB(255, 122, 118, 118),indent: 42,
                  
                ),

Row(
  children: [

                      SizedBox(
                      width: 10,
                      height: 5,
                    ),
                     
Image.asset('images/attendence.png',width: 20,height: 20),
SizedBox(
                      width: 5,
                      height: 5,
                    ),

TextButton(
                  style: TextButton.styleFrom(
                    textStyle:  TextStyle(
                      fontSize: MediaQuery.of(context).size.width/18,
                      color: Color.fromARGB(255, 228, 18, 18),
                    ),
                  ),
                  onPressed: () {
Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Leavelist(),
                              ),
                            );


                  },
                  child:  Text(
                    'Leave list',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/24,
                          color: Color.fromARGB(255, 10, 11, 11),
                    ),
                  ),
                ),

Container(
  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/2.25),
  child:   IconButton(
    onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Leavelist(),
                              ),
                            );
        //action coe when button is pressed
    }, 
    icon: Icon(Icons.arrow_forward_ios
    ,                                    size: 15.0,
),
  ),
)


                    ],
                  ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}