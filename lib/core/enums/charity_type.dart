enum CharityType {
  money, //= 'money',
  // work, //= 'work',
  food, //= 'food',
  cloth, //= 'cloth',
  unknown;

  String get name {
    switch (this) {
      case CharityType.money:
        return 'Tiền';
      case CharityType.food:
        return 'Thức ăn';
      case CharityType.cloth:
        return 'Quần áo';
      // case CharityType.work:
      //   return 'Công sức';
      default:
        return '';
    }
  }

  String get value {
    switch (this) {
      case CharityType.money:
        return 'money';
      case CharityType.food:
        return 'food';
      case CharityType.cloth:
        return 'cloth';
      // case CharityType.work:
      //   return 'work';
      default:
        return 'unknown';
    }
  }
}
