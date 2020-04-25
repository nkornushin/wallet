import 'package:wallet/models/spending.dart';

DateTime nowDate = DateTime.now();
DateTime yestardayDate = nowDate.subtract(const Duration(days: 1));

List<Spending> spendings = [
  Spending(
    name: 'Watter Bill',
    amount: -250,
    spendingDate: nowDate,
    spendingStatus: SuccessfullySpending(),
    spendingType: WatterSpending(),
  ),
  Spending(
    name: 'Income: Salary ${yestardayDate.month.toString()}',
    amount: 1600,
    spendingDate: yestardayDate,
    spendingStatus: SuccessfullySpending(),
    spendingType: IncomeSpending(),
  ),
  Spending(
    name: 'Electric Bill',
    amount: -450,
    spendingDate: yestardayDate,
    spendingStatus: UnsuccessfullySpending(),
    spendingType: ElectricSpending(),
  ),
  Spending(
    name: 'Internal Bill',
    amount: -100,
    spendingDate: nowDate.subtract(const Duration(days: 2)),
    spendingStatus: PendingSpending(),
    spendingType: OthreSpending(),
  ),
  Spending(
    name: 'Internal Bill',
    amount: -100,
    spendingDate: nowDate.subtract(const Duration(days: 2)),
    spendingStatus: PendingSpending(),
    spendingType: OthreSpending(),
  ),
  Spending(
    name: 'Internal Bill',
    amount: -100,
    spendingDate: nowDate.subtract(const Duration(days: 2)),
    spendingStatus: PendingSpending(),
    spendingType: OthreSpending(),
  ),
];
