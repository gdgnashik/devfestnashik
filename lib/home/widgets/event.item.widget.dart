import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_nashik/models/event.model.dart';

class EventItemWidget extends StatelessWidget {
  final EventModel eventModel;

  EventItemWidget(this.eventModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
        margin: EdgeInsets.only(top: 4, bottom: 16, left: 4, right: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              eventModel.icon,
              SizedBox(
                height: 16,
              ),
              Text(
                eventModel.text,
                style: TextStyle(
                    fontSize: 16, wordSpacing: 1.1, letterSpacing: 1.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
