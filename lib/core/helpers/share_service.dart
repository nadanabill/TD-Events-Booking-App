import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/event_model.dart';

class ShareService {
  final Dio dio;

  ShareService(this.dio);

  Future<void> shareEvent(Event event) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/event_image.jpg';

      await dio.download(event.picture!, filePath);

      String text =
          '🎉 ${event.title}\n📍 Location: ${event.address}\nJoin us!';
      await Share.shareXFiles([XFile(filePath)], text: text);
    } catch (e) {
      print('Error sharing event: $e');
    }
  }
}
