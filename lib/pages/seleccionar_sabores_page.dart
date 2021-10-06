import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/models/select_options.dart';
import 'package:tufic_app/provider/selected_options_providers.dart';
import 'package:tufic_app/widgets/barra_de_busqueda.dart';
import 'package:tufic_app/widgets/sidebar_menu.dart';

class SeleccionarSaboresPage extends StatelessWidget {
  static const String routeName = 'seleccionSabores';
  const SeleccionarSaboresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainAppBar = MainAppBar(
      context: context,
    );

    return Scaffold(
        appBar: mainAppBar.getWidget(true),
        drawer: SideBarMenu(context: context),
        backgroundColor: Colors.white,
        body: Center(
          child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 200,
                minHeight: 200,
                maxWidth: 500,
                // maxHeight: 500,
              ),
              child: buildSeleccionarSaboresList(context)),
        ) ////(context),
        );
  }

  Widget buildSeleccionarSaboresList(BuildContext context) {
    final optionsProvider = Provider.of<SelectedOptionsProvider>(context);
    final Future<Options> _calculation = Future<Options>.delayed(
        const Duration(milliseconds: 500),
        () => optionsProvider.getProductList());

    return FutureBuilder(
      future: _calculation,
      builder: (context, AsyncSnapshot<Options> snapshot) {
        if (snapshot.hasData) {
          return SeleccionarSabores(snapshot.data as Options);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class SeleccionarSabores extends StatelessWidget {
  final Options options;
  // ignore: use_key_in_widget_constructors
  const SeleccionarSabores(this.options);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 20),
            child: Text("Sabores",
                textAlign: TextAlign.start, //cartProvider.getStore(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: tuficTheme.fonts.textBold,
                )),
          ),
        ),
        const MySearchForm(),
      ],
    );
  }
}
