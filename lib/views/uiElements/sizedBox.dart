// this is a sized box class
import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';

class S extends StatelessWidget {
  // h is height, w is width
  final double? h, w;
  final Widget? child;

  S({Key? key, this.h = 0, this.w = 0, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w!.w,
      height: h!.h,
      child: child ?? Container(),
    );
  }
}
