import '../../../core/app_export.dart';

/// This class is used in the [profilelist1_item_widget] screen.
class Profilelist1ItemModel {
  Profilelist1ItemModel({
    this.ellipse,
    this.id,
  }) {
    ellipse = ellipse ?? ImageConstant.imgEllipse11;
    id = id ?? "";
  }

  String? ellipse;

  String? id;
}
