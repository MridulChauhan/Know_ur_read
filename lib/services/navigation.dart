import 'package:flutter/cupertino.dart';
import 'package:knowurread/utils/constants.dart';

class PageViewNavigation extends StatefulWidget {
  @override
  _PageViewNavigationState createState() => _PageViewNavigationState();
}

class _PageViewNavigationState extends State<PageViewNavigation> {
  @override
  void dispose() {
    KnowUrReadConst.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: KnowUrReadConst.controller,
      children: KnowUrReadConst.pages,
    );
  }
}
