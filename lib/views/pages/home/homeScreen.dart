import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> locations = [
      "Moskovskiy 12, ",
      "Gladkova St., 25",
      "Novocherkasskaya St. 11",
      "67 Obukhovskay Obarany Ave",
      "2nd Zunch Str.",
      "Zolnaya St.",
      "Shaumyana Ave St. 4"
    ];
    return BaseUi(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              hexColor('F8F8F8'),
              hexColor('F8F3ED'),
              hexColor('F9EBDE'),
              hexColor('F9E8D5'),
              hexColor('F9DEBE'),
              hexColor('F9D7AE'),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 45.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            color: hexColor('FFFFFF'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          padding: EdgeInsets.all(8.r),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                GeneralIconDisplay(Icons.location_on,
                                    hexColor('A4957E'), UniqueKey(), 16),
                                3.horizontalSpace,
                                generalTextDisplay(
                                    "Saint Petersburg",
                                    hexColor('A4957E'),
                                    12,
                                    FontWeight.w500,
                                    1,
                                    '')
                              ],
                            ),
                          ),
                        ).animate().slideX(begin: -1),
                        CircularContainer(
                          backgroundColor: hexColor('E49433'),
                          child: Image.asset(
                            AppImage.profileImage,
                            fit: BoxFit.scaleDown,
                          ),
                        ).animate().scale(),
                      ],
                    ),
                    20.verticalSpace,
                    generalTextDisplay("Hi Marina", hexColor('A4957E'), 20,
                        FontWeight.w500, 1, ''),
                    generalTextDisplay("let's select your\nperfect place",
                            Colors.black, 24, FontWeight.w400, 2, '')
                        .animate()
                        .slideY(begin: 0.5),
                    35.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: LayoutBuilder(builder: (context, constraints) {
                            return RealEstateDisplayType(
                              estateType: RealEstateType.buy,
                              height: constraints.maxWidth,
                            );
                          }),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return RealEstateDisplayType(
                                estateType: RealEstateType.rent,
                                height: constraints.maxWidth,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              30.verticalSpace,
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: ShapeDecoration(
                  color: hexColor('FFFFFF'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w + 8.r),
                  ),
                ),
                child: Column(
                    children: List.generate(
                        RealEstateImage.values.length,
                        (index) => Column(
                              children: [
                                ImageContainer(
                                  image: RealEstateImage.values[index],
                                  location: locations[index],
                                ),
                                8.verticalSpace,
                                Row(
                                  children: [
                                    Expanded(
                                      child: ImageContainer(
                                        image: RealEstateImage.values[index],
                                        location: locations[index],
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Expanded(
                                      child: ImageContainer(
                                        image: RealEstateImage.values[index],
                                        location: locations[index],
                                      ),
                                    ),
                                  ],
                                ),
                                8.verticalSpace,
                              ],
                            ))),
              ).animate().moveY(begin: 400, duration: 0.6.seconds),
            ],
          ),
        ),
      ),
    );
  }
}
