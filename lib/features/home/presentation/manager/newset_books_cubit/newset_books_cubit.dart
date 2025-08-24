import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/features/home/data/models/book_model/book_model.dart';
import 'package:myapp/features/home/data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetbooksCubit extends Cubit<NewsetbooksState> {
  NewsetbooksCubit(this.homeRepo) : super(NewsetbooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewSetBooks() async {
    emit(NewsetbooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold(
      (failure) => emit(NewsetbooksFailure(failure.errMessage)),
      (books) => emit(NewsetbooksSuccess(books)),
    );
  }
}
