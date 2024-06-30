import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/my_products/provider/my_products_controller.dart';
import 'package:rent_cruise/features/upload_products/provider/upload_product_controller.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class UploadProducts extends StatefulWidget {
  final String? name;
  final bool idEdit;
  final String? documentId;
  final String? descrition;
  final String? price;
  final String? mainImage;
  final String? subImage1;
  final String? subImage2;
  final String? subImage3;
  final String? subImage4;
  const UploadProducts(
      {super.key,
      this.name,
      this.documentId,
      this.descrition,
      this.price,
      this.mainImage,
      this.subImage1,
      this.subImage2,
      this.subImage3,
      this.subImage4,
      required this.idEdit});

  @override
  State<UploadProducts> createState() => _UploadProductsState();
}

class _UploadProductsState extends State<UploadProducts> {
  TextEditingController _productName = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider =
        Provider.of<UploadProductControllr>(context, listen: false);
    provider.getCategoris();

    _priceController.text = widget.price ?? '';
    _productName.text = widget.name ?? '';
    _description.text = widget.descrition ?? '';
    provider.mainImageUrl = widget.mainImage ?? '';
    provider.athorImage1 = widget.subImage1 ?? '';
    provider.athorImage2 = widget.subImage2 ?? '';
    provider.athorImage3 = widget.subImage3 ?? '';
    provider.athorImage4 = widget.subImage4 ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Upload Your Products",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _productName,
                decoration: InputDecoration(
                  hintMaxLines: 4,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Product Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _description,
                maxLines: 5,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Description",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "Price / day",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<UploadProductControllr>(
              builder: (context, provider, _) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Category: ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    if (provider.items.isNotEmpty)
                      DropdownButton(
                        elevation: 0,
                        value: provider.dropdownvalue,
                        items: provider.items.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: ColorConstant.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            Provider.of<UploadProductControllr>(context,
                                    listen: false)
                                .setDropdownValue(newValue);
                          }
                        },
                      ),
                    if (provider.items.isEmpty) Text("No Category"),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Text(
                    "Upload one Main Photo",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Consumer<UploadProductControllr>(builder: (context, provider, _) {
              return provider.mainImageUrl != null
                  ? Stack(
                      children: [
                        Container(
                          width: 350,
                          height: 200,
                          child: Image.network(provider.mainImageUrl ?? ''),
                        ),
                        GestureDetector(
                            onTap: () {
                              Provider.of<UploadProductControllr>(context,
                                      listen: false)
                                  .removeImages(0);
                            },
                            child: Icon(Icons.delete_outline)),
                      ],
                    )
                  : GestureDetector(
                      onTap: () async {
                        XFile? image = await ImagePicker()
                            .pickImage(source: ImageSource.camera);

                        if (image != null) {
                          Provider.of<UploadProductControllr>(context,
                                  listen: false)
                              .uploadMainImage(image);
                        }
                      },
                      child: Container(
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.grey[800],
                        ),
                      ),
                    );
            }),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Text(
                    "Upload some photos",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Consumer<UploadProductControllr>(
                        builder: (context, provider, _) {
                      return provider.athorImage1 != null
                          ? Stack(
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        provider.athorImage1 ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Provider.of<UploadProductControllr>(
                                              context,
                                              listen: false)
                                          .removeImages(1);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.delete_outline),
                                    ))
                              ],
                            )
                          : GestureDetector(
                              onTap: () async {
                                XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (image != null) {
                                  Provider.of<UploadProductControllr>(context,
                                          listen: false)
                                      .uploadAthorImage1(image);
                                }
                              },
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.add),
                                  )),
                            );
                    }),
                    SizedBox(width: 10),
                    Consumer<UploadProductControllr>(
                        builder: (context, provider, _) {
                      return provider.athorImage2 == null
                          ? GestureDetector(
                              onTap: () async {
                                XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (image != null) {
                                  Provider.of<UploadProductControllr>(context,
                                          listen: false)
                                      .uploadAthorImage2(image);
                                }
                              },
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.add),
                                  )),
                            )
                          : Stack(
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        provider.athorImage2 ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Provider.of<UploadProductControllr>(
                                              context,
                                              listen: false)
                                          .removeImages(2);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.delete_outline),
                                    ))
                              ],
                            );
                    }),
                    SizedBox(width: 10),
                    Consumer<UploadProductControllr>(
                        builder: (context, provider, _) {
                      return provider.athorImage3 == null
                          ? GestureDetector(
                              onTap: () async {
                                XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (image != null) {
                                  Provider.of<UploadProductControllr>(context,
                                          listen: false)
                                      .uploadAthorImage3(image);
                                }
                              },
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.add),
                                  )),
                            )
                          : Stack(
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        provider.athorImage3 ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Provider.of<UploadProductControllr>(
                                              context,
                                              listen: false)
                                          .removeImages(3);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.delete_outline),
                                    ))
                              ],
                            );
                    }),
                    SizedBox(width: 10),
                    Consumer<UploadProductControllr>(
                        builder: (context, provider, _) {
                      return provider.athorImage4 == null
                          ? GestureDetector(
                              onTap: () async {
                                XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);

                                if (image != null) {
                                  Provider.of<UploadProductControllr>(context,
                                          listen: false)
                                      .uploadAthorImage4(image);
                                }
                              },
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.add),
                                  )),
                            )
                          : Stack(
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        provider.athorImage4 ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Provider.of<UploadProductControllr>(
                                              context,
                                              listen: false)
                                          .removeImages(4);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.delete_outline),
                                    ))
                              ],
                            );
                    })
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            widget.idEdit
                ? GestureDetector(
                    onTap: () {
                      final provider = Provider.of<UploadProductControllr>(
                          context,
                          listen: false);
                      Provider.of<MyProductsController>(context, listen: false)
                          .editProduct(
                              context: context,
                              name: _productName.text,
                              des: _description.text,
                              price: _priceController.text,
                              athorImage1: provider.athorImage1.toString(),
                              athorImage2: provider.athorImage2.toString(),
                              athorImage3: provider.athorImage3.toString(),
                              athorImage4: provider.athorImage3.toString(),
                              category: provider.dropdownvalue,
                              documnetid: widget.documentId.toString(),
                              mainImage: provider.mainImageUrl.toString());
                    },
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      Provider.of<UploadProductControllr>(context,
                              listen: false)
                          .uploadProduct(
                              context: context,
                              name: _productName.text,
                              des: _description.text,
                              price: _priceController.text);
                    },
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Upload",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
