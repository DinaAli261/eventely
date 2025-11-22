import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/ui/home/tabs/home/widget/event_item.dart';
import 'package:evently/ui/home/widget/custom_text_form_field.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {

  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  TextEditingController searchController = TextEditingController();
  late EventListProvider eventListProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eventListProvider.getALLFavoriteEvents();
    },);
  }

  @override
  Widget build(BuildContext context) {
    eventListProvider = Provider.of<EventListProvider>(context);
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
            child: Expanded(child:
            eventListProvider.favoriteList.isEmpty ?
            Center(child: Text(
              AppLocalizations.of(context)!.no_favorite_event_found,
              style: AppTextStyles.blue20Medium,))
                : ListView.separated(
              itemBuilder: (context, index) {
                return EventItem(event: eventListProvider.favoriteList[index]);
              },
              itemCount: eventListProvider.favoriteList.length,
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
