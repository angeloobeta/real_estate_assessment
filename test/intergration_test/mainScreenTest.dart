import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_assessment/main.dart' as entryPoint;
import 'package:real_estate_assessment/views/main/main.dart';
import 'package:real_estate_assessment/views/reusableWidgets/home/bottomNavBar.dart';

void main() {
  testWidgets('Integration Test', (WidgetTester tester) async {
    // Build the app and trigger frame rendering
    entryPoint.main();
    await tester.pumpAndSettle();

    // Verify that the Real Estate MainScreen Screen is rendered
    expect(find.byType(MainScreen), findsOneWidget);

    // Verify that the BottomNavBar widget is rendered
    final bottomNavBarFinder = find.byType(BottomNavBar);
    expect(bottomNavBarFinder, findsOneWidget);
  });
}
