import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:notes_kit/app/pages/onboard/onboard_controller.dart';
import 'package:notes_kit/app/utils/colors.dart';
import 'package:notes_kit/app/utils/styles.dart';
import 'package:notes_kit/app/widgets/dot_view.dart';
import 'package:notes_kit/domain/entities/slider_item.dart';

class OnboardPage extends View {
  @override
  State<StatefulWidget> createState() => _OnboardState();
}

class _OnboardState extends ViewState<OnboardPage, OnboardController> {
  _OnboardState() : super(OnboardController());

  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget get view => ControlledWidgetBuilder<OnboardController>(
      builder: (context, controller) => Scaffold(
            body: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: controller.onPageChange,
                    children: [
                      OnboardSlider(_sliderItems[0]),
                      OnboardSlider(_sliderItems[1]),
                      OnboardSlider(_sliderItems[2]),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DotView(controller.currentPage == 0),
                            DotView(controller.currentPage == 1),
                            DotView(controller.currentPage == 2),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            var temp = controller.currentPage;
                            if (++temp > 2) {
                              //goto next page
                            } else {
                              _pageController.animateToPage(temp,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            }
                          },
                          child: Text('Next'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
}

class OnboardSlider extends StatelessWidget {
  final SliderItem _sliderItem;

  OnboardSlider(this._sliderItem);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 50, 50, 8),
          child: Image(
            image: _sliderItem.assetImage,
          ),
        ),
        Text(
          _sliderItem.title,
          textAlign: TextAlign.center,
          style: titleStyle,
        ),
        SizedBox(height: 8),
        Text(
          _sliderItem.description,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: bodyTextStyle,
        )
      ],
    );
  }
}

const List<SliderItem> _sliderItems = [
  SliderItem(
      AssetImage('assets/images/slider_image_1.png'),
      'Create free notes and collaborate with your team',
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.'),
  SliderItem(
      AssetImage('assets/images/slider_image_2.png'),
      'Create free notes and collaborate with your team',
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.'),
  SliderItem(
      AssetImage('assets/images/slider_image_3.png'),
      'Create free notes and collaborate with your team',
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.'),
];
