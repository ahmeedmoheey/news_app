import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/presentation/tabs/categories/categories_details/widgets/sources_tab_widget/source_item_widget.dart';

import '../../../../articles_list_widget/article_list_widget.dart';

class SourcesTabWidget extends StatefulWidget {
  SourcesTabWidget({super.key, required this.sources});

  List<Source> sources;
  int x = 0;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (index) {
                tappedIndex = index; // 2
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              labelPadding: REdgeInsets.symmetric(horizontal: 8),
              isScrollable: true,
              tabs: widget.sources
                  .map(
                    (source) => SourceItemWidget(
                    source: source,
                    isSelected:
                    widget.sources.indexOf(source) == tappedIndex),
              )
                  .toList()),
        ),
        ArticlesListWidget(
          source: widget.sources[tappedIndex],
        )
      ],
    );
  }
}