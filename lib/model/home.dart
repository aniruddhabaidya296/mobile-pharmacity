import 'package:pharmacity/ui/home/home_screen.dart';

class HomeModel {
  String url;
  String title;
  String subtitle;
  String bedrooms;
  String bathrooms;
  String price;

  HomeModel(
      {this.url,
      this.title,
      this.subtitle,
      this.bathrooms,
      this.bedrooms,
      this.price});
}

List<HomeModel> homes = [
  HomeModel(
      url: "assets/images/blackmodernhouse.jpg",
      title: "Black Modern House",
      subtitle: "Broadway Street, New York",
      bathrooms: "2",
      bedrooms: "5",
      price: "820"),
  HomeModel(
      url: "assets/images/bungalow.jpg",
      title: "Bungalow",
      subtitle: "Cincinati, Illinois",
      bathrooms: "2",
      bedrooms: "3",
      price: "650"),
  HomeModel(
      url: "assets/images/house.jpg",
      title: "Family House",
      subtitle: "Cupertino, CA",
      bathrooms: "2",
      bedrooms: "2",
      price: "300")
];
