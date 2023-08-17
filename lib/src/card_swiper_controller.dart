import 'package:flutter/foundation.dart';
import 'package:flutter_card_swiper/src/enums.dart';
import 'package:flutter/material.dart';

/// A controller that can be used to trigger swipes on a CardSwiper widget.
class CardSwiperController extends ChangeNotifier {
  CardSwiperState? state;
  late AnimationController _matchController;
  late Animation<double> _matchAnimation;
  Function? matchAnimationListener;
  bool isMatched = false;

  CardSwiperController(TickerProvider vsync) {
    // ... 你的其他初始化

    _matchController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 1000),
    );

    _matchAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_matchController);

    _matchController.addListener(() {
      if (matchAnimationListener != null) {
        matchAnimationListener!();
      }
    });
  }

  void startMatchAnimation() {
    _matchController.forward();
    isMatched = true;
  }

  /// Swipe the card by changing the status of the controller
  void swipe() {
    state = CardSwiperState.swipe;
    notifyListeners();
  }

  /// Swipe the card to the left side by changing the status of the controller
  void swipeLeft() {
    state = CardSwiperState.swipeLeft;
    notifyListeners();
  }

  /// Swipe the card to the right side by changing the status of the controller
  void swipeRight() {
    state = CardSwiperState.swipeRight;
    startMatchAnimation();
    notifyListeners();
  }

  /// Swipe the card to the top side by changing the status of the controller
  void swipeTop() {
    state = CardSwiperState.swipeTop;
    notifyListeners();
  }

  /// Swipe the card to the bottom side by changing the status of the controller
  void swipeBottom() {
    state = CardSwiperState.swipeBottom;
    notifyListeners();
  }

  // Undo the last swipe by changing the status of the controller
  void undo() {
    state = CardSwiperState.undo;
    notifyListeners();
  }
}
