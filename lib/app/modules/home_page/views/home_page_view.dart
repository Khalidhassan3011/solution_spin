import '../../../common/util/exports.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Utils.appExitConfirmation,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Welcome',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
