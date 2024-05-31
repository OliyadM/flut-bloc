import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flut_bloc/src/screens/login_page.dart'; // Adjust the import path to match your project structure

void main() {
  testWidgets('Login Page has email and password fields and a login button', (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that the email field is present
    expect(find.byKey(Key('emailField')), findsOneWidget);

    // Verify that the password field is present
    expect(find.byKey(Key('passwordField')), findsOneWidget);

    // Verify that the login button is present
    expect(find.byKey(Key('loginButton')), findsOneWidget);
  });

  testWidgets('Login button triggers login function', (WidgetTester tester) async {
    // Create a mock function
    bool loginCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: LoginPage(
        onLogin: () {
          loginCalled = true;
        },
      ),
    ));

    // Enter text in the email and password fields
    await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(Key('passwordField')), 'password');

    // Tap the login button
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pump();

    // Verify that the login function was called
    expect(loginCalled, isTrue);
  });
}
