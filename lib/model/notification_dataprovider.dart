import 'package:flutter_project/model/notification_model.dart';

class NotificationData {
  static List<AppNotification> getNotifications() {
    return [
      AppNotification(
        title: "New Offer",
        message: "Get 20% off on Fashion items today!",
        date: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      AppNotification(
        title: "Booking Reminder",
        message: "Your appointment at Beauty & Salon is tomorrow 3 PM",
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      AppNotification(
        title: "Update",
        message: "New categories added to Home Decor section",
        date: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }
}
