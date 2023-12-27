import 'package:dart_rss/domain/podcast_index/rss_podcast_index_funding.dart';
import 'package:dart_rss/domain/podcast_index/rss_podcast_index_locked.dart';
import 'package:dart_rss/util/helpers.dart';
import 'package:xml/xml.dart';

class RssPodcastIndex {
  RssPodcastIndex({
    this.funding,
    this.locked,
  });

  static RssPodcastIndex? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    return RssPodcastIndex(
      funding: element
          .findElements('podcast:funding')
          .map(RssPodcastIndexFunding.parse)
          .toList(),
      locked: RssPodcastIndexLocked.parse(
        findElementOrNull(element, 'podcast:locked'),
      ),
    );
  }

  final List<RssPodcastIndexFunding?>? funding;
  final RssPodcastIndexLocked? locked;
}
