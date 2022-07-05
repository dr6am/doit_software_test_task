import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class ItemsManager extends InheritedWidget {
  ItemsManager({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final ValueNotifier<Iterable<String>> items =
      ValueNotifier<Iterable<String>>(genItems(length: 2000));

  void addItem(String item) {
    //to fast check works, I decided to insert to 0 index
    final Iterable<String> newData = <String>[item, ...items.value];
    items.value = newData;
  }

  static ItemsManager of(BuildContext context) {
    final ItemsManager? result =
        context.dependOnInheritedWidgetOfExactType<ItemsManager>();
    assert(result != null, 'No Items found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ItemsManager old) {
    return old.items != items;
  }
}
