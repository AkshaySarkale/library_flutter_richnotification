import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification_config.dart';
import 'models/notification_data.dart';

class RichNotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static final RichNotificationService _instance = RichNotificationService._internal();
  factory RichNotificationService() => _instance;
  RichNotificationService._internal();

  Future<void> initialize(NotificationConfig config, {Function(String?)? onSelectNotification}) async {
    final AndroidInitializationSettings androidSettings = AndroidInitializationSettings(config.defaultIcon);
    final DarwinInitializationSettings iosSettings = const DarwinInitializationSettings();

    final InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notificationsPlugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (onSelectNotification != null) {
          onSelectNotification(response.payload);
        }
      },
    );
  }

  Future<void> showSimpleNotification(NotificationData data) async {
    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'simple_channel',
      'Simple Notifications',
      importance: Importance.max,
      priority: Priority.high,
      icon: data.icon,
    );

    final NotificationDetails details = NotificationDetails(android: androidDetails);
    await _notificationsPlugin.show(id:data.id,title:data.title, body:data.body, notificationDetails: details, payload: data.payload);
  }

  Future<void> showImageNotification(NotificationData data) async {
    final BigPictureStyleInformation bigPictureStyle = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap(data.image ?? ''),
      largeIcon: data.icon != null ? DrawableResourceAndroidBitmap(data.icon!) : null,
      contentTitle: data.title,
      summaryText: data.body,
    );

    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'image_channel',
      'Image Notifications',
      styleInformation: bigPictureStyle,
      importance: Importance.max,
      priority: Priority.high,
    );

    final NotificationDetails details = NotificationDetails(android: androidDetails);
    await _notificationsPlugin.show(id: data.id, title: data.title, body :data.body, notificationDetails: details, payload: data.payload);
  }

  Future<void> showVideoNotification(NotificationData data) async {
    final BigPictureStyleInformation bigPictureStyle = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap(data.image ?? ''),
      contentTitle: data.title,
      summaryText: data.body,
    );

    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'video_channel',
      'Video Notifications',
      styleInformation: bigPictureStyle,
      importance: Importance.max,
      priority: Priority.high,
    );

    final NotificationDetails details = NotificationDetails(android: androidDetails);
    await _notificationsPlugin.show(id: data.id, title:data.title, body:data.body, notificationDetails: details, payload: data.payload);
  }

  Future<void> showActionNotification(NotificationData data) async {
    final List<AndroidNotificationAction>? androidActions = data.actions?.map((action) {
      return AndroidNotificationAction(
        action.id,
        action.label,
        showsUserInterface: true,
      );
    }).toList();

    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'action_channel',
      'Action Notifications',
      importance: Importance.max,
      priority: Priority.high,
      actions: androidActions,
    );

    final NotificationDetails details = NotificationDetails(android: androidDetails);
    await _notificationsPlugin.show(id:data.id, title:data.title, body:data.body,notificationDetails: details, payload: data.payload);
  }
}
