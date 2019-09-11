import 'package:flutter/material.dart';
import 'package:gdg_nashik/speakers/model/speaker.model.dart';

class SpeakerItem extends StatelessWidget {
  final SpeakerModel speakerModel;

  SpeakerItem(this.speakerModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            speakerModel.imagePath,
            height: 100,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            speakerModel.name,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 8,
          ),
          Text(speakerModel.specializedIn)
        ],
      ),
    );
    ;
  }
}
