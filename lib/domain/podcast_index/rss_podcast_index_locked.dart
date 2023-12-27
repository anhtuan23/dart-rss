import 'package:xml/xml.dart';

class RssPodcastIndexLocked {
  RssPodcastIndexLocked({
    this.owner,
    this.locked,
  });

  static RssPodcastIndexLocked? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexLocked(
      owner: element.getAttribute('owner'),
      locked: element.innerText == 'yes',
    );
  }

  final String? owner;
  final bool? locked;
}
