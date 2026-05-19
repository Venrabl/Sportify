// import 'package:flutter/material.dart';
// import '../widgets/bottom_nav.dart';

// class HomeDashboard extends StatelessWidget {
//   const HomeDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Welcome back, Ravi 👋'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Text('Upload/Record Test Video 🎥', style: TextStyle(fontSize: 22)),
//             SizedBox(height: 16),
//             Text('My Progress 📊', style: TextStyle(fontSize: 22)),
//             SizedBox(height: 16),
//             Text('Leaderboard 🏆', style: TextStyle(fontSize: 22)),
//             SizedBox(height: 16),
//             Text('Recommended Sports ⚽🏀🏋️', style: TextStyle(fontSize: 22)),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBar(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'screens/home.dart'; // <-- ye path tumhare project structure ke hisaab se adjust karo

void main() {
  runApp(const SportifyApp());
}

class SportifyApp extends StatelessWidget {
  const SportifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // top right me "DEBUG" hata dega
      title: 'Sportify App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // subtle grey bg
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E7D32), // dark green
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomeDashboard(), // <-- Ye tumhara screen open karega
    );
  }
}
