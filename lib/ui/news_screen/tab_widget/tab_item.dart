import 'package:flutter/material.dart';
import 'package:news_app/core/model/SourceResponse.dart';
import 'package:news_app/utils/color_resource%20.dart';

class TabItem extends StatefulWidget {
  TabItem({super.key, required this.isSelected, required this.source});
  bool isSelected;
  Source source;

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 40,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: widget.isSelected
            ? ColorResources.primaryColor
            : Colors.green.shade100,
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textAlign: TextAlign.center,
          overflow : TextOverflow.ellipsis,
          widget.source.name ?? '',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: widget.isSelected
                  ? ColorResources.white
                  : ColorResources.grey),
          //overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
