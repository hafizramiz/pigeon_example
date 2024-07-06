import 'package:pigeon/pigeon.dart';

/// Bunu calistirdigimizda ios ve android klasorlerinde bridge dosyalarini olusturur.
/// Ben simdilik android icin yapiyorum.



@ConfigurePigeon(PigeonOptions(
  objcHeaderOut: '../ios/pigeon_example/bridge.h',
  objcSourceOut: '../ios/pigeon_example/bridge.m',
  objcOptions: ObjcOptions(prefix: 'B'),
  kotlinOut: '../android/app/src/main/kotlin/com/example/pigeon_example/bridge.kt',
  kotlinOptions: KotlinOptions(package: 'com.example.pigeon_example'),
  dartOut: 'lib/bridge.dart',
  dartTestOut: 'test/bridge_test.dart',
))

class HistoryEntry {
  final bool state;
  final String at;
  final String source;
  HistoryEntry({required this.state, required this.at, required this.source});
}

@FlutterApi()
abstract class FApi {
  void currentState(bool state);
}

@HostApi()
abstract class HApi {
  void updateState(HistoryEntry entry);
}