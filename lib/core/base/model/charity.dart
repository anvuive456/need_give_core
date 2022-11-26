
import 'package:need_give_core/core/enums/charity_type.dart';

class Charity {
  final List<CharityItem> items;
  final int amount;
  final int createdAt;

  const Charity({this.items = const [], this.amount = 0, this.createdAt = -1});

  Charity copyWith({List<CharityItem>? items}) {
    return Charity(items: items ?? this.items);
  }

  factory Charity.fromJson(Map<String, dynamic> json) {
    return Charity(
        amount: json['amount'] ?? 0,
        createdAt: DateTime.tryParse(json['createdAt'] ?? '')
                ?.millisecondsSinceEpoch ??
            -1,
        items: json['charityItems'] == null
            ? []
            : (json['charityItems'] as List)
                .map((e) => CharityItem.fromJson(e))
                .toList());
  }
}

class CharityItem {
  final String name;
  final CharityType type;
  final int amount;

  const CharityItem(
      {this.type = CharityType.food, this.amount = 0, this.name = ''});

  CharityItem copyWith({
    int? amount,
    CharityType? type,
    String? name,
  }) {
    return CharityItem(
        type: type ?? this.type,
        amount: amount ?? this.amount,
        name: name ?? this.name);
  }

  factory CharityItem.fromJson(Map<String, dynamic> json) {
    CharityType type;
    if (json['type'] == null) type = CharityType.unknown;
    switch (json['type']) {
      case 'cloth':
        type = CharityType.cloth;
        break;
      case 'food':
        type = CharityType.food;
        break;
      case 'work':
        type = CharityType.work;
        break;
      case 'money':
        type = CharityType.money;
        break;
      default:
        type = CharityType.unknown;
    }

    return CharityItem(
        type: type, name: json['name'] ?? '', amount: json['amount'] ?? 0);
  }

  @override
  String toString() {
    return 'CharityItem{name: $name, type: $type, amount: $amount}';
  }
}
