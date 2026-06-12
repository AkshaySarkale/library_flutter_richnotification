// ================= MODELS =================

class NotificationData {
  final int id;
  final String? title;
  final String? body;
  final String? payload;
  final String? icon;
  final String? image;
  final List<NotificationAction>? actions;

  NotificationData({
    required this.id,
    this.title,
    this.body,
    this.payload,
    this.icon,
    this.image,
    this.actions,
  });
}

class NotificationAction {
  final String id;
  final String label;
  final String? payload;

  NotificationAction({
    required this.id,
    required this.label,
    this.payload,
  });
}
