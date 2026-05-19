// import 'package:flutter_test/flutter_test.dart';
// import 'package:sportify_app/main.dart';

// void main() {
//   testWidgets('Dashboard shows main sections', (WidgetTester tester) async {
//     await tester.pumpWidget(const SportifyApp());

//     expect(find.text('Upload/Record Test Video 🎥'), findsOneWidget);
//     expect(find.text('My Progress 📊'), findsOneWidget);
//     expect(find.text('Leaderboard 🏆'), findsOneWidget);
//     expect(find.text('Recommended Sports ⚽🏀🏋️'), findsOneWidget);
//   });
// }
import 'package:flutter_test/flutter_test.dart';
import 'package:sportify_app/main.dart';

void main() {
  testWidgets('Onboarding -> Signup -> Dashboard flow smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SportifyApp());

    // Onboarding text present
    expect(find.text('Fair & cheat-proof evaluations.'), findsOneWidget);

    // navigate to sign up
    await tester.tap(find.text('Sign Up / Log In'));
    await tester.pumpAndSettle();

    // check Signup screen elements
    expect(find.text('Sign Up'), findsOneWidget);
  });
}
