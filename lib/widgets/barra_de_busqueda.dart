import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/services/search_provider.dart';

//barra de busqueda
class MySearchForm extends StatefulWidget {
  const MySearchForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MySearchForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    return SizedBox(
      height: 30,
      width: 250,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey.shade300,
          ),
          child: CupertinoTextField(
              controller: myController,
              onChanged: (text) {
                searchProvider.setSearch(text);
              },
              placeholder: 'Buscar...',
              autocorrect: false,
              prefix: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
              ),
              suffix: searchProvider.getSearch().isNotEmpty
                  ? IconButton(
                      padding: const EdgeInsets.all(5),
                      onPressed: () {
                        myController.clear();
                        searchProvider.setSearch("");
                        //cierra el teclado virtual
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      iconSize: 20,
                      color: Colors.black45,
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ))
                  : Container(),
              style: TextStyle(
                color: Colors.black87, //tuficTheme.primary,
                fontSize: 15,
                fontFamily: tuficTheme.fonts.text,
              ),
              decoration: const BoxDecoration(color: Colors.transparent))),
    );
    // Fill this out in the next step.
  }
}
