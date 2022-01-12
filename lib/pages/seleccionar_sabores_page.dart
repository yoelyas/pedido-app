import 'package:flutter/material.dart';
import 'package:pedidos_app/const/theme.dart';
import 'package:provider/provider.dart';
import 'package:pedidos_app/components/main_app_bar.dart';
import 'package:pedidos_app/models/select_options.dart';
import 'package:pedidos_app/provider/selected_options_providers.dart';
import 'package:pedidos_app/widgets/barra_de_busqueda.dart';
import 'package:pedidos_app/widgets/sidebar_menu.dart';

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
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const OpcionesSabores())),
        ) ////(context),
        );
  }
}

class OpcionesSabores extends StatelessWidget {
  const OpcionesSabores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedOptionsProvider =
        Provider.of<SelectedOptionsProvider>(context);
    final selectedOptions = selectedOptionsProvider.getProducto();
    List<Widget> options = [];
    options.add(const SizedBox(
      height: 12,
    ));
    options.add(
      Text("Sabores",
          textAlign: TextAlign.start, //cartProvider.getStore(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: pedidosTheme.fonts.textBold,
          )),
    );
    options.add(const SizedBox(
      height: 12,
    ));
    options.add(const MySearchForm());
    options.add(const SizedBox(
      height: 12,
    ));
    for (var i = 0; i < selectedOptions!.options.length; i++) {
      options
          .add(opcionSabor(selectedOptions.options[i], selectedOptions.length));

      if (i < selectedOptions.length - 1) {
        options.add(const Divider());
      }
    }
    return ListView(
      children: options,
    );
  }

  opcionSabor(OptionOption eleccion, int length) {
    return Row(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(eleccion.title,
              textAlign: TextAlign.start, //cartProvider.getStore(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: pedidosTheme.fonts.textBold,
              )),
          eleccion.description.isNotEmpty
              ? Text(eleccion.description,
                  textAlign: TextAlign.start, //cartProvider.getStore(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: pedidosTheme.fonts.text,
                  ))
              : Container()
        ]),
        Expanded(child: Container()),
        length == 1 ? const _CrearCheck() : _CrearContador(eleccion.stock),

        //TextButton(onPressed: () {}, child: Text("holas"))
      ],
    );
  }
}

class _CrearCheck extends StatefulWidget {
  const _CrearCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<_CrearCheck> createState() => _CrearCheckState();
}

class _CrearCheckState extends State<_CrearCheck> {
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        setState(() {
          _bloquearCheck = !_bloquearCheck;
        });
      },
      icon: Icon(
        _bloquearCheck ? Icons.check_circle_outline : Icons.circle_outlined,
        size: 30,
        color: _bloquearCheck ? pedidosTheme.primary : Colors.black54,
      ),
    );
  }
}

// ignore: must_be_immutable
class _CrearContador extends StatefulWidget {
  int stock;
  _CrearContador(this.stock);

  @override
  // ignore: no_logic_in_create_state
  __CrearContadorState createState() => __CrearContadorState(stock);
}

class __CrearContadorState extends State<_CrearContador> {
  int stock;
  __CrearContadorState(this.stock);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              if (count > 0) {
                setState(() {
                  count--;
                });
              }
            },
            icon: Icon(
              Icons.remove_circle,
              color: pedidosTheme.secondary,
            )),
        Text(
          "$count",
          style: TextStyle(
            fontSize: 14,
            fontFamily: pedidosTheme.fonts.textBold,
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                if (stock < 0 || count < stock) count++;
              });
            },
            icon: Icon(
              Icons.add_circle,
              color: pedidosTheme.secondary,
            )),
      ],
    );
  }
}
