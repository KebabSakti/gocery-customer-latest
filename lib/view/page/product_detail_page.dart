import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../model/core/query_model.dart';
import '../bloc/product/product_cubit.dart';
import '../widget/cart_indicator.dart';
import '../widget/m_button.dart';
import '../widget/product_item.dart';
import '../widget/shimmer_loader.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final popularProductBloc = ProductCubit();

  @override
  void initState() {
    popularProductBloc.load(
      option: QueryModel(
          paginate: QueryPaginate(limit: 10, offset: 0),
          sort: QuerySorting(
              field: 'sold', direction: QuerySortingDirection.desc)),
    );

    super.initState();
  }

  @override
  void dispose() {
    popularProductBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Terong-terongan',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 14.sp,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
        actions: [CartIndicator(iconColor: theme.colorScheme.onSurface)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: 'https://loremflickr.com/640/480/office',
              height: 50.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'Nama produk yang panjang dan lebar sekalisekalisekalisekali',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'Rp22.976',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'per 1 kg',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel fringilla neque, quis bibendum tortor. Proin et tristique metus. Mauris ullamcorper purus lorem, eget finibus velit viverra et. Vestibulum condimentum sem orci. Aliquam erat volutpat. Curabitur elit tortor, imperdiet sed velit in, eleifend cursus magna. Phasellus malesuada purus et enim porttitor pellentesque. Etiam felis lacus, ultrices a finibus sit amet, semper eget nulla. Mauris ac nisl rutrum, placerat tortor non, interdum leo. Donec finibus diam mollis, fermentum augue id, mollis dui. Cras lacinia ex tempor laoreet iaculis. Donec et semper nulla, vel pretium libero. Duis quis felis sit amet magna egestas lacinia',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: MButton(
                size: 5.h,
                color: theme.colorScheme.primary,
                text: 'Beli produk ini',
                textSize: 14.sp,
                onPressed: () {
                  //
                },
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Produk Sejenis',
                        style: TextStyle(
                          color: theme.colorScheme.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Lihat Semua',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  BlocBuilder<ProductCubit, ProductState>(
                    bloc: popularProductBloc,
                    builder: (context, state) {
                      final popularProductLoading = GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.w,
                          mainAxisSpacing: 2.w,
                          mainAxisExtent: 38.h,
                        ),
                        itemBuilder: (context, index) =>
                            ShimmerLoader(radius: 4.w),
                        itemCount: 2,
                      );

                      if (state.loading) {
                        return popularProductLoading;
                      }

                      if (state.products.isNotEmpty) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2.w,
                            mainAxisSpacing: 2.w,
                            mainAxisExtent: 38.h,
                          ),
                          itemBuilder: (context, index) =>
                              ProductItem(product: state.products[index]),
                          itemCount: state.products.length,
                        );
                      }

                      return popularProductLoading;
                    },
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
