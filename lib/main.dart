//@dart=2.9
// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// ignore: prefer_const_constructors
import 'package:splashscreen/splashscreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 14,
        navigateAfterSeconds: AfterSplash(),
        title: const Text(
          'Welcome WishTree',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: const TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}

class AfterSplash extends StatefulWidget {
  @override
  State<AfterSplash> createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Welcome to WishTree"),
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 12.0, 10, 10),
        child: Column(
          children: [
            Container(
              height: 100,
              // ignore: prefer_const_constructors
              child: Card(
                elevation: 8,
                child: const ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('Person Name '),
                  subtitle: Text("Person event details"),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 30),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          label: const Text('Add Event'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

class addEventpage extends StatefulWidget {
  @override
  State<addEventpage> createState() => _addEventpageState();
}

class _addEventpageState extends State<addEventpage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  var selectedValue;
  List<String> items = [
    'Anniversary',
    'Birthday',
    'Regular Wish',
    'Official',
  ];

  void _presentDatePicker() async {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
        print(_selectedDate);
      });
    });
  }

  _selectTime(BuildContext context) async {
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        print(selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
            title: Center(child: const Text("Add Event")),
            automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                const TextField(
                  // ignore: unnecessary_const
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10), // Added this
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  // ignore: unnecessary_const
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10), // Added this
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Event Type',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        print("selectedValue");
                        print(selectedValue);
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.blue,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 40,
                    // buttonWidth: 200,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    buttonElevation: 10,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 200,
                    // dropdownPadding: EdgeInsets.only(left: 20),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(0, 0),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            " ${_selectedDate.year} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(
                            " ${_selectedDate.month} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(
                            " ${_selectedDate.day} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: _presentDatePicker,
                        child: const Text('Select Date')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            " ${selectedTime.hour} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(
                            " ${selectedTime.minute} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(
                            "(IST)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _selectTime(context);
                      },
                      child: Text("Select Time"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: Text(
                      "Save Event",
                    ),
                    onPressed: () {
                      print("save button pressed");
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => addEventpage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
