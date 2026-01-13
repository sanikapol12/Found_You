class NotificationModel {
  final String id;
  final String name;
  final String message;
  final String? profileUrl;
  String status; // pending, accepted, deleted

  NotificationModel({
    required this.id,
    required this.name,
    required this.message,
    this.profileUrl,
    this.status = 'pending',
  });
}
