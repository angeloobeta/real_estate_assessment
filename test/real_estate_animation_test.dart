import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_assessment/resources/resources.dart';

void main() {
  test('real_estate_animation assets test', () {
    expect(File(RealEstateAnimation.chatting).existsSync(), isTrue);
    expect(File(RealEstateAnimation.favourite).existsSync(), isTrue);
    expect(File(RealEstateAnimation.profile).existsSync(), isTrue);
  });
}
