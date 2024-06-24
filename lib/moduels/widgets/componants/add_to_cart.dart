import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../models/model_product.dart';
import '../../../services/layout/layout_cubit/layout_cubit.dart';
import '../../../services/layout/layout_cubit/layout_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

import '../../../models/user_model.dart';
import '../../../utils/constants/sizes.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key, required this.model});

  //final Product product;
  final ProductModel model;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  File? image;
  Future<void>? launched;

  String? message = "";
  final _picker = ImagePicker();
  bool showSpinner = false;
  AiModel? aiModel;
  int? number;
  Future getImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      uploadImage();
    } else {
      // print('no image selected');
    }
    setState(() {});
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    Dio dio = Dio();

    FormData formData = FormData();

    formData.files
        .add(MapEntry("vton_img", await MultipartFile.fromFile(image!.path)));

    var response = await dio
        .post(
          'https://unified-firmly-walleye.ngrok-free.app/process_image/8',

          //'https://unified-firmly-walleye.ngrok-free.app/api/processHD/2',
          data: formData,
        )
        .toString();

//1. Convert the Gradio response to a string:

//String gradioResponse = await gradio.predict("https://unified-firmly-walleye.ngrok-free.app/process_image/8");

//2. Extract the image path substring:

    String imagePath =
        response.substring(response.lastIndexOf('\\') + 1, response.length);

//3. Send the image path to the other API:

    var responseOutput = await http.post(
      Uri.parse(
          'https://unified-firmly-walleye.ngrok-free.app/api/read-temp-file'),
      body: {'filePath': imagePath},
    );

//*/
    if (responseOutput.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      // Future<void> launchInBrowser() async {
      //   if (!await launchUrl(
      //     response.data["response"]["ouput_path_img"],
      //     mode: LaunchMode.externalApplication,
      //   )) {
      //     throw Exception('Could not launch ');
      //   }
      // }

      Navigator.of(context).push(MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Virtual-Try-On result'),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: showSpinner == false
                  ? Center(
                      child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: const Color(0xFF1A1A3F),
                        rightDotColor: const Color(0xFFEA3799),
                        size: 200,
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 700,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "$responseOutput",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Text(""),
                    ),
            ),
          );
        },
      ));

      // print('image uploaded');
    } else {
      //  print('failed');
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: TSizes.defaultSpace / 2,
            horizontal: TSizes.defaultSpace,
          ),
          decoration: BoxDecoration(
              // color: THelperFunctions.isDarkMode(context)
              //     ? TColors.darkGrey
              //     : TColors.light,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRadiusLg),
                topRight: Radius.circular(TSizes.cardRadiusLg),
              ),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 0.3)
              ]),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 20),
                //height: 30,
                //width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      //color: product.color,
                      ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: getImage,
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => userToken == null
                    //           ? const RegisterPage()
                    //           :

                    cubit.addOrRemoveFromCarts(
                        productID: widget.model.id.toString());

                    // ));
                  },
                  style: ElevatedButton.styleFrom(
                    //minimumSize: const Size(double.infinity, 30),
                    backgroundColor: const Color.fromRGBO(10, 207, 131, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    //backgroundColor: product.color,
                  ),
                  child: Text(
                    "Add to cart".toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
