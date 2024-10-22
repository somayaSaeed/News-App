import 'package:flutter/material.dart';
import 'package:news_app/core/model/SourceResponse.dart';
import 'package:news_app/ui/news_screen/news_widget/new_widget.dart';
import 'package:news_app/ui/news_screen/tab_widget/tab_item.dart';

import '../../../core/model/search.dart';

class TabsWidget extends StatefulWidget {
  List<Source> sourcesList;

  TabsWidget({super.key, required this.sourcesList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicator: const BoxDecoration(color: Colors.transparent),
              tabs: widget.sourcesList
                  .map(
                    (source) => TabItem(
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(source),
                      source: source,
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: NewWidget(
                source: widget.sourcesList[selectedIndex],
              ),
            )
          ],
        ),
      ),
    );
  }
}
