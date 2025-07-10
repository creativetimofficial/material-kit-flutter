import 'package:flutter/material.dart';

// screens
import 'package:material_kit_flutter/screens/home.dart';
import 'package:material_kit_flutter/screens/profile.dart';
import 'package:material_kit_flutter/screens/settings.dart';
import 'package:material_kit_flutter/screens/components.dart';
import 'package:material_kit_flutter/screens/onboarding.dart';
import 'package:material_kit_flutter/screens/pro.dart';

void main() => runApp(MaterialKitPROFlutter());

class MaterialKitPROFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Material Kit PRO Flutter",
        debugShowCheckedModeBanner: false,
        initialRoute: "/onboarding",
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/pro": (BuildContext context) => new Pro(title: "Material Kit PRO"),
          "/home": (BuildContext context) => new Home(),
          "/components": (BuildContext context) => new Components(),
          "/profile": (BuildContext context) => new Profile(),
          "/settings": (BuildContext context) => new Settings(),
          "/woman": (BuildContext context) => new Pro(title: "Woman"),
          "/man": (BuildContext context) => new Pro(title: "Man"),
          "/kids": (BuildContext context) => new Pro(title: "Kids"),
          "/newcollection": (BuildContext context) => new Pro(title: "New Collection"),
          "/signin": (BuildContext context) => new Pro(title: "Sign In"),
          "/signup": (BuildContext context) => new Pro(title: "Sign Up"),
        });
  }
}
