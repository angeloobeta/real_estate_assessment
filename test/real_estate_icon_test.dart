import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_assessment/resources/resources.dart';

void main() {
  test('real_estate_icon assets test', () {
    expect(File(RealEstateIcon.chatIcon).existsSync(), isTrue);
    expect(File(RealEstateIcon.heartIcon).existsSync(), isTrue);
    expect(File(RealEstateIcon.homeIcon).existsSync(), isTrue);
    expect(File(RealEstateIcon.profileIcon).existsSync(), isTrue);
    expect(File(RealEstateIcon.searchIcon).existsSync(), isTrue);
  });
}
