import 'package:flutter/material.dart';
import 'package:notes_app_2/views/widgets/custom_button.dart';
import 'package:notes_app_2/views/widgets/custom_text_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          //for Title
          CustomTextFormField(
            label: 'Title',
          ),
          SizedBox(
            height: 16,
          ),
          //for content
          CustomTextFormField(
            label: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 24,
          ),
          CustomButton(),
          SizedBox(
            height: 24,
          ),
        ]),
      ),
    );
  }
}
