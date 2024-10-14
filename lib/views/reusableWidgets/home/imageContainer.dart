import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';

class ImageContainer extends StatefulWidget {
  final String image;
  final String location;
  const ImageContainer(
      {super.key, required this.image, required this.location});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: SizedBox(
        height: 200.h,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                fit: BoxFit.cover,
                widget.image,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: BlurryContainer(
                  blur: 8,
                  height: 40.r,
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  width: double.maxFinite,
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return Stack(
                        children: [
                          Align(
                            alignment: constraint.maxWidth <
                                    MediaQuery.sizeOf(context).width / 2
                                ? Alignment.centerLeft
                                : Alignment.center,
                            child: generalTextDisplay(widget.location,
                                hexColor("000000"), 14, FontWeight.w400, 1, ''),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.5,
                                horizontal: 0,
                              ),
                              child: CircularContainer(
                                  size: 40.r,
                                  backgroundColor: hexColor("FBF5EB"),
                                  child: GeneralIconDisplay(
                                      Icons.chevron_right_outlined,
                                      Colors.black,
                                      UniqueKey(),
                                      15)),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ).animate().slideX(
                    delay: 0.4.seconds, duration: 0.9.seconds, begin: -1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
