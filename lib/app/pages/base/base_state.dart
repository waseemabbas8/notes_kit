import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

abstract class BaseState<P extends View, C extends Controller>
    extends ViewState<P, C> {
  BaseState(this.controller) : super(controller);

  @protected
  final C controller;

  @override
  Widget get view => ControlledWidgetBuilder<C>(
      builder: (context, controller) => getPageView());

  Widget getPageView();
}
