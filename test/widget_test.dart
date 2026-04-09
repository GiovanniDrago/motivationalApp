import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motivational_app/app_distribution.dart';

import 'package:motivational_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('shows localized home prompt in English', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const MotivationalApp(locale: Locale('en')));
    await tester.pumpAndSettle();

    expect(find.text('Tell me your name'), findsOneWidget);
    expect(find.text('Enter'), findsOneWidget);
  });

  testWidgets('shows dialog when the name is empty', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const MotivationalApp(locale: Locale('en')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Enter'));
    await tester.pumpAndSettle();

    expect(find.text('Idiot!'), findsOneWidget);
    expect(find.text('Enter your f*ucking name'), findsOneWidget);
  });

  testWidgets('navigates to the Italian answer screen', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const MotivationalApp(locale: Locale('it')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Mario');
    await tester.tap(find.text('Invia'));
    await tester.pumpAndSettle();

    expect(find.text('Vaffanculo Mario'), findsOneWidget);
  });

  testWidgets('loads the saved locale preference', (tester) async {
    SharedPreferences.setMockInitialValues({
      'preferred_locale_code': 'it',
    });

    await tester.pumpWidget(const MotivationalApp());
    await tester.pumpAndSettle();

    expect(find.text('Dimmi il tuo nome'), findsOneWidget);
    expect(find.text('Invia'), findsOneWidget);
  });

  testWidgets('shows the donation about dialog for the direct build', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      const MotivationalApp(
        locale: Locale('en'),
        distribution: AppDistributionConfig(
          channel: DistributionChannel.direct,
          aboutUrl: 'https://github.com/GiovanniDrago/motivationalApp',
          donationUrl: 'https://buymeacoffee.com/_takasu_',
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.more_vert_rounded));
    await tester.pumpAndSettle();
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    expect(find.text('Buy me a coffee'), findsOneWidget);
    expect(find.text('Open GitHub repo'), findsNothing);
  });

  testWidgets('shows the repository about dialog for the play build', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      const MotivationalApp(
        locale: Locale('en'),
        distribution: AppDistributionConfig(
          channel: DistributionChannel.play,
          aboutUrl: 'https://github.com/GiovanniDrago/motivationalApp',
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.more_vert_rounded));
    await tester.pumpAndSettle();
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    expect(find.text('Open GitHub repo'), findsOneWidget);
    expect(find.text('Buy me a coffee'), findsNothing);
  });
}
