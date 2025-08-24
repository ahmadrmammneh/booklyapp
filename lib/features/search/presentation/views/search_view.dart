import 'package:flutter/material.dart';
import 'package:myapp/features/search/presentation/views/widgets/search_view_bode.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SearchViewBode()));
  }
}
