// ================= NOTIFICATION CONFIG =================

class NotificationConfig {
  final String defaultIcon;
  final String channelId;
  final String channelName;
  final String channelDescription;

  NotificationConfig({
    required this.defaultIcon,
    this.channelId = 'rich_notifications_channel',
    this.channelName = 'Rich Notifications',
    this.channelDescription = 'This channel is used for rich notifications.',
  });
}
