import 'dart:developer';

import 'package:shorebird_code_push/shorebird_code_push.dart';

final class AppUpdateUtility {
  static final shorebirdCodePush = ShorebirdCodePush();

  static Future<void> checkAppUpdate() async {
    log('Checking for app update...');
    try {
      final shorebirdAvailable = shorebirdCodePush.isShorebirdAvailable();
      final currentPatchNumber = await shorebirdCodePush.currentPatchNumber();

      final isUpdateAvailable =
          await shorebirdCodePush.isNewPatchAvailableForDownload();

      log('Shorebird available: $shorebirdAvailable, current patch number: $currentPatchNumber, update available: $isUpdateAvailable');

      if (isUpdateAvailable) {
        await shorebirdCodePush.downloadUpdateIfAvailable();
      }
    } catch (e) {
      log('Error checking for app update: $e');
    }
  }
}
