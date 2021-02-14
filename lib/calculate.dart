import 'package:scoped_model/scoped_model.dart';
import 'package:week4/main.dart';

class flowerModel extends Model {
  List<Flower> cart = [];
  double totalvalue = 0;
  int get total => cart.length;

  void addFlower(item) {
    cart.add(item);
  }

  String calculateTotal() {
    totalvalue = 0;
    cart.forEach((f) {
      totalvalue += f.price;
    });
    return 'Total price: ' + totalvalue.toString() + ' \฿';
  }
}
