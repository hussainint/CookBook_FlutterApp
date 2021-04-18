import 'Items.dart';

class ItemStore {
  List<Items> data = [];

  void addItem(Items dt) {
    data.add(dt);
  }

  List<Items> getItems() {
    return data;
  }
}
