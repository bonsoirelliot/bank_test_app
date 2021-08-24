import 'data.dart';

List<CardHistory> history1 = [
  CardHistory('Авиакомпания Россия', 'Путешествия', 12400, true),
  CardHistory('Красное Белое', 'Покупки', 600, true),
  CardHistory('Gortranz', 'Транспорт', 23, true),
  CardHistory('Gortranz', 'Транспорт', 23, true),
];

List<CardHistory> history2 = [
  CardHistory('S7', 'Путешествия', 16500, true),
  CardHistory('Красное Белое', 'Покупки', 600, true),
  CardHistory('Gortranz', 'Транспорт', 23, true),
  CardHistory('Gortranz', 'Транспорт', 23, true),
];

List<CardHistory> history3 = [
  CardHistory('Aeroflot', 'Путешествия', 16500, true),
  CardHistory('Spar', 'Покупки', 1600, true),
  CardHistory('Gortranz', 'Транспорт', 23, true),
  CardHistory('Gortranz', 'Транспорт', 23, true),
];

List<BankCard> cards = [
  BankCard(history1, 450),
  BankCard(history2, 560),
  BankCard(history3, 12)
];
