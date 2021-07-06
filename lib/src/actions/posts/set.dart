part of posts_actions;

@freezed
abstract class UpdatePostInfo with _$UpdatePostInfo implements AppAction {
  const factory UpdatePostInfo({
    String addImage,
    String removeImage,
    String description,
    double lat,
    double lng,
    AppUser addUser,
    AppUser removeUser,
  }) = UpdatePostInfo$;
}
