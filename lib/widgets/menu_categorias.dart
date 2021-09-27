import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/services/category_provider.dart';

class MenuCategoriasWidget extends StatelessWidget {
  final List<String> categorias;
  // ignore: use_key_in_widget_constructors
  const MenuCategoriasWidget({
    required this.categorias,
  });

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    String categoriaActual = categoryProvider.getCategory();
    if (categoriaActual.isEmpty && categorias.isNotEmpty) {
      categoryProvider.setCategory(categorias[0]);
    }
    final List<Widget> children = [];
    //children.add(const SizedBox(width: 10));
    for (var categoria in categorias) {
      children.add(MenuCategoriaWidget(categoria: categoria));
      //children.add(const SizedBox(width: 50));
    }
    return SizedBox(
        height: 30,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: children,
        ));
  }
}

class MenuCategoriaWidget extends StatelessWidget {
  final String categoria;
  // ignore: use_key_in_widget_constructors
  const MenuCategoriaWidget({
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    bool isSelected = categoryProvider.isSelected(categoria);
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 1),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: isSelected
                      ? tuficTheme.primary
                      : const Color.fromRGBO(0, 0, 0, 0),
                  width: 2))),
      child: GestureDetector(
          onTap: () {
            categoryProvider.setCategory(categoria);
            categoryProvider.refreshView();
          },
          child: Text(
            '${categoria[0].toUpperCase()}${categoria.substring(1)}',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: tuficTheme.fonts.text,
            ),
          )),
    );
  }

  Widget getUnderlineWidget(bool isSelected) {
    return Container(
      height: 5,
      //width: double.maxFinite,
      decoration: BoxDecoration(
          color: isSelected
              ? tuficTheme.primary
              : const Color.fromRGBO(0, 0, 0, 0),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
