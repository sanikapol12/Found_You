import 'package:flutter_project/model/notification_dataprovider.dart';

import '../model/notification_model.dart';

class NotificationController {
  List<AppNotification> getNotifications() {
    return NotificationData.getNotifications();
  }
}
