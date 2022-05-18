import 'package:flutter/material.dart';

final _icons = <String, IconData> {
  'edit' : Icons.edit,
  'input' : Icons.input,
  'account_balance_wallet_rounded' : Icons.account_balance_wallet_rounded,
  'list' : Icons.list,
  'add_to_photos_sharp' : Icons.add_to_photos_sharp,
  'align_horizontal_left_sharp' : Icons.align_horizontal_left_sharp,
  'pets' : Icons.pets
};

IconData getIcon(String iconName) {
  return _icons[iconName] ?? Icons.not_interested;
}