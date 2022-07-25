import 'package:flutter/material.dart';
import 'package:get/get.dart';

const ColorScheme _customColorScheme = ColorScheme(
  //primary color of appbar,buttons background,
  // when we beging to write in textfield its color and cursor color is primary

  primary: Colors.greenAccent,
  // primaryVariant: customMagenta600,
//secondary color is fab color
  secondary: Colors.amber,
  // secondaryVariant: customMagenta400,
  //for time picker
  surface: Colors.white,
  //to show background color of screen eg:all scaffold background color
  background: Colors.blue,
  error: Color.fromARGB(255, 223, 30, 30),
  onPrimary: Colors.white,
  //onsecondary is text on fab
  onSecondary: Colors.red,
  onSurface: Colors.black,
  onBackground: Colors.green,
  onError: Colors.redAccent,
  brightness: Brightness.light,
  tertiary: Color.fromARGB(255, 119, 156, 185),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //scaffold's color can be applied here
        // scaffoldBackgroundColor: Colors.red,
//toggle able active color eg;switch
        toggleableActiveColor: Colors.green,
        unselectedWidgetColor: Colors.purple,
        colorScheme: _customColorScheme,

        //--------------------text theme
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color.fromARGB(255, 97, 73, 73)),
          bodyText1: TextStyle(color: Color.fromARGB(255, 92, 67, 219)),

          button: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.black),

          ///color to write input field
          subtitle1: TextStyle(
              color: Color.fromARGB(255, 99, 227, 241)), // <-- that's the one

          // headline1: TextStyle(color: Color.fromARGB(255, 230, 92, 92)),
          // headline2: TextStyle(color: Color.fromARGB(255, 253, 6, 6)),
          // headline3: TextStyle(color: Color.fromARGB(255, 110, 27, 27)),
          // headline4: TextStyle(color: Color.fromARGB(255, 64, 39, 39)),
          // headline5: TextStyle(color: Color.fromARGB(255, 144, 14, 14)),
          // headline6: TextStyle(color: Color.fromARGB(0, 15, 179, 238)),
          headline1: TextStyle(color: Color.fromARGB(255, 230, 92, 92)),
          headline2: TextStyle(color: Color.fromARGB(255, 230, 92, 92)),
          headline3: TextStyle(color: Color.fromARGB(255, 230, 92, 92)),
          headline4: TextStyle(color: Color.fromARGB(255, 230, 92, 92)),
          headline5: TextStyle(color: Color.fromARGB(255, 230, 92, 92)),
          headline6: TextStyle(color: Color.fromARGB(255, 230, 92, 92)),
        ).apply(
          ///The displayColor is applied to
          /// [displayLarge],[displayMedium],[displaySmall],[headlineLarge],[headlineMedium],[bodySmall].
          //headlines 1,2,3,4 are showing red color and remaining green eg headline 5,6
          //display color for hour and minute in time picker widget
          bodyColor: Colors.green, displayColor: Colors.red,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          //fill color of textfield
          fillColor: Colors.white,
          //hint style in input fields
          hintStyle: TextStyle(color: Color.fromARGB(255, 205, 117, 111)),
          //is input field filled or not
          filled: true,
          //label color
          labelStyle: TextStyle(color: Colors.brown),
          //boder color
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 212, 124, 0)),
          ),
          //when we beging to write so that's focused then color of focused Border
          //then its size increases 10px
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan, width: 10),
          ),
        ),

        //---------------------------to change snakbar theme
        snackBarTheme: const SnackBarThemeData(
            contentTextStyle: TextStyle(color: Colors.red),
            actionTextColor: Colors.red,
            backgroundColor: Colors.white),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  double height = 0.0;
  double? width = 0.0;
  bool isSelected = false;

  String setTime = '', setDate = '';

  String _hour = '', _minute = '', _time = '';

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      // setState(() {
      //   selectedDate = picked;
      //   _dateController.text = DateFormat.yMd().format(selectedDate);
      // });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        timeController.text = _time;
        // _timeController.text = formatDate(
        //     DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
        //     [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch.adaptive(
                value: isSelected,
                onChanged: (selected) {
                  setState(() {
                    isSelected = selected;
                    debugPrint(isSelected.toString());
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            Radio(value: 'value', groupValue: 'value', onChanged: (v) {}),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: const Text('Date')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: const Text('Time')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'TextField theme',
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Password'),
              validator: (s) {
                if (s!.length < 5) {
                  return 'underFlow';
                }
                return null;
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Column(
            children: const [Text('demo')],
          )));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
