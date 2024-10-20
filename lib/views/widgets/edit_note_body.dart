import 'package:flutter/material.dart';
import 'package:notes_app_2/views/widgets/custom_app_bar.dart';
import 'package:notes_app_2/views/widgets/custom_text_form_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextFormField(
            label: 'Title',
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            label: 'Content',
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
