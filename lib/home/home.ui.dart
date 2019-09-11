import 'package:flutter/material.dart';
import 'package:gdg_nashik/speakers/model/speaker.model.dart';
import 'package:gdg_nashik/speakers/widgets/speaker.item.dart';

class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  bool isDarkSelected = false;
  ThemeData lightTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue[987],
    accentColor: Colors.cyan[988],

    // Define the default font family.
    fontFamily: 'Montserrat',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );

  ThemeData darkTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.indigo[987],
    accentColor: Colors.red[988],

    // Define the default font family.
    fontFamily: 'Montserrat',
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.lightGreenAccent),
    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );

  List<SpeakerModel> speakers = [
    SpeakerModel(
        imagePath: "assets/userImages/member_287052152.jpeg",
        name: "Sagar",
        specializedIn: "GCP"),
    SpeakerModel(
        imagePath: "assets/userImages/man1.jpg",
        name: "Vivek",
        specializedIn: "Fluit"
            "ter"),
    SpeakerModel(
        imagePath: "assets/userImages/man1.jpg",
        name: "Vivek",
        specializedIn: "Fluit"
            "ter"),
    SpeakerModel(
        imagePath: "assets/userImages/man1.jpg",
        name: "Vivek",
        specializedIn: "Fluit"
            "ter"),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkSelected ? darkTheme : lightTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("GDG Nashik"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(isDarkSelected
                  ? Icons.invert_colors_off
                  : Icons.invert_colors),
              onPressed: () {
                isDarkSelected = !isDarkSelected;
                setState(() {});
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Text("Welcome to",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(
                height: 16,
              ),
              Text("GDG Nashik",
                  style: TextStyle(
                    fontSize: 32,
                  )),
              SizedBox(
                height: 24,
              ),
              Text("Event on: 31st August",
                  style: TextStyle(
                      fontSize: 16,
                      color: isDarkSelected ? Colors.amber : Colors.red)),
              SizedBox(
                height: 8,
              ),
              Text("Register by"),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.verified_user),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.verified_user),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.verified_user),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text("Speakers",
                  style: TextStyle(
                      fontSize: 16,
                      color: isDarkSelected ? Colors.amber : Colors.red)),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 175,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: speakers.length,
                  itemBuilder: (context, index) {
                    return SpeakerItem(speakers[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
