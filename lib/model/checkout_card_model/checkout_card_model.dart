class CheckoutCartModel {
  final String id;
  final String img;
  final String name;
  final String totalPrice;
  final String selectedDays;
  final String perdayprice;

  CheckoutCartModel(
      {required this.id,
      required this.img,
      required this.name,
      required this.totalPrice,
      required this.selectedDays,
      required this.perdayprice});
}
