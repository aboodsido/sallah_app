import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sallah_app/Views/Widgets/bground_image.dart';

import '../../../../Models/product_model/product_model.dart';
import '../../../../constants/api_consts.dart';
import '../../../Widgets/custom_dialog.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _productNames = [];
  List<String> _productImages = [];

  Future search(String textSearch, context) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${BASE_URL}search'),
        body: {'text': textSearch},
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        ProductModel productModel = ProductModel.fromJson(jsonResponse);

        // Extract the product names
        List<String> productNames = productModel.products
                ?.map((product) => product.name ?? '')
                .toList() ??
            [];
        List<String> productImages = productModel.products
                ?.map((product) => product.image ?? '')
                .toList() ??
            [];

        setState(() {
          _productNames = productNames;
          _productImages = productImages;
        });
      } else {
        CustomDialog.showSnackBar(context, 'There is some error', Colors.red);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color(0xffEDEFED),
                        ),
                        child: TextField(
                          // controller: searchController,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          onChanged: (searchText) async {
                            await search(searchText, context);
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: 'Search',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                  ),
                  itemCount: _productNames.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Image.network(
                            _productImages[index],
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Text(
                            _productNames[index],
                            style: GoogleFonts.roboto(
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
