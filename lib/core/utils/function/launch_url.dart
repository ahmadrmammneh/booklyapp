import 'package:flutter/material.dart';
import 'package:myapp/core/utils/function/custome_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(BuildContext context, String? url) async {
  if (url == null || url.isEmpty) {
    customSnackBar(context, 'No URL available to launch.');
    return;
  }

  final Uri uri = Uri.tryParse(url) ?? Uri(); // محاولة تحويل الرابط
  if (uri.toString().isEmpty) {
    customSnackBar(context, 'Invalid URL');
    return;
  }

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    customSnackBar(context, 'Cannot launch $url');
  }
}
