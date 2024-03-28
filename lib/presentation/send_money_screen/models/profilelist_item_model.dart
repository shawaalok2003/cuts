import '../../../core/app_export.dart';

/// This class is used in the [profilelist_item_widget] screen.
class ProfilelistItemModel {
  ProfilelistItemModel({
    this.ellipse,
    this.id,
  }) {
    ellipse = ellipse ?? ImageConstant.imgEllipse11;
    id = id ?? "";
  }

  String? ellipse;

  String? id;
}
