import 'package:capoeirasport_project/src/features/capoeirasportapp/application/screens/capoeira_sport_app_screen.dart';
import 'package:capoeirasport_project/src/features/capoeirasportapp/application/utils/theme_details.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CapoeiraSportApp extends StatelessWidget {
  const CapoeiraSportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeDetails().themeDetails,
          home: const CapoeiraSportAppScreen(),
        );
      },
    );
  }
}
