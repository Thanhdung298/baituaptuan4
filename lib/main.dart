import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Danh sach san pham',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      // home: ProductListScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            );
          },
          child: Text("Go to ProductListScreen"),
        ),
      ),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late List<Product> products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = [];
    fetchProducts();
  }

  List<Product> convertMapToProductList(Map<String, dynamic> data) {
    List<Product> productList = [];
    data.forEach((key, value) {
      for (int i = 0; i < value.length; i++) {
        Product product = Product(
            search_image: value[i]["search_image"] ?? "",
            styleid: value[i]["styleid"] ?? 0,
            brands_filter_facet: value[i]["brands_filter_facet"] ?? "",
            price: value[i]["price"] ?? "",
            product_additional_info: value[i]["product_additional_info"] ?? "");
        productList.add(product);
      }
    });
    return productList;
  }

  Future<void> fetchProducts() async {
    Map<String, dynamic> data = {
      "product": [
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/10271347/2019/10/24/2286c5fb-f5c2-436d-ac0a-4e41c79831b51571906926278-Nike-Men-Black-Solid-Standard-Fit-NSW-CE-PK-BASIC-DRI-FIT-Tr-1.jpg",
          "styleid": "10271347",
          "brands_filter_facet": "Nike",
          "price": "3551",
          "product_additional_info": "Men NSW CE DRI-FIT Tracksuit"
        },
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/10588800/2019/11/27/4e404162-53e0-4361-9730-be891993ab7a1574846180854-AS-M-NSW-JGGR-PLAYRS-WVN-NFS-5911574846178266-1.jpg",
          "styleid": "10588800",
          "brands_filter_facet": "Nike",
          "price": "2396",
          "product_additional_info": "Men NSW PLAYRS Solid Joggers"
        },
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/10609404/2019/9/28/6c49897e-51f9-4e4d-a5ee-9675029133cc1569655735440-Nike-Sportswear-Club-1711569655734185-1.jpg",
          "styleid": "10609404",
          "brands_filter_facet": "Nike",
          "price": "1996",
          "product_additional_info": "Dri-FIT CLUB JSY Solid Joggers"
        },
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/10714242/2019/11/29/57e3a3c3-a7a2-405b-a596-3246d60ff0dc1575017786189-Nike-Men-Grey-DOWNSHIFTER-7-Running-Shoes-741575017783904-1.jpg",
          "styleid": "10714242",
          "brands_filter_facet": "Nike",
          "price": "3196",
          "product_additional_info": "Men DOWNSHIFTER Running Shoes"
        },
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/10714390/2019/12/2/864258a3-4107-4a76-8aab-3fb4cda1e9a01575283695267-Nike-Men-Grey-Solid-Retaliation-2-Training-Shoes-19015752836-1.jpg",
          "styleid": "10714390",
          "brands_filter_facet": "Nike",
          "price": "5096",
          "product_additional_info": "Retaliation 2 Training Shoes"
        },
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/10762822/2019/12/9/111aaeb8-a27b-4a65-9235-b9100b0755771575890754263-AS-M-NK-THRMA-PANT-TAPER-NFS-1311575890751027-1.jpg",
          "styleid": "10762822",
          "brands_filter_facet": "Nike",
          "price": "2316",
          "product_additional_info": "AS THRMA PANT TAPER Joggers"
        },
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/11045412/2020/1/27/e6960eab-d26b-4f6c-9112-b1e1df81acf91580110510954-Nike-Men-Sports-Shoes-6361580110509597-1.jpg",
          "styleid": "11045412",
          "brands_filter_facet": "Nike",
          "price": "3371",
          "product_additional_info": "Men FLY.BY MID Shoes"
        },
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/11045422/2020/1/24/a472de0d-dfae-48ec-8ec4-5c11e4c5c0d51579847880420-Nike-Unisex-Grey-Textile-Basketball-Shoes-1861579847879011-1.jpg",
          "styleid": "11045422",
          "brands_filter_facet": "Nike",
          "price": "4121",
          "product_additional_info": "Unisex PRECISION Basketball"
        },
        {
          "search_image":
              "http://assets.myntassets.com/assets/images/11045460/2020/1/23/209cbeb0-f10b-4890-aa43-747407e31a881579765130081-Nike-Women-Sports-Shoes-8941579765128777-1.jpg",
          "styleid": "11045460",
          "brands_filter_facet": "Nike",
          "price": "2996",
          "product_additional_info": "Women DOWNSHIFTER 9 Shoes"
        }
      ]
    };
    setState(() {
      products = convertMapToProductList(data);
    });
    // final response = await http.get(Uri.parse(""));
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> data = json.decode(response.body);
    //   setState(() {
    //     products = convertMapToProductList(data);
    //   });
    // } else {
    //   throw Exception("Khong load duoc du lieu");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sach san pham"),
      ),
      body: products != null
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].brands_filter_facet),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price: ${products[index].price}"),
                      Text(
                          "product_additional_info: ${products[index].product_additional_info}"),
                    ],
                  ),
                  leading: Image.network(
                    products[index].search_image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class Product {
  String search_image;
  String styleid;
  String brands_filter_facet;
  String price;
  String product_additional_info;

  Product(
      {required this.search_image,
      required this.styleid,
      required this.brands_filter_facet,
      required this.price,
      required this.product_additional_info});
}
