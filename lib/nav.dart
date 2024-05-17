import 'package:flutter/material.dart';
import 'package:jawnnypoo/fullscreen_image_page.dart';
import 'package:jawnnypoo/home_page.dart';
import 'package:jawnnypoo/portfolio_page.dart';
import 'package:jawnnypoo/ui/snackbar_helper.dart';
import 'package:url_launcher/url_launcher.dart';

/// Navigation helper.
class Nav {
  static void navigateToPortfolio(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PortfolioPage()),
    );
  }

  static void navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  static void navigateToImage(BuildContext context, String image) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FullscreenImagePage(image)),
    );
  }

  /// Android bias lol
  static void finish(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<void> openUrl(BuildContext context, String? url) async {
    if (url != null) {
      Uri uri = Uri.parse(url);
      await launchUrl(uri);
    }
  }
}
