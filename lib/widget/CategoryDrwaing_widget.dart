import 'package:flutter/material.dart';

class DrawingCategories {
  static Widget genderSelectCategory({
    required String text,
    required dynamic onChanged,
    required String selected,
  }) {
    List<String> genderList = ['Man', 'Woman', 'Nothing'];
    return basickCategory(
        text: text,
        widget: DropdownButton(
          value: selected,
          onChanged: onChanged,
          items: genderList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  static Widget dateSelectCategory({
    required String text,
    required Function onDateChangeCallback,
  }) {
    return Column(
      children: [
        basickCategory(
          text: text,
          widget: const Text("asd"),
        ),
      ],
    );
  }

  static Widget inputTextCategory({
    required String text,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
  }) {
    return basickCategory(
        text: text,
        widget: TextFormField(
          onSaved: onSaved,
          validator: validator,
        ));
  }

  static Widget basickCategory({
    required String text,
    required Widget widget,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: widget,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
