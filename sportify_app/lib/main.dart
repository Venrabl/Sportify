// import 'package:flutter/material.dart';
// import 'screens/onboarding.dart';

// void main() {
//   runApp(const SportifyApp());
// }

// class SportifyApp extends StatelessWidget {
//   const SportifyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sportify App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const OnboardingScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'screens/onboarding.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.initHive(); // local storage init
  runApp(const SportifyApp());
}

class SportifyApp extends StatelessWidget {
  const SportifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportify',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
