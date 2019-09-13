import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_nashik/models/social.model.dart';

class SocialItemWidget extends StatelessWidget {
  final SocialModel socialModel;

  SocialItemWidget(this.socialModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            socialModel.icon,
            SizedBox(
              height: 16,
            ),
//              Text(
//                socialModel.hint,
//                style: TextStyle(
//                    fontSize: 16, wordSpacing: 1.1, letterSpacing: 1.1),
//              )
          ],
        ),
      ),
    );
  }
}
