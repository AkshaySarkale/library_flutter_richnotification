# rich_notifications

A reusable Flutter package that provides rich Android notifications with support for simple notifications, image notifications, video-style notifications, and action button notifications using `flutter_local_notifications`.

## When To Use

* **Chat Applications**: Show incoming messages with rich notification layouts.
* **Media Apps**: Display image and video thumbnail notifications.
* **E-Commerce Apps**: Send promotional notifications with banners.
* **Reminder Apps**: Create actionable notifications with buttons.
* **Social Media Apps**: Notify users about posts, likes, and messages.
* **News Applications**: Show featured news with images.
* **Utility Apps**: Display alerts and system notifications.

## Perfect For

* **Chat Applications**
* **Media Apps**
* **E-Commerce Apps**
* **Reminder Apps**
* **Social Media Apps**
* **News Applications**
* **Utility Apps**

## Features

| Feature                         | Status    |
| ------------------------------- | --------- |
| ✅ Simple Notifications          | Supported |
| ✅ Image Notifications           | Supported |
| ✅ Video Thumbnail Notifications | Supported |
| ✅ Action Button Notifications   | Supported |
| ✅ Notification Click Handling   | Supported |
| ✅ Android Support               | Supported |
| ✅ Custom Icons                  | Supported |
| ✅ Custom Images                 | Supported |
| ✅ Singleton Service             | Supported |
| ✅ Null Safe                     | Supported |

---

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  rich_notifications:
    git:
      url: https://github.com/AkshaySarkale/library_flutter_richnotification.git
```

Or run:

```bash
flutter pub add rich_notifications
```

---

## Import

```dart
import 'package:rich_notifications/rich_notifications.dart';
```

---

## Initialization

```dart
await RichNotificationService().initialize(
  NotificationConfig(
    defaultIcon: 'demoicon',
  ),
);
```

---

## Simple Notification

```dart
await RichNotificationService().showSimpleNotification(
  NotificationData(
    id: 1,
    title: "Hello Akshay 👋",
    body: "This is a simple notification",
  ),
);
```

---

## Image Notification

```dart
await RichNotificationService().showImageNotification(
  NotificationData(
    id: 2,
    title: "Image Alert",
    body: "Notification with image",
    image: "banner",
    icon: "demoicon",
  ),
);
```

---

## Video Notification

```dart
await RichNotificationService().showVideoNotification(
  NotificationData(
    id: 3,
    title: "Video Received ▶️",
    body: "Tap to watch video",
    image: "banner",
    payload: "open_video",
  ),
);
```

> Note: Android notifications cannot directly play videos. A thumbnail image is shown and the notification can be tapped to open a video screen.

---

## Action Button Notification

```dart
await RichNotificationService().showActionNotification(
  NotificationData(
    id: 4,
    title: "Action Notification",
    body: "Tap Open button below",
    actions: [
      NotificationAction(
        id: "open_action",
        label: "Open",
      ),
    ],
  ),
);
```

---

## Full Example

```dart
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
      debugShowCheckedModeBanner: false,
      home: DemoScreen(),
    );
  }
}

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rich Notifications Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await RichNotificationService().showSimpleNotification(
              NotificationData(
                id: 1,
                title: "Welcome",
                body: "Rich notification package working!",
              ),
            );
          },
          child: const Text("Show Notification"),
        ),
      ),
    );
  }
}
```

---

## Android Setup

Inside:

```text
android/app/src/main/res/drawable/
```

Add your notification assets:

```text
demoicon.png
hotjar.png
banner.png
```

Example:

```dart
NotificationConfig(
  defaultIcon: 'demoicon',
)
```

---

## File Structure

```text
lib/
├── rich_notifications.dart
├── services/
│   └── rich_notification_service.dart
├── models/
│   ├── notification_data.dart
│   └── notification_action.dart
└── notification_config.dart
```

---

## Demo
<img src="assets/demo.gif" height="500">

---

## License

MIT License

Copyright (c) 2026 Akshay Sarkale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so.
