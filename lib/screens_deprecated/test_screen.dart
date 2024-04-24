import 'package:flutter/material.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/theme/app_bar_button.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class ReordableData extends StatefulWidget {
  const ReordableData({super.key});

  @override
  State<ReordableData> createState() => _ReordableDataState();
}

final List<int> items = List<int>.generate(50, (int index) => index);

class _ReordableDataState extends State<ReordableData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainBackground,
        title:  Text(
         S.of(context).settings,
          style: AppTextStyles.mainFont,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: ElevatedButton(
                onPressed: () {
                  // переход на экран погоды
                },
                style: AppButtonsStyle.navigationBtn,
                child: const Icon(
                  Icons.close,
                  color: AppColors.white,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ReorderableListView(
        header: const Column(
          children: [
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
          ],
        ),
        footer: const Column(
          children: [
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
            Text('Example with reordable list view'),
          ],
        ),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        children: <Widget>[
          for (int index = 0; index < items.length; index += 1)
            ListTile(
              key: Key('$index'),
              tileColor:
                  (index % 2 == 1) ? Colors.blueAccent : Colors.amberAccent,
              title: Text('Item ${items[index]}'),
            ),
        ],
      ),
    );
  }
}
