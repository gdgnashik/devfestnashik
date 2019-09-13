import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdg_nashik/home/widgets/event.item.widget.dart';
import 'package:gdg_nashik/home/widgets/social.item.widget.dart';
import 'package:gdg_nashik/speakers/model/speaker.model.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

import 'model/event.model.dart';
import 'model/social.model.dart';

class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  List<EventModel> events;

  List<SocialModel> socialOptions;

  void openAgenda() {}

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
//    textTheme: TextTheme(
//      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//    ),
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
//    textTheme: TextTheme(
//      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//    ),
  );

  List<SpeakerModel> speakers = [
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
    SpeakerModel(
        imagePath: "assets/userImages/man1.jpg",
        name: "Vivek",
        specializedIn: "Fluit"
            "ter"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    events = [
      EventModel(
          icon: Icon(Icons.access_time, color: Colors.deepOrange),
          onClick: openAgenda,
          text: "Agenda"),
      EventModel(
          icon: Icon(Icons.person, color: Colors.green),
          onClick: openAgenda,
          text: "Speaker"),
      EventModel(
          icon: Icon(Icons.group, color: Colors.yellow),
          onClick: openAgenda,
          text: "Team"),
      EventModel(
          icon: Icon(Icons.attach_money, color: Colors.purple),
          onClick: openAgenda,
          text: "Sponsors"),
      EventModel(
          icon: Icon(Icons.map, color: Colors.blue),
          onClick: openAgenda,
          text: "Locate us"),
      EventModel(
          icon: Icon(Icons.person_add, color: Colors.pinkAccent),
          onClick: openAgenda,
          text: "Registration"),
    ];
    socialOptions = [
      SocialModel(
          icon: Icon(GroovinMaterialIcons.google_chrome,
              color: Theme.of(context).dividerColor),
          onClick: openAgenda,
          hint: "Open chrome"),
      SocialModel(
          icon: Icon(GroovinMaterialIcons.facebook,
              color: Theme.of(context).dividerColor),
          onClick: openAgenda,
          hint: "Open facebook"),
      SocialModel(
          icon: Icon(GroovinMaterialIcons.twitter,
              color: Theme.of(context).dividerColor),
          onClick: openAgenda,
          hint: "Open twitter"),
      SocialModel(
          icon: Icon(GroovinMaterialIcons.linkedin,
              color: Theme.of(context).dividerColor),
          onClick: openAgenda,
          hint: "Open linkedin"),
      SocialModel(
          icon: Icon(GroovinMaterialIcons.youtube,
              color: Theme.of(context).dividerColor),
          onClick: openAgenda,
          hint: "Open youtube"),
      SocialModel(
          icon: Icon(GroovinMaterialIcons.medical_bag,
              color: Theme.of(context).dividerColor),
          onClick: openAgenda,
          hint: "Open meetup"),
      SocialModel(
          icon: Icon(GroovinMaterialIcons.email,
              color: Theme.of(context).dividerColor),
          onClick: openAgenda,
          hint: "Open email"),
    ];
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
                height: MediaQuery.of(context).size.height / 3.5,
                child: SvgPicture.asset(
                  "assets/images/devfest_img.svg",
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Welcome to DevFest Nashik",
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 48),
                crossAxisCount: 3,
                childAspectRatio: 1.1,
                shrinkWrap: true,
                children: List<Widget>.generate(events.length, (index) {
                  return EventItemWidget(events[index]);
                }),
              ),
              Wrap(
                children: List<Widget>.generate(socialOptions.length, (index) {
                  return SocialItemWidget(socialOptions[index]);
                }),
              ),
              Text(
                "#DevFestNashik",
                style: TextStyle(color: Colors.blueAccent, fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "version: 1.0.0",
                style: TextStyle(color: Colors.blueGrey, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
