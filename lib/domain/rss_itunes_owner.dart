import 'package:dart_rss/util/helpers.dart';
import 'package:xml/xml.dart';

class RssItunesOwner {
  const RssItunesOwner({this.name, this.email});

  static RssItunesOwner? parse(XmlElement? element) {
    if (element == null) return null;
    return RssItunesOwner(
      name: findElementOrNull(element, 'itunes:name')?.innerText.trim(),
      email: findElementOrNull(element, 'itunes:email')?.innerText.trim(),
    );
  }

  final String? name;
  final String? email;
}
