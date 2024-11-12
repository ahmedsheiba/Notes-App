import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_2/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_2/models/note_model.dart';
import 'package:notes_app_2/views/widgets/custom_button.dart';
import 'package:notes_app_2/views/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(children: [
        const SizedBox(
          height: 30,
        ),
        //for Title
        CustomTextFormField(
          onSaved: (value) {
            title = value;
          },
          label: 'Title',
        ),
        const SizedBox(
          height: 16,
        ),
        //for content
        CustomTextFormField(
          onSaved: (value) {
            subTitle = value;
          },
          label: 'Content',
          maxLines: 5,
        ),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
          return CustomButton(
            isLoading: state is AddNoteLoading ? true : false,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var currentDate = DateTime.now();
                var formattedCurrentDate =
                    DateFormat('dd-MM-yyyy').format(currentDate);
                var noteModel = NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: formattedCurrentDate,
                    color: Colors.blue.value);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          );
        }),
        const SizedBox(
          height: 24,
        ),
      ]),
    );
  }
}
