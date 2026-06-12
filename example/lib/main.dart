import 'package:flutter/material.dart';
import 'package:rich_notifications/rich_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rich Notifications Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Displaynotification(),
    );
  }
}

class Displaynotification extends StatefulWidget {
  const Displaynotification({super.key});

  @override
  State<Displaynotification> createState() => _DisplaynotificationState();
}

class _DisplaynotificationState extends State<Displaynotification> {
  final RichNotificationService _notificationService = RichNotificationService();

  @override
  void initState() {
    super.initState();
    _initNotifications();
  }

  Future<void> _initNotifications() async {
    // ================= INITIALIZATION =================
    await _notificationService.initialize(
      NotificationConfig(defaultIcon: '@mipmap/ic_launcher'),
      onSelectNotification: (payload) {
        debugPrint('Notification tapped with payload: $payload');
      },
    );
  }

  Future<void> showSimpleNotification() async {
    // ================= SIMPLE NOTIFICATION =================
    await _notificationService.showSimpleNotification(
      NotificationData(
        id: 1,
        title: 'Simple Notification',
        body: 'This is a simple notification body.',
        payload: 'simple_payload',
      ),
    );
  }

  Future<void> showImageNotification() async {
    // ================= IMAGE NOTIFICATION =================
    // Note: Ensure '@mipmap/ic_launcher' exists in your android/app/src/main/res/mipmap
    await _notificationService.showImageNotification(
      NotificationData(
        id: 2,
        title: 'Image Notification',
        body: 'Look at this beautiful image!',
        image: 'ic_launcher', // Using launcher icon as placeholder
        icon: 'ic_launcher',
        payload: 'image_payload',
      ),
    );
  }

  Future<void> showVideoNotification() async {
    // ================= VIDEO NOTIFICATION =================
    await _notificationService.showVideoNotification(
      NotificationData(
        id: 3,
        title: 'New Video Available',
        body: 'Tap to watch the latest video.',
        image: 'ic_launcher', // Thumbnail placeholder
        payload: 'video_payload_id_123',
      ),
    );
  }

  Future<void> showActionNotification() async {
    // ================= ACTION NOTIFICATION =================
    await _notificationService.showActionNotification(
      NotificationData(
        id: 4,
        title: 'Action Required',
        body: 'What would you like to do?',
        actions: [
          NotificationAction(id: 'yes', label: 'Yes'),
          NotificationAction(id: 'no', label: 'No'),
        ],
        payload: 'action_payload',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: showSimpleNotification,
              child: const Text('Show Simple Notification'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: showImageNotification,
              child: const Text('Show Image Notification'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: showVideoNotification,
              child: const Text('Show Video Notification'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: showActionNotification,
              child: const Text('Show Action Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
