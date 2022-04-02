class AddressModel {
  String addressLine1;
  String addressLine2;
  String landmark;
  String pincode;

  AddressModel(
      {this.addressLine1, this.addressLine2, this.landmark, this.pincode});
}

List<AddressModel> addresses = [
  AddressModel(
      addressLine1: "19/4, Urvashi",
      addressLine2: "Bengal Ambuja, City Center",
      landmark: "DC cinema",
      pincode: "713216"),
  AddressModel(
      addressLine1: "11/12, Newton",
      addressLine2: "B-Zone",
      landmark: "DSP Main Hospital",
      pincode: "700407"),
  AddressModel(
      addressLine1: "6/12, Bidhan Park",
      addressLine2: "Bidhannagar, Durgapur",
      landmark: "Durgapur Sub-Divisional Hospital",
      pincode: "720192")
];
