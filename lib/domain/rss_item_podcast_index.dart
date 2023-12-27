import 'package:dart_rss/domain/podcast_index/rss_podcast_index_chapters.dart';
import 'package:dart_rss/domain/podcast_index/rss_podcast_index_soudbite.dart';
import 'package:dart_rss/domain/podcast_index/rss_podcast_index_transcript.dart';
import 'package:dart_rss/util/helpers.dart';
import 'package:xml/xml.dart';

class RssItemPodcastIndex {
  RssItemPodcastIndex({
    this.chapters,
    this.transcripts = const <RssPodcastIndexTranscript>[],
    this.soundbites = const <RssPodcastIndexSoundbite>[],
  });

  factory RssItemPodcastIndex.parse(XmlElement element) {
    return RssItemPodcastIndex(
      chapters: RssPodcastIndexChapters.parse(
        findElementOrNull(element, 'podcast:chapters'),
      ),
      transcripts: element
          .findElements('podcast:transcript')
          .map(RssPodcastIndexTranscript.parse)
          .toList(),
      soundbites: element
          .findElements('podcast:soundbite')
          .map(RssPodcastIndexSoundbite.parse)
          .toList(),
    );
  }

  final RssPodcastIndexChapters? chapters;
  final List<RssPodcastIndexTranscript?> transcripts;
  final List<RssPodcastIndexSoundbite?> soundbites;
}
