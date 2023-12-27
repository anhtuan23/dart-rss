import 'package:xml/xml.dart';

class Rating {
  const Rating({
    this.scheme,
    this.value,
  });

  static Rating? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Rating(
      scheme: element.getAttribute('scheme'),
      value: element.innerText,
    );
  }

  final String? scheme;
  final String? value;
}
