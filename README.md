# rich_notifications

A Flutter package for easy rich notifications including images, video thumbnails, and action buttons.

## Features

- Simple Notification
- Image Notification (Big Picture Style)
- Video Notification (Thumbnail)
- Action Button Notification
- Easy Initialization

## Getting started

Add `rich_notifications` to your `pubspec.yaml`:

```yaml
dependencies:
  rich_notifications:
    path: ../rich_notifications
```

## Usage

```dart
import 'package:rich_notifications/rich_notifications.dart';

// Initialize
final service = RichNotificationService();
await service.initialize(NotificationConfig(defaultIcon: '@mipmap/ic_launcher'));

// Show simple notification
await service.showSimpleNotification(
  NotificationData(id: 1, title: 'Hello', body: 'World'),
);
```

## ROADMAP

- Scheduled Notifications
- Network Image Notifications
- Firebase Push Notifications
- Group Notifications
- Chat Notifications
- Video Thumbnail with Play Overlay

## Additional information

Built with flutter_local_notifications.
