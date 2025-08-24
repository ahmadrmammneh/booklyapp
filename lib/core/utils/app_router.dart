import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/utils/service_locator.dart';
import 'package:myapp/features/home/data/models/book_model/book_model.dart';
import 'package:myapp/features/home/data/repos/home_repo_impl.dart';
import 'package:myapp/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:myapp/features/home/presentation/views/book_details_view.dart';
import 'package:myapp/features/home/presentation/views/home_view.dart';
import 'package:myapp/features/search/presentation/views/search_view.dart';
import 'package:myapp/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeview';
  static const kBookDetailsView = '/bookdetailsview';
  static const kSearchView = '/searchview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
