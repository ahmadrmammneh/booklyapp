import 'package:flutter/material.dart';
import 'package:myapp/core/utils/styles.dart';
import 'package:myapp/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:myapp/features/search/presentation/views/widgets/custome_search_text_field.dart';

class SearchViewBode extends StatelessWidget {
  const SearchViewBode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: const [
          CustomeSearchTextField(),
          SizedBox(height: 16),
          Text("Search Result", style: Styles.textStyle18),
          Expanded(child: SearchResultListView()),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,

      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const BookListViewItem(),
        );
      },
    );
  }
}
