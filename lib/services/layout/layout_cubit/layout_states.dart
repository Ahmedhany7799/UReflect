abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class GetUserDataSuccessState extends LayoutStates {}

class GetUserDataLoadingState extends LayoutStates {}

class FailedToGetUserDataState extends LayoutStates {
  final String message;
  FailedToGetUserDataState({required this.message, required error});
}

class GetFavoritesSuccessState extends LayoutStates {}

class FailedToGetFavoritesState extends LayoutStates {}

class AddOrRemoveItemFromFavoritesSuccessState extends LayoutStates {}

class FailedToAddOrRemoveItemFromFavoritesState extends LayoutStates {}

// class GetBannersLoadingState extends LayoutStates {}

// class GetBannersSuccessState extends LayoutStates {}

// class FailedToGetBannersState extends LayoutStates {}

// class GetCategoriesSuccessState extends LayoutStates {}

// class FailedToGetCategoriesState extends LayoutStates {}

class GetProductsSuccessState extends LayoutStates {}

class FailedToGetProductsState extends LayoutStates {}

class AddOrRemoveItemFromCartsSuccessState extends LayoutStates {}

class FailedToAddOrRemoveItemFromCartsState extends LayoutStates {}

class FilterProductsSuccessState extends LayoutStates {}

class GetCartsSuccessState extends LayoutStates {}

class FailedToGetCartsState extends LayoutStates {}

// class ChangePasswordLoadingState extends LayoutStates {}

// class ChangePasswordSuccessState extends LayoutStates {}

// class ChangePasswordWithFailureState extends LayoutStates {
//   String error;

//   ChangePasswordWithFailureState(this.error);
// }

// class UpdateUserDataLoadingState extends LayoutStates {}

// class UpdateUserDataSuccessState extends LayoutStates {}

// class UpdateUserDataWithFailureState extends LayoutStates {
//   String error;

//   UpdateUserDataWithFailureState(this.error);
// }
