import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  kotlinOut: '../Bridge.g.kt',
  dartOut: 'lib/messages.g.dart',
  swiftOut: '../Bridge.g.swift',
  dartTestOut: 'test/messages.dart',
  javaOut: 'android/src/main/java/dev/mody/calculaterr/Messages.java',
  javaOptions: JavaOptions(
    package: 'dev.mody.calculaterr',
  ),
))

@HostApi()
abstract class CalculatorApi{
  Messages getMessage(int passedParameter);
  bool isWorking();
}

class Messages {
  Messages({
    required this.id,
    required this.message,
    required this.dateTime,
    required this.userId,
  });

  final int id;
  final String message;
  final int dateTime;
  final int userId;
}


