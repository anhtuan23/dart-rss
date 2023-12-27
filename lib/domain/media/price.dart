import 'package:xml/xml.dart';

class Price {
  const Price({
    this.price = 0,
    this.type,
    this.info,
    this.currency,
  });

  factory Price.parse(XmlElement element) {
    return Price(
      price: double.tryParse(element.getAttribute('price') ?? '0') ?? 0,
      type: element.getAttribute('type'),
      info: element.getAttribute('info'),
      currency: element.getAttribute('currency'),
    );
  }

  final double price;
  final String? type;
  final String? info;
  final String? currency;
}
