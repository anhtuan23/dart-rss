import 'dart:io';
import 'dart:core';
import 'package:test/test.dart';
import 'package:webfeedclient/domain/rss_feed.dart';
import 'package:xml/xml.dart' as xml;

void main() {
  test("parsing Invalid.xml", () {
    var xmlString = new File("test/xml/Invalid.xml").readAsStringSync();
    var doc = xml.parse(xmlString);

    try {
      new RssFeed.parse(doc);
      fail("Should throw Argument Error");
    } on ArgumentError {}
  });
  test("parsing RSS.xml", () {
    var xmlString = new File("test/xml/RSS.xml").readAsStringSync();
    var doc = xml.parse(xmlString);

    var feed = new RssFeed.parse(doc);

    expect(feed.title, "News - Foo bar News");
    expect(feed.description, "Foo bar News and Updates feed provided by Foo bar, Inc.");
    expect(feed.link, "https://foo.bar.news/");
    expect(feed.language, "en-US");
    expect(feed.lastBuildDate, "Mon, 26 Mar 2018 14:00:00 PDT");
    expect(feed.generator, "Custom");
    expect(feed.copyright, "Copyright 2018, Foo bar Inc.");

    expect(feed.image.title, "Foo bar News");
    expect(feed.image.url, "https://foo.bar.news/logo.gif");
    expect(feed.image.link, "https://foo.bar.news/");

    expect(feed.categories.length, 2);
    expect(feed.categories[0].domain, null);
    expect(feed.categories[0].value, "Ipsum");
    expect(feed.categories[1].domain, "news");
    expect(feed.categories[1].value, "Lorem Ipsum");

    expect(feed.items.length, 2);

    expect(feed.items.first.title, "The standard Lorem Ipsum passage, used since the 1500s");
    expect(feed.items.first.description, "Lorem ipsum dolor sit amet, consectetur adipiscing elit");
    expect(feed.items.first.link, "https://foo.bar.news/1");
    expect(feed.items.first.guid, "https://foo.bar.news/1?guid");
    expect(feed.items.first.pubDate, "Mon, 26 Mar 2018 14:00:00 PDT");
    expect(feed.items.first.categories.first.domain, "news");
    expect(feed.items.first.categories.first.value, "Lorem");
  });
}