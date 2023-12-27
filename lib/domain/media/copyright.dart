import 'package:xml/xml.dart';

class Copyright {
  const Copyright({
    this.url,
    this.value,
  });

  final String? url;
  final String? value;

  static Copyright? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Copyright(
      url: element.getAttribute('url'),
      value: element.innerText,
    );
  }
}
