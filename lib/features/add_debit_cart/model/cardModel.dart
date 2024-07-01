class CardModel {
  final String name;
  final String accountNumber;
  final String expiryDate;
  final String bankName;
  final String cvv;

  CardModel({
    required this.bankName,
    required this.name,
    required this.accountNumber,
    required this.expiryDate,
    required this.cvv,
  });
}
