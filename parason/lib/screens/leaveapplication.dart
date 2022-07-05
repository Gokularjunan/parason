// import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class Leaveapplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, String> data;
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
                    alignment: Alignment.center, child: ElevatedCardExample()),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ElevatedCardExample extends StatelessWidget {
  get dropdownValue => "Two";

  bool value = false;
  @override
  Widget build(BuildContext context) {
    // final format =  DateFormat('yyyy-MM-dd');
    return Center(
      child: Container(
        width: 350,
        height: 700,
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
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: 350,
                height: 500,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 15,
                        ),
                        child: Text("Leave Application",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 13, 16, 18),
                                fontWeight: FontWeight.bold)),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outlined,
                            color: Color.fromARGB(255, 27, 76, 155),
                            size: 30.0,
                          ),
                          // icon: Icon(Icons.person),
                          hintText: ' User name',
                          labelText: 'User Name*',
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 27, 76, 155),
                            size: 30.0,
                          ),
                          // icon: Icon(Icons.person),
                          hintText: ' E-mail',
                          labelText: 'E-mail',
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,),
                        width: 350.0,
                        // child: DropdownButtonHideUnderline(

                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              color: Color.fromARGB(255, 27, 76, 155), size: 30,
                              //  color:Color.fromARGB(255, 27, 76, 155)
                            ),
                          ),

                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),

                          elevation: 16,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 115, 109, 126),fontSize: 17),
                          // underline: Container(
                          //   height: 2,
                          //   color: Colors.deepPurpleAccent,
                          // ),
                          onChanged: (String? newValue) {},
                          items: <String>['Leave Type', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        // ),
                      ),
                      // Container(
                          //  margin: EdgeInsets.only(top: 1),
                          // child:
                           Column(
                        children: [BasicDateField1(), BasicDateField2()],
                      ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            // SizedBox(
                            
                            // ), //SizedBox
                             //Text
                            // SizedBox(width: 2), //SizedBox
                            /** Checkbox Widget **/
                            Checkbox(
                              value: value,
                              onChanged: (bool? Value) {
                                value = Value!;
                              },
                            ),
                            Text(
                              'HalfDay ',
                              style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 141, 124, 124)),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                      color: Color.fromARGB(255, 81, 75, 75),thickness: .7,
                      
                    ),

                      Container(
                        margin: EdgeInsets.only(left: 2),
                        child: TextField(
                          decoration: const InputDecoration(
                            // prefixIcon:  Icon(
                            //                                   Icons.email_rounded,
                            //                                   color:Color.fromARGB(255, 27, 76, 155),
                            //                                 size: 30.0,
                            //                                 ),
                            // icon: Icon(Icons.person),
                            hintText: '    Reason',
                            labelText: '     Reason',
                          ),
                          // onSaved: (String? value) {
                          //   // This optional block of code can be used to run
                          //   // code when the user saves the form.
                          // },
                          // validator: (String? value) {
                          //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
                width:10,
                height: 30),
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
                                color: Color.fromARGB(255, 144, 141, 141),
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
                           
                            
                            
                            // };
                          },
                          child: Text(
                            'Submit',
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

      
    );
  }
}

class BasicDateField1 extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // Text('(${format.pattern})'),
      DateTimeField(
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.date_range_outlined,
            color: Color.fromARGB(255, 27, 76, 155),
            size: 30.0,
          ),
          // icon: Icon(Icons.person),
          hintText: ' from Date',
          labelText: 'From Date',
        ),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              // fieldLabelText:"from date",
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class BasicDateField2 extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // Text('(${format.pattern})'),
      DateTimeField(
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.date_range_outlined,
            color: Color.fromARGB(255, 27, 76, 155),
            size: 30.0,
          ),
          // icon: Icon(Icons.person),
          hintText: ' To Date',
          labelText: 'To Date',
        ),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              // fieldLabelText:"from date",
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}
