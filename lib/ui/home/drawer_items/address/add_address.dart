import 'package:flutter/material.dart';
import 'package:flutter_responsiveness/flutter_responsiveness.dart';
import 'package:pharmacity/constants/colors.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController addressLine1Contoller = TextEditingController();
  TextEditingController addressLine2Contoller = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  FocusNode addressLine1FocusNode = FocusNode();
  FocusNode addressLine2FocusNode = FocusNode();
  FocusNode landmarkFocusNode = FocusNode();
  FocusNode pincodeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 24 * ScreenSize.heightMultiplyingFactor,
          ),
        ),
        backgroundColor: COLORS.primary,
        title: Text(
          "New Address",
          style: TextStyle(
            fontSize: 18 * ScreenSize.heightMultiplyingFactor,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewPortConstraints) {
          return Container(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewPortConstraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        textAlign: TextAlign.left,
                        controller: addressLine1Contoller,
                        style: TextStyle(
                          fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.location_history,
                            size: 24 * ScreenSize.heightMultiplyingFactor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Address Line',
                          hintText: "Flat No., Building Name",
                          hintStyle: TextStyle(
                              fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                              color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(addressLine2FocusNode);
                        },
                      ),
                      // ),
                      SizedBox(
                        height: 16 * ScreenSize.heightMultiplyingFactor,
                      ),
                      TextField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        controller: addressLine2Contoller,
                        style: TextStyle(
                          fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.streetview_outlined,
                            size: 24 * ScreenSize.heightMultiplyingFactor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Street Name',
                          hintText: 'Street Name',
                          hintStyle: TextStyle(
                              fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                              color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: addressLine2FocusNode,
                        onChanged: (value) {},
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(landmarkFocusNode);
                        },
                      ),

                      // ),
                      SizedBox(
                        height: 16 * ScreenSize.heightMultiplyingFactor,
                      ),
                      TextField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        controller: landmarkController,
                        style: TextStyle(
                          fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.near_me,
                            size: 24 * ScreenSize.heightMultiplyingFactor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Landmark',
                          hintText: 'Nearest Landmark',
                          hintStyle: TextStyle(
                              fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                              color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: landmarkFocusNode,
                        onChanged: (value) {},
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(pincodeFocusNode);
                        },
                      ),
                      // ),
                      SizedBox(
                        height: 16 * ScreenSize.heightMultiplyingFactor,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.text,
                              controller: pincodeController,
                              enabled: false,
                              style: TextStyle(
                                fontSize:
                                    16 * ScreenSize.heightMultiplyingFactor,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.location_city,
                                  size: 24 * ScreenSize.heightMultiplyingFactor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'City',
                                hintStyle: TextStyle(
                                    fontSize:
                                        16 * ScreenSize.heightMultiplyingFactor,
                                    color: Colors.grey),
                              ),
                              textInputAction: TextInputAction.next,
                              focusNode: pincodeFocusNode,
                              onChanged: (value) {},
                              onEditingComplete: () {},
                            ),
                          ),
                          SizedBox(
                            width: 10.0 * ScreenSize.widthMultiplyingFactor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16 * ScreenSize.heightMultiplyingFactor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
