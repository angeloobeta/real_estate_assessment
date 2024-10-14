import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';

class BottomNavBarIcon extends StatefulWidget {
  final int index;
  final int selectedIndex;
  final void Function(int) onChanged;
  const BottomNavBarIcon({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  State<BottomNavBarIcon> createState() => _BottomNavBarIconState();
}

class _BottomNavBarIconState extends State<BottomNavBarIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: 4.microseconds,
      reverseDuration: 4.microseconds,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    widget.onChanged(widget.index);
    await _animationController.reverse();
    await _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _playAnimation,
      child: Stack(
        children: [
          Animate(
            controller: _animationController,
            effects: const [
              ScaleEffect(),
            ],
            child: CircularContainer(
              backgroundColor: widget.selectedIndex == widget.index
                  ? hexColor("FC9D11")
                  : hexColor("232220"),
              child: Icon(
                widget.index == 0
                    ? Icons.search
                    : widget.index == 1
                        ? Icons.chat
                        : widget.index == 2
                            ? Icons.home_filled
                            : widget.index == 3
                                ? Icons.favorite
                                : Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          Animate(
            effects: const [
              FadeEffect(
                end: 0,
                begin: 1,
              ),
              ScaleEffect(
                begin: Offset(0, 0),
                end: Offset(1.5, 1.5),
              ),
            ],
            controller: _animationController,
            child: Positioned.fill(
              child: CustomPaint(
                painter: Painter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
