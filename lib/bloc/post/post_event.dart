abstract class PostEvent {}

class TitleChanged extends PostEvent {
  final String title;
  TitleChanged(this.title);
}

class PriceSelected extends PostEvent {
  final int price;
  PriceSelected(this.price);
}

class DeliveryTimeSelected extends PostEvent {
  final String time;
  DeliveryTimeSelected(this.time);
}

class ToggleUrgency extends PostEvent {
  final bool urgent;
  ToggleUrgency(this.urgent);
}

class DescriptionChanged extends PostEvent {
  final String description;
  DescriptionChanged(this.description);
}

class CustomPriceEntered extends PostEvent {
  final String price;
  CustomPriceEntered(this.price);
}


class SubmitPost extends PostEvent {}
