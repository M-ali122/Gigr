class PostState {
  final String title;
  final int price;
  final String deliveryTime;
  final bool urgent;
  final String description;
  final bool isSubmitting;
  final bool isCustomPrice;
  final String customPrice;

  const PostState({
    this.title = '',
    this.price = 100,
    this.deliveryTime = '1 day',
    this.urgent = false,
    this.description = '',
    this.isSubmitting = false,
    this.isCustomPrice = false,
    this.customPrice = '',
  });

  PostState copyWith({
    String? title,
    int? price,
    String? deliveryTime,
    bool? urgent,
    String? description,
    bool? isSubmitting,
    bool? isCustomPrice,     // ✅ new
    String? customPrice,     // ✅ new
  }) {
    return PostState(
      title: title ?? this.title,
      price: price ?? this.price,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      urgent: urgent ?? this.urgent,
      description: description ?? this.description,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isCustomPrice: isCustomPrice ?? this.isCustomPrice,
      customPrice: customPrice ?? this.customPrice,
    );
  }
}
