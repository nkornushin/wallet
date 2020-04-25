import 'package:flutter/material.dart';

class Spending {
  Spending({
    this.name,
    this.spendingType,
    this.amount,
    this.spendingStatus,
    this.spendingDate,
  });

  final String name;
  final SpendingType spendingType;
  final double amount;
  final SpendingStatus spendingStatus;
  final DateTime spendingDate;
}

abstract class SpendingStatus {}

class SuccessfullySpending implements SpendingStatus {
  @override
  String toString() {
    return 'Successfully';
  }
}

class UnsuccessfullySpending implements SpendingStatus {
  @override
  String toString() {
    return 'Unsuccessfully';
  }
}

class PendingSpending implements SpendingStatus {
  @override
  String toString() {
    return 'Pending';
  }
}

abstract class SpendingType {
  @override
  String toString();

  Icon toIcon();
  Color toColor();
}

class WatterSpending implements SpendingType {
  @override
  Icon toIcon() {
    return Icon(
      Icons.invert_colors,
      color: Colors.white,
    );
  }

  @override
  Color toColor() {
    return const Color(0xFF3629B7);
  }
}

class ElectricSpending implements SpendingType {
  @override
  Icon toIcon() {
    return Icon(
      Icons.battery_charging_full,
      color: Colors.white,
    );
  }

  @override
  Color toColor() {
    return const Color(0xFF0890FE);
  }
}

class IncomeSpending implements SpendingType {
  @override
  Icon toIcon() {
    return Icon(
      Icons.subdirectory_arrow_left,
      color: Colors.white,
    );
  }

  @override
  Color toColor() {
    return const Color(0xFF52D5BA);
  }
}

class OthreSpending implements SpendingType {
  @override
  Icon toIcon() {
    return Icon(
      Icons.info,
      color: Colors.white,
    );
  }

  @override
  Color toColor() {
    return const Color(0xFFFFAF2A);
  }
}
