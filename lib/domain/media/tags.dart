import 'package:xml/xml.dart';

class Tags {
  const Tags({
    this.tags,
    this.weight = 1,
  });

  static Tags? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Tags(
      tags: element.innerText,
      weight: int.tryParse(element.getAttribute('weight') ?? '1') ?? 1,
    );
  }

  final String? tags;
  final int weight;
}
