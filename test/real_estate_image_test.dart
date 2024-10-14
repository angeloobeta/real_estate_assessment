import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_assessment/resources/resources.dart';

void main() {
  test('real_estate_image assets test', () {
    expect(File(RealEstateImage.pexelsPixabay0).existsSync(), isTrue);
    expect(File(RealEstateImage.pexelsPixabay1).existsSync(), isTrue);
    expect(File(RealEstateImage.pexelsPixabay2).existsSync(), isTrue);
    expect(File(RealEstateImage.pexelsPixabay3).existsSync(), isTrue);
    expect(File(RealEstateImage.pexelsPixabay4).existsSync(), isTrue);
    expect(File(RealEstateImage.pexelsPixabay5).existsSync(), isTrue);
    expect(File(RealEstateImage.pexelsPixabay6).existsSync(), isTrue);
  });
}
