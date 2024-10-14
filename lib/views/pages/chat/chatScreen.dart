import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
        ),
        child: Center(
          child: LottieBuilder.asset(
            RealEstateAnimation.chatting,
          ),
        ));
  }
}
