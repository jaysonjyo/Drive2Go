class TermsConditionModelClass {
  TermsConditionModelClass({
      this.id, 
      this.title, 
      this.content, 
      this.effectiveDate, 
      this.sections, 
      this.version, 
      this.v,});

  TermsConditionModelClass.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    content = json['content'];
    effectiveDate = json['effectiveDate'];
    if (json['sections'] != null) {
      sections = [];
      json['sections'].forEach((v) {
        sections?.add(Sections.fromJson(v));
      });
    }
    version = json['version'];
    v = json['__v'];
  }
  String? id;
  String? title;
  String? content;
  String? effectiveDate;
  List<Sections>? sections;
  String? version;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['effectiveDate'] = effectiveDate;
    if (sections != null) {
      map['sections'] = sections?.map((v) => v.toJson()).toList();
    }
    map['version'] = version;
    map['__v'] = v;
    return map;
  }

}

class Sections {
  Sections({
      this.sectionTitle, 
      this.sectionContent, 
      this.id,});

  Sections.fromJson(dynamic json) {
    sectionTitle = json['sectionTitle'];
    sectionContent = json['sectionContent'];
    id = json['_id'];
  }
  String? sectionTitle;
  String? sectionContent;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sectionTitle'] = sectionTitle;
    map['sectionContent'] = sectionContent;
    map['_id'] = id;
    return map;
  }

}