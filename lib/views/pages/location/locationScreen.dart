import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationScreen> {
  ValueNotifier<bool> onClicked = ValueNotifier(false);

  Duration duration = 0.5.seconds;

  @override
  void dispose() {
    onClicked.dispose();
    super.dispose();
  }

  List<List<dynamic>> optional = [
    [
      "Cosy Areas",
      Icon(Icons.verified_user, color: hexColor("8C8984")),
    ],
    ["Price", Icon(Icons.wallet, color: hexColor("FBAB40"))],
    [
      "Infrastructure",
      Icon(Icons.shopping_bag_sharp, color: hexColor("8C8984"))
    ],
    [
      "Without any layer",
      Icon(Icons.stacked_bar_chart_rounded, color: hexColor("8C8984"))
    ]
  ];

  Future<void> showModal(TapDownDetails details) async {
    onClicked.value = !onClicked.value;
    await showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => Align(
        alignment: const Alignment(-0.8, 0.55),
        child: Material(
          color: hexColor("FBF5EB"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: optional
                  .map((item) => OptionModal(text: item[0], icon: item[1]))
                  .toList(),
            ),
          ),
        ).animate().scale(),
      ),
    );
    onClicked.value = !onClicked.value;
  }

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        hasBackgroundImage: true,
        backgroundImage: AppImage.mapImage,
        child: ValueListenableBuilder(
            valueListenable: onClicked,
            builder: (context, onClicked, _) {
              return Padding(
                padding: EdgeInsets.only(left: 20.h, right: 0.w),
                child: Column(
                  children: [
                    40.verticalSpace,
                    TextSearchField(
                      duration: duration,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.verticalSpace,
                          Expanded(
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return Stack(
                                children: List.filled(
                                  7,
                                  AnimateLocation(
                                    isClicked: onClicked,
                                    boxConstraints: constraints,
                                  ),
                                ),
                              );
                            }),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent,
                                ),
                                onTapDown: showModal,
                                child: const CircularContainer(
                                  backgroundColor: Colors.grey,
                                  child: Center(
                                    child: Icon(
                                      Icons.stacked_bar_chart,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ).animate().scale(duration: duration),
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircularContainer(
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.near_me_sharp,
                                      color: Colors.white54,
                                    ),
                                  ).animate().scale(duration: duration),
                                  CircularContainer(
                                    backgroundColor: Colors.grey,
                                    isRect: true,
                                    child: Row(
                                      children: [
                                        12.horizontalSpace,
                                        GeneralIconDisplay(Icons.sort,
                                            Colors.white, UniqueKey(), 20),
                                        8.horizontalSpace,
                                        generalTextDisplay(
                                            'List of variations',
                                            Colors.white,
                                            14,
                                            FontWeight.w500,
                                            1,
                                            ''),
                                        12.horizontalSpace,
                                      ],
                                    ),
                                  ).animate().scale(duration: duration),
                                ],
                              ),
                              (kBottomNavigationBarHeight * 2).verticalSpace,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
