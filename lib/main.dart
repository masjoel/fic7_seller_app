import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/add_image/add_image_bloc.dart';
import 'bloc/add_product/add_product_bloc.dart';
import 'bloc/categories/categories_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/logout/logout_bloc.dart';
import 'bloc/orders/orders_bloc.dart';
import 'bloc/orders2/orders2_bloc.dart';
import 'bloc/orders3/orders3_bloc.dart';
import 'bloc/orders4/orders4_bloc.dart';
import 'bloc/products/products_bloc.dart';
import 'bloc/register/register_bloc.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/firebase_messaging_remote_datasource.dart';
import 'firebase_options.dart';
import 'ui/auth/auth_page.dart';
import 'ui/dashboard/seller_dashboard_page.dart';
import 'utils/light_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingRemoteDatasource().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => AddImageBloc(),
        ),
        BlocProvider(
          create: (context) => AddProductBloc(),
        ),
        BlocProvider(
          create: (context) => OrdersBloc(),
        ),
        BlocProvider(
          create: (context) => Orders2Bloc(),
        ),
        BlocProvider(
          create: (context) => Orders3Bloc(),
        ),
        BlocProvider(
          create: (context) => Orders4Bloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: light,
          home: FutureBuilder<bool>(
            future: AuthLocalDatasource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!) {
                return const SellerDashboardPage();
              } else {
                return const AuthPage();
              }
            },
          )),
    );
  }
}