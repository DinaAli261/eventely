import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/widget/custom_text_form_field.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../home/widget/event_item.dart';

class FavoriteTab extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(height * 0.019),
            child: CustomTextFormField(
              borderSideColor: AppColors.blue,
              controller: searchController,
              prefixIcon: Icons.search,
              hintText: AppLocalizations.of(context)!.searchForEvent,
              hintStyle: AppTextStyles.blue14Bold,

            ),
          ),
          SizedBox(
            height: 0.756 * height,
            child: Expanded(child: ListView.separated(
              itemBuilder: (context, index) {
                return EventItem();
              },
              itemCount: 20,
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.019,);
              },
            )
            ),
          )

        ],
      ),
    );
  }
}
