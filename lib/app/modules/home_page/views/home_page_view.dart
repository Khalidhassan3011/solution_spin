import 'package:analog_clock/analog_clock.dart';

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
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.image.icon,
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome to SolutionSpin',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 200,
                child: Obx(
                  () => AnalogClock(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        color: Colors.transparent,
                        shape: BoxShape.circle),
                    width: 150.0,
                    isLive: true,
                    secondHandColor: Colors.grey,
                    hourHandColor: Colors.black,
                    minuteHandColor: Colors.black,
                    showSecondHand: true,
                    numberColor: Colors.black87,
                    showNumbers: true,
                    textScaleFactor: 1.4,
                    showTicks: true,
                    showDigitalClock: true,
                    datetime: controller.time.value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
