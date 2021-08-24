class CardHistory {
  final String companyName;
  final String cathegory;
  final double price;
  final bool isTreat;

  CardHistory(this.companyName, this.cathegory, this.price, this.isTreat);
}

class BankCard {
  final List<CardHistory> history;
  final double balance;

  BankCard(this.history, this.balance);
}
