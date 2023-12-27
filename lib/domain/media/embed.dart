import 'package:dart_rss/domain/media/param.dart';
import 'package:xml/xml.dart';

class Embed {
  const Embed({
    this.url,
    this.width = 0,
    this.height = 0,
    this.params = const <Param>[],
  });

  static Embed? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Embed(
      url: element.getAttribute('url'),
      width: int.tryParse(element.getAttribute('width') ?? '0') ?? 0,
      height: int.tryParse(element.getAttribute('height') ?? '0') ?? 0,
      params: element.findElements('media:param').map(Param.parse).toList(),
    );
  }

  final String? url;
  final int width;
  final int height;
  final List<Param> params;
}
