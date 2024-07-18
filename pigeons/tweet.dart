import 'package:pigeon/pigeon.dart';

/// Buraya iletisim kurarken yapacagimiz metotlari  ve classlari yaziyoruz.


class Tweet {
  Tweet({
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

@HostApi()
abstract class TweetApi {
  Tweet getTweet();
}

/// Daha sonra terminalde flutter pub run pigeon --input deyip bu dosya dizinini veriyoruz. Ayrica
/// ornegin surdaki gibi: flutter pub get
// flutter pub run pigeon --input pigeons/tweet.dart --dart_out lib/tweet.g.dart --android_out android/src/main/kotlin/com/example/pigeonexample/TweetApi.kt
/// Android ciktisi nasil olsun nerde olsun gibi ayarlar yapabiliriz.Araya da
/// tweet.g.dart g harfi artiriyoruz ki generate oldugu anlasilsin.