import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/custome_error_widget.dart';
import 'package:myapp/core/widgets/custome_loading_indicator.dart';
import 'package:myapp/features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:myapp/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetbooksCubit, NewsetbooksState>(
      builder: (context, state) {
        if (state is NewsetbooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewsetbooksFailure) {
          return CustomeErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomeLoadingIndicator();
        }
      },
    );
  }
}
