import 'package:xml/xml.dart';

class RssItunesImage {
  const RssItunesImage({this.href});

  static RssItunesImage? parse(XmlElement? element) {
    if (element == null) return null;
    return RssItunesImage(
      href: element.getAttribute('href')?.trim(),
    );
  }

  final String? href;
}
