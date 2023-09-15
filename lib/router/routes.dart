import 'package:creativenasa/view/screens/gallery/gallery_screen.dart';
import 'package:creativenasa/view/screens/login/login_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {

  final List<RouteBase> routesList = [
    GoRoute(
      path: AppRoute.login.path,
      name: AppRoute.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoute.gallery.path,
      name: AppRoute.gallery.name,
      builder: (context, state) => const GalleryScreen(),
    ),
  ];

}

enum AppRoute {
  gallery('/', 'gallery'),
  login('/login', 'login');

  const AppRoute(this.path, this.routeName);

  final String path;
  final String routeName;

  @override
  String toString() => '$name: [$path][$routeName]';
}