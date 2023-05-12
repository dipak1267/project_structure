
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extension.dart';
import 'app_color.dart';

SizedBox commonTextField(
    {required TextEditingController controller,
    required String hintText,
    bool isPasswordField = false,
    bool obscureText = false,
    int maxLine = 1,
    num hintTextSize = 16,
    double height = 50,
    Color fillColor = whiteColor,
    String? Function(String?)? validation,
    void Function(String)? onChange,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool readOnly = false,
    required Widget suffixIcon}) {
  return SizedBox(
    height: height,
    child: TextFormField(
      readOnly: readOnly,
      onChanged: onChange,
      validator: validation,
      controller: controller,
      maxLines: maxLine,
      autofocus: false,
      style: GoogleFonts.cormorant(
        fontSize: 16,
        color: buttonColor,
        fontWeight: FontWeight.w500,
      ),
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        enabled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: hintTextStyle(
            size: hintTextSize, weight: FontWeight.w500, color: hintTextColor),
        suffixIcon: isPasswordField ? suffixIcon : const SizedBox(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: whiteColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: buttonColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: whiteColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: fillColor,
      ),
    ),
  );
}

/*Widget commonAppBar(
    {required String leadingAsset,
    Function()? leadingOnTap,
    String title = ''}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: leadingOnTap,
        child: commonSvgPicture(image: leadingAsset, boxFit: BoxFit.contain),
      ),
      title.appCommonText(
          size: 28,
          weight: FontWeight.w700,
          color: whiteColor,
          align: TextAlign.center),
      SvgPicture.asset(
        Assets.imagesMenu,
        fit: BoxFit.contain,
        // ignore: deprecated_member_use
        color: Colors.transparent,
      ),
    ],
  );
}*/

Widget commonCircularProgressIndicator() {
  return const Center(
      child: CircularProgressIndicator(
    color: buttonColor,
  ));
}

GestureDetector commonAppButton(
    {required Function() onTap, required String title}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: title.appCommonText(
          color: whiteColor,
          size: 20,
          weight: FontWeight.w700,
          align: TextAlign.end,
        ),
      ),
    ),
  );
}

/*commonSvgPicture(
    {required String image,
    double? height,
    double? width,
    BoxFit boxFit = BoxFit.fill}) {
  return SvgPicture.asset(image, height: height, width: width, fit: boxFit);
}*/
//
// Column commonDropDownContainer(
//     {required OnBoardingController controller,
//     required List<String> items,
//     required String selectedValue}) {
//   return Column(
//     children: [
//       GestureDetector(
//         onTap: () {
//           controller.isOpen = !controller.isOpen;
//         },
//         child: Container(
//           height: 50,
//           decoration: BoxDecoration(
//               border: Border.all(color: buttonColor, width: 2),
//               borderRadius: BorderRadius.circular(10),
//               color: whiteColor),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 (controller.isSelected == ''
//                         ? selectedValue
//                         : controller.isSelected)
//                     .appCommonText(
//                         color: blackTextColor,
//                         size: 18,
//                         weight: FontWeight.w500,
//                         align: TextAlign.start),
//                 SvgPicture.asset(Assets.imagesDropDown)
//               ],
//             ),
//           ),
//         ),
//       ),
//       5.H(),
//       controller.isOpen
//           ? AnimatedContainer(
//               width: Get.width,
//               decoration: BoxDecoration(
//                   border: Border.all(color: whiteColor, width: 2),
//                   borderRadius: BorderRadius.circular(10),
//                   color: whiteColor),
//               duration: const Duration(seconds: 1),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: List.generate(
//                     items.length,
//                     (index) => GestureDetector(
//                       onTap: () {
//                         selectedValue = items[index];
//                         controller.isSelected = selectedValue;
//                         controller.isOpen = !controller.isOpen;
//                         controller.update();
//                       },
//                       child: Container(
//                         width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: items[index].appCommonText(
//                               color: (controller.isSelected == ''
//                                           ? selectedValue
//                                           : controller.isSelected) ==
//                                       items[index]
//                                   ? buttonColor
//                                   : blackTextColor,
//                               size: 20,
//                               weight: FontWeight.w500,
//                               align: TextAlign.start),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           : SizedBox(),
//     ],
//   );
// }

// Widget customDropDown(
//     {required List<String> item, required String initialValue}) {
//   return CustomDropdown<int>(
//     onChange: (int value, int index) => log(value),
//     dropdownButtonStyle: DropdownButtonStyle(
//       width: Get.width,
//       borderRadius: BorderRadius.circular(20),
//       height: 50,
//       elevation: 2,
//       backgroundColor: whiteColor,
//       primaryColor: blackTextColor,
//     ),
//     dropdownStyle: DropdownStyle(
//       borderRadius: BorderRadius.circular(8),
//       elevation: 6,
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//     ),
//     items: item
//         .asMap()
//         .entries
//         .map(
//           (item) => DropdownItem<int>(
//             value: item.key + 1,
//             child: item.value.appCommonText(
//                 color: blackTextColor,
//                 size: 18,
//                 weight: FontWeight.w500,
//                 align: TextAlign.start),
//           ),
//         )
//         .toList(),
//     child: initialValue.appCommonText(
//         color: blackTextColor,
//         size: 18,
//         weight: FontWeight.w500,
//         align: TextAlign.start),
//   );
// }
