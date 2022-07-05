import 'package:flutter/material.dart';
import 'package:parason/main.dart';

List totallists=[{"LeaveType": "Sick","Days": "5","Dates": "12/4/22-13/4/22",},{"LeaveType": "sick","Days": "5","Dates": "12/4/22"},{"LeaveType": "sick","Days": "5","Dates": "12/4/22"},{"LeaveType": "sick","Days": "5","Dates": "12/4/22"}];
void main() {
  runApp( Leavelist());
}

class Leavelist extends StatelessWidget {
   
   Leavelist({Key? key}) : super(key: key);

  String dropdownvalue = 'month';   

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
      //     colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
              backgroundColor: Color.fromARGB(255, 209, 228, 234),

        appBar: AppBar(                    backgroundColor: Color(0xFF0066B8)
,
title: Container(
  margin: EdgeInsets.only(left:50),
  child: Image.asset('images/new.png'))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[



    Container(
           width: MediaQuery.of(context).size.width/1.02857,

           margin: EdgeInsets.only(left: 5,right: 5,top: 4),
           child: Card(
             
        
        child: Column(
          children: [
            Container(
                          margin: EdgeInsets.only(right: 230,top: 10),

                child: Column(
                  
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Leave list",style: TextStyle(
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
// Container(
//                   margin: EdgeInsets.only(left:20),
//                   child: DropdownButton(
                  
//               // Initial Value
//               value: dropdownvalue,
                  
//               // Down Arrow Icon
//               icon: const Icon(Icons.arrow_drop_down_sharp),    
                  
//               // Array list of items
//               items: items.map((String items) {
//                   return DropdownMenuItem(
//                     value: items,
//                     child: Text(items),
//                   );
//               }).toList(),
//               // After selecting the desired option,it will
//               // change button value to selected value
//               onChanged: (String? newValue) { 
//                   setState(() {
//                     dropdownvalue = newValue!;
//                   });
//               },
//             ),
//                 ),



              ],
            )
          ],
        )

      
             ),
         ),
            ElevatedCardExample(totallist: totallists),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class ElevatedCardExample extends StatelessWidget { final List totallist;
  
  const ElevatedCardExample({Key? key,required this.totallist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      


      child: ListView.builder(
        scrollDirection: Axis.vertical,
    shrinkWrap: true,
        itemCount: (totallist).length,
        itemBuilder: (BuildContext context,int index){
          return
        //    Container(
        // width: 400,
        // height: 100,
        // child:
         Container(
           margin: EdgeInsets.only(left:5,right: 5),
           child: Card(
        
        child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15,bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Text(totallists[index]["LeaveType"],style:TextStyle(
                                fontSize: MediaQuery.of(context).size.width/24,
                                color: Color.fromARGB(255, 11, 12, 12),
                              )),
                                              SizedBox(height: 10,),

                              Text(totallists[index]["Dates"],style:TextStyle(
                                fontSize: MediaQuery.of(context).size.width/24,
                                color: Color.fromARGB(255, 10, 12, 13),
                              ))
                    ],
                  ),
                ),

                Text(totallists[index]["Days"],style:TextStyle(
                              fontSize: MediaQuery.of(context).size.width/24,
                              color: Color.fromARGB(255, 16, 17, 19),
                            ))

              ],
            ),
        )

      
             ),
         );
      }    )
  
     , );
  }
}



