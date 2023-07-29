import 'package:flutter/material.dart';
import 'package:gocery/model/bundle/bundle_model.dart';
import 'package:sizer/sizer.dart';

import 'product_item.dart';

class BundleItem extends StatelessWidget {
  const BundleItem({
    super.key,
    required this.bundle,
  });

  final BundleModel bundle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              bundle.name!,
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
        bundle.description == null
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  bundle.description!,
                  style: TextStyle(
                    color: theme.colorScheme.onBackground,
                    fontSize: 10.sp,
                  ),
                ),
              ),
        SizedBox(
          height: 38.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            scrollDirection: Axis.horizontal,
            itemCount: bundle.products!.length,
            separatorBuilder: (context, index) => SizedBox(width: 2.w),
            itemBuilder: (context, index) =>
                ProductItem(product: bundle.products![index]),
          ),
        ),
      ],
    );
  }
}
