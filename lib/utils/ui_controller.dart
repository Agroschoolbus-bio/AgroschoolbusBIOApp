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
    // TextEditingController latInput = TextEditingController();
    // TextEditingController lonInput = TextEditingController();
    String dropdownValue = "1"; 

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Λεπτομέρειες ΣΕΣ"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TextField(
                  //   controller: latInput,
                  //   decoration: InputDecoration(labelText: "Γεωγραφικό πλάτος"),
                  // ),
                  // TextField(
                  //   controller: lonInput,
                  //   decoration: InputDecoration(labelText: "Γεωγραφικό μήκος"),
                  // ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      }
                    },
                    items: (["1", "2"])
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                      obj["onConfirm"]({
                        // "lat": latInput.text,
                        // "lon": lonInput.text,
                        "ses": dropdownValue,
                      });
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
}