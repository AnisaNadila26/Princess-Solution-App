import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/login/login_page.dart';
import 'package:princess_solution/onboarding/onboarding_notifier.dart';
import 'package:princess_solution/onboarding/onboarding_model.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  final int index;
  OnboardingPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onboardingPagesList = [
      OnboardingModel(
          title: 'PRESENSI',
          description: 'Scan QR untuk lakukan presensi dengan mudah dan cepat',
          image: Image.asset(
            'onboarding1.png',
            width: 270,
          )),
      OnboardingModel(
          title: 'PENGUMUMAN',
          description: 'Cek pengumuman untuk mengetahui berita terbaru',
          image: Image.asset(
            'onboarding2.png',
            width: 180,
          )),
      OnboardingModel(
          title: 'KONSULTASI',
          description: 'Konsultasikan dengan Admin, jika mengalami kendala',
          image: Image.asset(
            'onboarding3.png',
            width: 180,
          )),
    ];
    return ChangeNotifierProvider(
      create: (_) {
        var notifier = OnboardingNotifier(context);
        notifier.initPageController();
        return notifier;
      },
      child: Consumer<OnboardingNotifier>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Selamat Datang',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Builder(
                      builder: (BuildContext context) {
                        return value.currentPageIndex <
                                onboardingPagesList.length - 1
                            ? TextButton(
                                onPressed: () {
                                  value.skipToLastPage();
                                },
                                child: Text(
                                  'Skip',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                                ),
                              )
                            : SizedBox(
                                height: 28,
                              );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  child: GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! > 0) {
                        value.previousPage();
                      } else if (details.primaryVelocity! < 0) {
                        value.nextPage();
                      }
                    },
                    child: PageView.builder(
                      itemCount: onboardingPagesList.length,
                      controller: value.pageController,
                      onPageChanged: (int index) {
                        value.currentPageIndex = index;
                      },
                      itemBuilder: (context, index) {
                        return onboardingPagesList[index];
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      DotsIndicator(
                        dotsCount: onboardingPagesList.length,
                        position: value.currentPageIndex,
                        decorator: DotsDecorator(
                          color: Color.fromRGBO(226, 235, 245, 1.0),
                          activeColor: Color.fromRGBO(76, 105, 176, 1.0),
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          spacing: const EdgeInsets.symmetric(horizontal: 4.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (value.currentPageIndex > 0)
                            InkWell(
                              onTap: () {
                                value.previousPage();
                              },
                              child: Icon(MdiIcons.arrowLeftCircleOutline),
                            ),
                          if (value.currentPageIndex < onboardingPagesList.length - 1)
                            InkWell(
                              onTap: () {
                                value.nextPage();
                              },
                              child: Icon(MdiIcons.arrowRightCircleOutline),
                            ),
                          if (value.currentPageIndex == onboardingPagesList.length - 1)
                            FilledButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                              },
                              child: Text(
                                'Login',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              style: FilledButton.styleFrom(
                                backgroundColor: Color.fromRGBO(76, 105, 176, 1.0),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
