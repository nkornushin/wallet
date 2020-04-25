enum CardType {
  Visa,
  MasterCard,
}

class CreditCard {
  CreditCard({
    this.clientName,
    this.bankName,
    this.cardNumberFirst,
    this.cardNumberLast,
    this.balance,
    this.cardType,
  });

  final String clientName;
  final String bankName;
  final String cardNumberFirst;
  final String cardNumberLast;
  final String balance;
  final CardType cardType;
}
