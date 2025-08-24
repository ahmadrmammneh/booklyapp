import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/constant.dart';
import 'package:myapp/core/utils/app_router.dart';
import 'package:myapp/core/utils/styles.dart';
import 'package:myapp/features/home/data/models/book_model/book_model.dart';
import 'package:myapp/features/home/presentation/views/widgets/book_rating.dart';
import 'package:myapp/features/home/presentation/views/widgets/custome_book_image.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key, required this.bookModel})
    : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 126,
        child: Row(
          children: [
            CustomeBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating:
                            bookModel.volumeInfo.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
