// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/orders/orders_bloc.dart';
import '../../../bloc/orders2/orders2_bloc.dart';
import '../../../bloc/orders3/orders3_bloc.dart';
import '../../../bloc/orders4/orders4_bloc.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/dimensions.dart';
import 'order_type_button_head.dart';

// Import lainnya...

class OngoingOrderWidget extends StatefulWidget {
  final Function? callback;

  const OngoingOrderWidget({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  State<OngoingOrderWidget> createState() => _OngoingOrderWidgetState();
}

class _OngoingOrderWidgetState extends State<OngoingOrderWidget> {
  @override
  void initState() {
    context.read<OrdersBloc>().add(const OrdersEvent.getOrdersStat1());
    context.read<Orders2Bloc>().add(const Orders2Event.getOrdersStat2());
    context.read<Orders3Bloc>().add(const Orders3Event.getOrdersStat3());
    context.read<Orders4Bloc>().add(const Orders4Event.getOrdersStat4());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bagian lain dari kode Anda...

        Padding(
          padding: const EdgeInsets.fromLTRB(
            Dimensions.paddingSizeDefault,
            Dimensions.paddingSizeExtraSmall,
            Dimensions.paddingSizeDefault,
            Dimensions.fontSizeSmall,
          ),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: (1 / .65),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              BlocBuilder<OrdersBloc, OrdersState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return buildOrderTypeButtonHead(
                        context,
                        ColorResources.mainCardOneColor(context),
                        'Pending',
                        1,
                        'Orders',
                        0,
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      return buildOrderTypeButtonHead(
                        context,
                        ColorResources.mainCardOneColor(context),
                        'Pending',
                        1,
                        'Orders',
                        data.data.length,
                      );
                    },
                  );
                },
              ),
              BlocBuilder<Orders3Bloc, Orders3State>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return buildOrderTypeButtonHead(
                        context,
                        ColorResources.mainCardTwoColor(context),
                        'Packaging',
                        2,
                        'Order',
                        0,
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      return buildOrderTypeButtonHead(
                        context,
                        ColorResources.mainCardTwoColor(context),
                        'Packaging',
                        2,
                        'Order',
                        data.data.length,
                      );
                    },
                  );
                },
              ),
              BlocBuilder<Orders2Bloc, Orders2State>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return buildOrderTypeButtonHead(
                        context,
                        ColorResources.mainCardThreeColor(context),
                        'Confirmed',
                        7,
                        'Order',
                        0,
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      return buildOrderTypeButtonHead(
                        context,
                        ColorResources.mainCardThreeColor(context),
                        'Confirmed',
                        7,
                        'Order',
                        data.data.length,
                      );
                    },
                  );
                },
              ),
              BlocBuilder<Orders4Bloc, Orders4State>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return buildOrderTypeButtonHead(
                        context,
                        ColorResources.mainCardFourColor(context),
                        'Out of',
                        8,
                        'Order',
                        0,
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      return buildOrderTypeButtonHead(
                        context,
                        ColorResources.mainCardFourColor(context),
                        'Out of',
                        8,
                        'Order',
                        data.data.length,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),
      ],
    );
  }

  Widget buildOrderTypeButtonHead(
    BuildContext context,
    Color color,
    String text,
    int index,
    String subText,
    int numberOfOrder,
  ) {
    return OrderTypeButtonHead(
      color: color,
      text: text,
      index: index,
      subText: subText,
      numberOfOrder: numberOfOrder,
      callback: widget.callback,
    );
  }
}
