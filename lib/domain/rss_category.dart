import 'package:xml/xml.dart';

class RssCategory {
  const RssCategory(this.domain, this.value);

  factory RssCategory.parse(XmlElement element) {
    final domain = element.getAttribute('domain');
    final value = element.innerText;
    return RssCategory(domain, value);
  }

  final String? domain;
  final String? value;
}
