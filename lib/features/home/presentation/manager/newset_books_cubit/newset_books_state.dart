part of 'newset_books_cubit.dart';

sealed class NewsetbooksState extends Equatable {
  const NewsetbooksState();

  @override
  List<Object> get props => [];
}

final class NewsetbooksInitial extends NewsetbooksState {}

final class NewsetbooksLoading extends NewsetbooksState {}

final class NewsetbooksSuccess extends NewsetbooksState {
  final List<BookModel> books;
  const NewsetbooksSuccess(this.books);
}

final class NewsetbooksFailure extends NewsetbooksState {
  final String errMessage;
  const NewsetbooksFailure(this.errMessage);
}
