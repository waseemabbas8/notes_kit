import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:notes_kit/app/di.dart';
import 'package:notes_kit/app/pages/base/base_state.dart';
import 'package:notes_kit/app/pages/home/notes_view.dart';
import 'package:notes_kit/app/utils/colors.dart';
import 'package:notes_kit/app/utils/constants.dart';
import 'package:notes_kit/app/utils/styles.dart';
import 'package:notes_kit/app/widgets/profile_image.dart';

import 'home_controller.dart';

class HomePage extends View {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  _HomePageState() : super(getIt());

  static const List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.grid_view),
      label: 'Widgets',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_rounded),
      label: 'Add',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
  ];

  @override
  Widget getPageView() => Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: true,
                  pinned: true,
                  expandedHeight: 220,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 40, bottom: 35),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    controller.text,
                                    style: titleStyle,
                                  ),
                                ),
                                SizedBox(width: 8),
                                ProfileImage(url: kSampleImage),
                              ],
                            ),
                          ),
                          Container(
                            color: kSearchbarColor,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: kGreyDark,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: "Hint here"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
                    indicatorWeight: 3,
                    indicatorColor: kPrimaryColor,
                    labelColor: Colors.black,
                    unselectedLabelColor: kDefaultTextColor,
                    labelStyle: tabsTextStyle,
                    unselectedLabelStyle: unSelectedTabTextStyle,
                    tabs: [
                      Tab(text: "Note"),
                      Tab(text: "Todo"),
                      Tab(text: "Blogs"),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                NotesPage(),
                Container(
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Text("Item $index");
                        })),
                Container(
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Text("Item $index");
                        })),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavItems,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      );
}
