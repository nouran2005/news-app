part of 'category_cubit.dart';

class CategoryState extends Equatable {
  final LoadStatus loadDataStatus;

  const CategoryState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  CategoryState copyWith({
    LoadStatus? loadDataStatus,
  }) {
    return CategoryState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
