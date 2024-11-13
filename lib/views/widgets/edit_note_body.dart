import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_2/constants.dart';
import 'package:notes_app_2/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app_2/models/note_model.dart';
import 'package:notes_app_2/views/widgets/colors_list_view.dart';
import 'package:notes_app_2/views/widgets/custom_app_bar.dart';
import 'package:notes_app_2/views/widgets/custom_text_form_field.dart';
import 'package:notes_app_2/views/widgets/edit_notes_color.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFormField(
            onChanged: (value) {
              title = value;
            },
            label: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onChanged: (value) {
              content = value;
            },
            label: widget.note.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
