import 'package:serverpod/serverpod.dart';
import 'dart:io';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.

  final port = int.parse(Platform.environment['PORT'] ?? '3000');
  final serverConfig = ServerConfig(
    port: port,
    publicHost: 'localhost',
    publicPort: port,
    publicScheme: 'http',
  );

  final pod = Serverpod(
    args,
    config: ServerpodConfig(apiServer: serverConfig),
    Protocol(),
    Endpoints(),
  );

  // Start the server.
  await pod.start();
}
