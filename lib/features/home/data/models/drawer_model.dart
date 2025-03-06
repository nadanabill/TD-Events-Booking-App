import 'package:td_events_booking/core/constants/app_assets.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';

class DrawerModel {
  final String icon;
  final String title;
  final String router;

  DrawerModel({
    required this.icon,
    required this.title,
    required this.router,
  });
}

List<DrawerModel> drawerItems = [
  DrawerModel(
    icon: AppSvgs.user,
    title: AppStrings.myProfile,
    router: '',
  ),
  DrawerModel(
    icon: AppSvgs.message,
    title: AppStrings.messages,
    router: '',
  ),
  DrawerModel(
    icon: AppSvgs.calendar1,
    title: AppStrings.calendar,
    router: '',
  ),
  DrawerModel(
    icon: AppSvgs.bookmark1,
    title: AppStrings.bookmarks,
    router: '',
  ),
  DrawerModel(
    icon: AppSvgs.mail,
    title: AppStrings.contactUs,
    router: '',
  ),
  DrawerModel(
    icon: AppSvgs.settings,
    title: AppStrings.settings,
    router: '',
  ),
  DrawerModel(
    icon: AppSvgs.help,
    title: AppStrings.helpAndFAQs,
    router: '/',
  ),
  DrawerModel(
    icon: AppSvgs.logout,
    title: AppStrings.singOut,
    router: '',
  ),
];
