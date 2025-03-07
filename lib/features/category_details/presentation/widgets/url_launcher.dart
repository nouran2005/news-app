import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchURL(BuildContext context, String? url, bool inApp) async {
    if (url == null || url.isEmpty || !(Uri.tryParse(url)?.isAbsolute ?? false)) {
      _showTopSnackbar(context, "Invalid URL");
      return;
    }

    try {
      bool launched = await launchUrl(
        Uri.parse(url),
        mode: inApp ? LaunchMode.inAppBrowserView : LaunchMode.externalApplication,
      );

      if (!launched) {
        _showTopSnackbar(context, "Could not launch URL");
      }
    } catch (e) {
      _showTopSnackbar(context, "Error launching URL: $e");
    }
  }

  static void _showTopSnackbar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 40, 
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    
    Future.delayed(Duration(seconds: 2), () => overlayEntry.remove());
  }
}
