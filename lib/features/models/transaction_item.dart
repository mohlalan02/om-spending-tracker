class TransactionItem {
  final String merchant;
  final String amount;
  final String category;

  const TransactionItem({
    required this.merchant,
    required this.amount,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'merchant': merchant,
      'amount': amount,
      'category': category,
    };
  }

  factory TransactionItem.fromJson(
    Map<dynamic, dynamic> json,
  ) {
    return TransactionItem(
      merchant: json['merchant'],
      amount: json['amount'],
      category: json['category'],
    );
  }
}