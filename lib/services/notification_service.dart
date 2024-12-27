import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool isInitialized = false;

  Future<void> initialize() async {
    // Solicitar permissão para notificações
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // Configurar handlers para diferentes estados do app
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
      FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
      
      isInitialized = true;
    }
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    // Implementar lógica para mensagens em primeiro plano
    print('Mensagem recebida em primeiro plano: ${message.data}');
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    // Implementar lógica para mensagens em segundo plano
    print('Mensagem recebida em segundo plano: ${message.data}');
  }
} 