import 'package:flutter/material.dart';




class UiController {
  BuildContext context;



  UiController({
    required this.context
  });



  void showDialogBox(Map<String, dynamic> obj) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(obj["title"]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (obj["message"] != null) Text(obj["message"]),
            ],
          ),
          actions: [
            if (obj["onConfirm"] != null)
            TextButton(
              onPressed: () {
                obj["onConfirm"]();
                Navigator.of(dialogContext).pop();
              },
              child: Text(obj["confirmText"] ?? "OK"),
            ),
            if (obj["onCancel"] != null)
            TextButton(
              onPressed: () {
                obj["onCancel"]();
                Navigator.of(dialogContext).pop();
              },
              child: Text(obj["onCancelText"] ?? "Ακύρωση"),
            ),
            if (obj["onCancel"] == null && obj["onConfirm"] == null)
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text("Εντάξει"),
            ),
          ],
        );
      },
    );
  }


  void showInputDialog(Map<String, dynamic> obj) {
    TextEditingController truckCapacity = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(obj["title"] ?? "Χωρητικότητα φορτηγού"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (obj["message"] != null) Text(obj["message"]),
                  TextField(
                    controller: truckCapacity,
                    decoration: InputDecoration(labelText: obj["capacityLabel"] ?? "Αριθμός"),
                  ),
                  
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: Text(obj["cancelText"] ?? "Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (obj["onConfirm"] is Function) {
                      obj["onConfirm"](truckCapacity.text);
                    }
                    Navigator.of(dialogContext).pop();
                  },
                  child: Text(obj["confirmText"] ?? "OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }



  void showOptionDialog(Map<String, dynamic> obj) {
    String selectedOption = 'Option 1';

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Αλγόριθμος επιλογής σημείων"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text('Αλγόριθμος 1 - Εγγύτητα πλειοψηφίας σημείων σε κάποιο σημείο συλλογής'),
                    value: '1',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() => selectedOption = value!);
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Αλγόριθμος 2 - Εγγύτητα μεταφορέα σε κάποιο σημείο συλλογής'),
                    value: '2',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() => selectedOption = value!);
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Αλγόριθμος 3'),
                    value: '3',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() => selectedOption = value!);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (obj["onConfirm"] is Function) {
                      obj["onConfirm"](selectedOption);
                    }
                    Navigator.of(dialogContext).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }


}