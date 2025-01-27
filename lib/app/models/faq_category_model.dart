import 'parents/model.dart';

class FaqCategory extends Model {
  String? name;

  FaqCategory({String? id, this.name}) {
    this.id = id;
  }

  FaqCategory.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
