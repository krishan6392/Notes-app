import 'package:flutter/material.dart';
import 'package:krishan/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Sharing',
    content: 'Cannot Share an Empty NOte',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
