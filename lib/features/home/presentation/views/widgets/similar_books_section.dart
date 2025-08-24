import 'package:flutter/material.dart';
import 'package:myapp/core/utils/styles.dart';
import 'package:myapp/features/home/presentation/views/widgets/similar_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        SimilarBooksListView(),
      ],
    );
  }
}
