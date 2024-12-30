import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware_flutter_assignment/features/form/ui/create_account.dart';
import 'package:infoware_flutter_assignment/features/products/bloc/product_bloc.dart';
import 'package:infoware_flutter_assignment/features/products/data/data_repository/product_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(productRepository: ProductRepository()),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: ThemeData().textTheme.apply(fontFamily: 'Lexend'),
        ),
        debugShowCheckedModeBanner: false,
        home: const FormScreen(),
      ),
    );
  }
}
