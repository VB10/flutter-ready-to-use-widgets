import 'package:flutter/material.dart';

goToView(BuildContext context, Widget view) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => view));
}
