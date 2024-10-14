import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_assessment/resources/resources.dart';

void main() {
  test('app_image assets test', () {
    expect(File(AppImage.mapImage).existsSync(), isTrue);
    expect(File(AppImage.profileImage).existsSync(), isTrue);
  });
}
