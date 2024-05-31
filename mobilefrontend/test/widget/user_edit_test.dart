import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobilefrontend/user/model/update_user_model.dart';
import 'package:mobilefrontend/user/view/edit_profile.dart';

void main() {
  testWidgets('EditProfilePage UI Test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: EditProfilePage(
          initialData: UpdateUserDto(
            email: 'test@example.com',
            username: 'test_user',
            firstName: 'Test',
            lastName: 'User',
          ),
        ),
      ),
    );

    // Verify if the email TextFormField is present
    expect(find.byType(TextFormField),
        findsNWidgets(4)); // Assuming there are 4 TextFormField widgets

    // Verify if the update button is present
    expect(find.text('Update Profile'), findsOneWidget);

    // Tap the update button and trigger the updateProfile function
    await tester.tap(find.text('Update Profile'));
    await tester.pump();

    // You can add more test cases to validate different scenarios
  });
}
