class PersonPay {
  String name;
  String message;
  String number;
  String image;

  PersonPay({this.image, this.message, this.name, this.number});

  void changeImage(String img) {
    image = img;
  }
}
