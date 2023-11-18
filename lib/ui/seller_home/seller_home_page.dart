import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/logout/logout_bloc.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../utils/color_resources.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../auth/auth_page.dart';
import 'widgets/on_going_order_widget.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // double limitedStockCardHeight = MediaQuery.of(context).size.width / 1.4;
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).highlightColor,
            title: Image.asset(Images.logoWithNameImage, height: 35),
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.paddingSizeSmall),
                OngoingOrderWidget(),

                // CompletedOrderWidget(callback: ),
                SizedBox(height: Dimensions.paddingSizeSmall),

                SizedBox(height: Dimensions.paddingSizeSmall),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BlocConsumer<LogoutBloc, LogoutState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (message) {
                    AuthLocalDatasource().removeAuthData();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return const AuthPage();
                    }), (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Logout successfully'),
                      backgroundColor: Colors.blue,
                    ));
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ));
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<LogoutBloc>()
                              .add(const LogoutEvent.logout());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 27, 86, 195),
                        ),
                        child: const Text('Logout', style: TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
