class TaskModel {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? trailingInfo;
  final String? tag;
  final bool? completed;
  final String? price;

  TaskModel({
    this.title,
     this.subtitle,
    this.id,
     this.trailingInfo,
     this.tag,
     this.price,
    this.completed = false,
  });
}