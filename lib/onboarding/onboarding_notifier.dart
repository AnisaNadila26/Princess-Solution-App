import 'package:flutter/material.dart';

class OnboardingNotifier extends ChangeNotifier {
  final BuildContext context;

  OnboardingNotifier(this.context);

  late PageController pageController;

  int currentPageIndex = 0;
  bool isSwipe = false;

  void initPageController() {
    pageController = PageController(initialPage: currentPageIndex);
    pageController.addListener(() {
      currentPageIndex = pageController.page?.round() ?? 0;
      notifyListeners();
    });
  }

  void nextPage() {
    if (currentPageIndex < 2) {
      currentPageIndex++;
      isSwipe
          ? pageController.animateToPage(currentPageIndex,
              duration: Duration(milliseconds: 500), curve: Curves.ease)
          : pageController.jumpToPage(currentPageIndex);
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
      isSwipe
          ? pageController.animateToPage(currentPageIndex,
              duration: Duration(milliseconds: 500), curve: Curves.ease)
          : pageController.jumpToPage(currentPageIndex);
      notifyListeners();
    }
  }

  void skipToLastPage() {
    currentPageIndex = 2;
    isSwipe
        ? pageController.animateToPage(currentPageIndex,
            duration: Duration(milliseconds: 500), curve: Curves.ease)
        : pageController.jumpToPage(currentPageIndex);
    notifyListeners();
  }
}
