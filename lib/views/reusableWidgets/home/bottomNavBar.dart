import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(int) onChanged;
  final int currentIndex;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: ShapeDecoration(
        color: hexColor("2B2B2B"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            RealEstateIcon.values.length,
            (index) => Container(
                margin: EdgeInsets.only(
                    right:
                        index == int.tryParse(RealEstateAnimation.values.last)
                            ? 0
                            : 8.w),
                child: BottomNavBarIcon(
                  index: index,
                  selectedIndex: currentIndex,
                  onChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                    widget.onChanged(index);
                  },
                ))).toList(),
      ),
    ).animate().moveY(
          begin: 90,
          delay: 0.7.seconds,
          duration: 0.9.seconds,
        );
  }
}
