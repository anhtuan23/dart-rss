import 'package:xml/xml.dart';

class Hash {
  const Hash({
    this.algo,
    this.value,
  });

  static Hash? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Hash(
      algo: element.getAttribute('algo'),
      value: element.innerText,
    );
  }

  final String? algo;
  final String? value;
}
