import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';

class RealEstateDisplayType extends StatefulWidget {
  final double height;
  final RealEstateType estateType;
  const RealEstateDisplayType({
    super.key,
    required this.height,
    required this.estateType,
  });

  @override
  State<RealEstateDisplayType> createState() => _RealEstateDisplayTypeState();
}

class _RealEstateDisplayTypeState extends State<RealEstateDisplayType>
    with SingleTickerProviderStateMixin {
  late int number;
  late AnimationController _animationController;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    number = generateNumber();
    _animationController = AnimationController(
      vsync: this,
      duration: 1.5.seconds,
      reverseDuration: 1.5.seconds,
    )..addListener(() => setState(() {}));
    _animation = IntTween(begin: 1, end: number).animate(_animationController);
    _animationController.forward();
  }

  int generateNumber() => 1200 + Random().nextInt(1301);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
          shape: widget.estateType == RealEstateType.buy
              ? BoxShape.circle
              : BoxShape.rectangle,
          borderRadius: widget.estateType == RealEstateType.rent
              ? BorderRadius.circular(20.r)
              : null,
          color: widget.estateType == RealEstateType.buy
              ? Colors.orange.withOpacity(0.8)
              : Colors.white),
      child: Column(
        children: [
          20.verticalSpace,
          Expanded(
              flex: 1,
              child: generalTextDisplay(
                  widget.estateType.name.capitalizeFirst(),
                  widget.estateType == RealEstateType.buy
                      ? Colors.white
                      : Colors.grey,
                  15,
                  FontWeight.w500,
                  1,
                  '')),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    int number = _animation.value;

                    return generalTextDisplay(
                        '$number',
                        widget.estateType == RealEstateType.buy
                            ? Colors.white
                            : hexColor(hexOfRGBA(164, 149, 126)),
                        29,
                        FontWeight.w700,
                        1,
                        '');
                  },
                ),
                generalTextDisplay(
                    'offers',
                    widget.estateType == RealEstateType.buy
                        ? Colors.white
                        : hexColor(hexOfRGBA(164, 149, 126)),
                    12,
                    FontWeight.w500,
                    1,
                    '')
              ],
            ),
          ),
        ],
      ),
    ).animate().scale(duration: 0.5.seconds);
  }
}
