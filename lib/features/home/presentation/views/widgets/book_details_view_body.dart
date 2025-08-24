import 'package:flutter/material.dart';
import 'package:myapp/features/home/data/models/book_model/book_model.dart';
import 'package:myapp/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:myapp/features/home/presentation/views/widgets/custome_book_details_app_bar.dart';
import 'package:myapp/features/home/presentation/views/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(bookModel: bookModel),
                const Expanded(child: SizedBox(height: 50)),
                const SimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
