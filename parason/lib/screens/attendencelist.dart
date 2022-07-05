import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parason/main.dart';
import 'package:http/http.dart' as http;
List totallist=[{"Days": "Monday","Status": "Present","Date": "12/4/22",},{"Days": "Monday","Status": "Absent","Date": "12/4/22"},{"Days": "Monday","Status": "Present","Date": "12/4/22",},{"Days": "Monday","Status": "Absent","Date": "12/4/22"},{"Days": "Monday","Status": "Present","Date": "12/4/22",},{"Days": "Monday","Status": "Absent","Date": "12/4/22"}];
void main() {
runApp( Attendencelist());
}

class Attendencelist extends StatefulWidget {
Attendencelist({ Key? key }) : super(key: key);
// String dropdownvalue = 'month'; 
@override
  void initState() {
print("3333333333333333333333333333333333333333333333333333333333333");
    attendance_listapi();


  }
@override
State<Attendencelist> createState() => _AttendencelistState();
}

class _AttendencelistState extends State<Attendencelist> {
String dropdownvalue = 'month'; 
@override
  void initState() {
    print("3333333333333333333333333333333333333333333333333333333333333");
    attendance_listapi();
  }
  
@override
Widget build(BuildContext context) {
var items = [ 
'month',
'jan',
'feb',
'march',
'April',
]; 
return MaterialApp(
// theme: ThemeData(
// colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
home: Scaffold(
backgroundColor: Color.fromARGB(255, 209, 228, 234),

appBar: AppBar( backgroundColor: Color(0xFF0066B8)
,
title: Container(
margin: EdgeInsets.only(left: 50),
child: Image.asset('images/new.png'))),
body: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[

Container(
width: MediaQuery.of(context).size.width/1.02857,

margin: EdgeInsets.only(left: 5,right: 5,top: 4),
child: Card(
child: Column(
children: [
Container(
margin: EdgeInsets.only(right:180,top: 10,),

child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text("Attendence List",style: TextStyle(
fontSize: MediaQuery.of(context).size.width/18,
fontWeight: FontWeight.w600,
color: Color.fromARGB(255, 2, 2, 2),
),)
],
),
),
Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Container(
margin: EdgeInsets.only(left:15),
child: DropdownButton(
// Initial Value
value: dropdownvalue,
// Down Arrow Icon
icon: const Icon(Icons.arrow_drop_down_sharp), 
// Array list of items
items: items.map((String items) {
return DropdownMenuItem(
value: items,
child: Text(items),
);
}).toList(),
// After selecting the desired option,it will
// change button value to selected value
onChanged: (String? newValue) { 
setState(() {
dropdownvalue = newValue!;
});
},
),
),

],
)
],
)

),
),


ElevatedCardExample(totallist: totallist),
Spacer(),
],
),
),
);
}
// void setState(Null Function() param0) {}
}
class ElevatedCardExample extends StatelessWidget { final List totallist;
const ElevatedCardExample({Key? key,required this.totallist}) : super(key: key);

@override
Widget build(BuildContext context) {
return Center(

child: ListView.builder(
scrollDirection: Axis.vertical,
shrinkWrap: true,
itemCount: (totallist).length,
itemBuilder: (BuildContext context,int index){
return 
Container(
margin: EdgeInsets.only(left: 5,right: 5),
child: Card(
child: Container(
margin: EdgeInsets.only(right: 10),

child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Container(
margin: EdgeInsets.only(left: 10,bottom: 12),

child: Column(
children: [
SizedBox(height: 15,),
Text(totallist[index]["Days"],style:TextStyle(
fontSize: MediaQuery.of(context).size.width/24,
color: Color.fromARGB(255, 7, 8, 8),
)),
SizedBox(height: 10,),

Text(totallist[index]["Date"],style:TextStyle(
fontSize: MediaQuery.of(context).size.width/24,
color: Color.fromARGB(255, 6, 7, 8),
))
],
),
),
totallist[index]["Status"]=="Present"?
Container(
width:70,
// color:
// totallist[index]["Status"]=="Present" ? Color:(Colors.blue) : Color(Colors.amber),
decoration: BoxDecoration(color: Color(0xFFCDFFE4),shape:
BoxShape.rectangle,border: Border.all(
color: Colors.green,
width: 0.1
), //Border.all
borderRadius: BorderRadius.circular(20),),
child: Center(child: 
Text(totallist[index]["Status"],style:TextStyle(
fontSize: MediaQuery.of(context).size.width/24,
color: Color(0xFF63CC97),
)),),
):
Container(
width:70,
// color:
// totallist[index]["Status"]=="Present" ? Color:(Colors.blue) : Color(Colors.amber),
decoration: BoxDecoration(color:Color(0xFFFFD7CF),shape:
BoxShape.rectangle,border: Border.all(
color: Color.fromARGB(255, 255, 139, 139),
width: 0.1
), //Border.all
borderRadius: BorderRadius.circular(15),),
child: Center(child: 
Text(totallist[index]["Status"],style:TextStyle(
fontSize: MediaQuery.of(context).size.width/24,
color: Color(0xFFCE6A58),
)),),
)

],
),
)

),
);
} )
, );
}
}
attendance_listapi()
async {
  var a;
  print("1111111111111111111111111111111111");
var headers = {
'Authorization': 'token 46e80a0a1f34761:91385cde6da3e59',
'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
};
  print("12111111111111111111111111111111111");


var request = http.Request('GET', Uri.parse('http://test_senbagam.aerele.in/api/method/parason.api.attendance_list'));
  print("1311111111111111111111111111111111");

request.headers.addAll(headers);
  print("1411111111111111111111111111111111");

http.StreamedResponse response = await request.send();
  print("1511111111111111111111111111111111");

if (response.statusCode == 200) {
    print("1611111111111111111111111111111111");

a=jsonDecode(await response.stream.bytesToString())["message"];
print("99999999999999999999999999999999999999999999999999999999999999999999999999");
print (a);
}
else {
print(response.reasonPhrase);
}
}



