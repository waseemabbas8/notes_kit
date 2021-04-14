import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OnboardController extends Controller {
  int currentPage = 0;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  onPageChange(int page) {
    currentPage = page;
    refreshUI();
  }
}
