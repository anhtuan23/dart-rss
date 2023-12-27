import 'package:xml/xml.dart';

class RssPodcastIndexFunding {
  RssPodcastIndexFunding({
    this.url,
    this.value,
  });

  static RssPodcastIndexFunding? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexFunding(
      url: element.getAttribute('url'),
      value: element.innerText.trim(),
    );
  }

  final String? url;
  final String? value;
}
