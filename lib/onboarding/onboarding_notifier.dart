import 'package:flutter/material.dart';

class OnboardingNotifier extends ChangeNotifier {
  final BuildContext context;

  OnboardingNotifier(this.context);

  late PageController pageController; // Tambahkan ini

  int currentPageIndex = 0;

  void initPageController() {
    pageController = PageController(initialPage: currentPageIndex);
  }

  // ...

  void nextPage() {
    if (currentPageIndex < 2) {
      currentPageIndex++;
      pageController.animateToPage(currentPageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); // Gunakan PageController untuk berpindah halaman
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
      pageController.animateToPage(currentPageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); // Gunakan PageController untuk berpindah halaman
      notifyListeners();
    }
  }

  void skipToLastPage() {
    currentPageIndex = 2;
    pageController.animateToPage(currentPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease); // Gunakan PageController untuk berpindah halaman
    notifyListeners();
  }
}
