import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:week4/calculate.dart';

void main() {
  runApp(MyApp(
    model: flowerModel(),
  ));
}

class MyApp extends StatelessWidget {
  final flowerModel model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<flowerModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlowerShop',
        home: Listview(),
      ),
    );
  }
}

class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[30],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Flower Shop'),
      ),
      body: ListView.builder(
          itemExtent: 80,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ScopedModelDescendant<flowerModel>(
                builder: (context, child, model) {
              return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(itemList[index].image)),
                  title: Text(itemList[index].title),
                  subtitle: Text('\฿' + itemList[index].price.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    model.addFlower(itemList[index]);
                    print('Add to cart: ' + itemList[index].title);
                    print(model.calculateTotal());
                  });
            });
          }),
    );
  }
}

class Flower {
  int price;
  int id;
  String title;
  String image;
  Flower(
      {@required this.price,
      @required this.id,
      @required this.title,
      @required this.image});
}

List<Flower> itemList = [
  Flower(
      id: 1,
      title: 'Rose',
      image: 'assets/images/rose.jpg',
      price: 250),
  Flower(
      id: 2,
      title: 'Forget Me Not',
      image: 'assets/images/forgetmenot.jpg',
      price: 100),
  Flower(
      id: 3,
      title: 'Daisy',
      image: 'assets/images/daisy.jpg',
      price: 120),
  Flower(
      id: 4,
      title: 'Lavender',
      image: 'assets/images/lavender.jpg',
      price: 500),
  Flower(
      id: 5,
      title: 'Tulip',
      image: 'assets/images/tulip.jpg',
      price: 650),
  Flower(
      id: 6,
      title: 'Verbena',
      image: 'assets/images/verbena.jpg',
      price: 430),
  Flower(
      id: 7,
      title: 'Wallflower',
      image: 'assets/images/wallflower.jpg',
      price: 340),
  Flower(
      id: 8,
      title: 'Narcissus Prosecco',
      image: 'assets/images/narcissus.jpg',
      price: 900),
  Flower(
      id: 9,
      title: 'Jasmine',
      image: 'assets/images/jasmine.jpg',
      price: 110),
  Flower(
      id: 10,
      title: 'Gerbera',
      image: 'assets/images/gerbera.jpg',
      price: 230),
];
