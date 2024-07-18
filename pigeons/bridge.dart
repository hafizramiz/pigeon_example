import 'package:pigeon/pigeon.dart';

/// Bunu calistirdigimizda ios ve android klasorlerinde bridge dosyalarini olusturur.
/// Ben simdilik android icin yapiyorum.



@ConfigurePigeon(PigeonOptions(
  kotlinOut: '../Bridge.g.kt',
  dartOut: 'lib/bridge.g.dart',
  swiftOut: '../Bridge.g.swift',
  dartTestOut: 'test/bridge_test.dart',
  javaOptions: JavaOptions(package: 'com.example.pigeon_example'),
  kotlinOptions: KotlinOptions(package: 'com.example.pigeon_example'),
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



/// Bu classlari yazdiktan sonra  flutter pub run pigeon --input pigeon/bridge.dart
/// komutunu calistirarak bridge dosyalarini olusturuyoruz.  flutter pub run pigeon --input
/// komutuna su anda bulundugumuz dizini veriyoruz. Daha sonra bu komut
/// lib'de test'i eklemissek test'te kotlinOut ve dartTestOut, swiftOut
/// ve objcOut gibi eklemissek orda da yeni kodlar generate eder.
/// Ios tarafinda AppDelegate.swift'in altinda yeni klasor olusturmasi lazim