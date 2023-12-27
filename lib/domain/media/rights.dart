import 'package:xml/xml.dart';

class Rights {
  const Rights({
    this.status,
  });

  static Rights? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Rights(
      status: element.getAttribute('status'),
    );
  }

  final String? status;
}
