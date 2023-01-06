import 'dart:convert';

import 'package:flutter/material.dart';

enum ProjectType { professional, personal, library }

class Project {
  final String name;
  final String company;
  final String description;
  final Color color;
  final List<String> images;
  final ProjectType type;

  Project(
    this.name,
    this.company,
    this.description,
    this.color,
    this.images,
    this.type,
  );

  Project.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        company = json['company'],
        description = json['description'],
        color = _getColorFromHex(json['color']),
        images = parseImages(json),
        type = ProjectType.values.byName(json['type']);

  static List<String> parseImages(dynamic json) {
    return List<String>.from(json['images'] as List);
  }

  static Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static Future<String> getJson(BuildContext context) async {
    return DefaultAssetBundle.of(context)
        .loadString('assets/json/portfolio.json');
  }

  static Future<List<Project>> loadAll(BuildContext context) async {
    var portfolioData = jsonDecode(await getJson(context));
    List<dynamic> projectsDynamic =
        (portfolioData["projects"] as List<dynamic>);
    return projectsDynamic.map((e) => Project.fromJson(e)).toList();
  }
}
