import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:identix_scan_apps/main.dart';
import 'package:identix_scan_apps/providers/settings_provider.dart';

void main() {
  testWidgets('IdenTixApp builds a MaterialApp', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final settingsProvider = SettingsProvider();
    await settingsProvider.init(checkConn: false);

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: settingsProvider,
        child: const IdenTixApp(),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
