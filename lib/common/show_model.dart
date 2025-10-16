import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/constants/app_style.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/provider/radio_provider.dart';
import 'package:todo_app/widget/datetime_widget.dart';
import 'package:todo_app/widget/radio_widget.dart';
import '../widget/textfield_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
  const AddNewTaskModel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // 高さを画面の85%に設定
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'New Task ToDo',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          // 区切り線
          Divider(
            thickness: 1.2, // 線の太さ
            color: Colors.grey.shade200,
          ),
          const Gap(12),
          Text(
            'Title Task',
            style: AppStyle.headhingOne,
          ),
          const Gap(6),
          TextFieldWidget(hintText: 'add task name.', maxLine: 1),
          const Gap(12),
          Text(
            'Discription',
            style: AppStyle.headhingOne,
          ),
          const Gap(6),
          TextFieldWidget(hintText: 'add Discriptions.', maxLine: 5),
          const Gap(12),
          Text(
            'Category',
            style: AppStyle.headhingOne,
          ),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                  categColor: Colors.green,
                  titleRadio: "LRN",
                  valueInput: 1,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categColor: Colors.blue.shade700,
                  titleRadio: "WRK",
                  valueInput: 2,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categColor: Colors.amberAccent.shade700,
                  titleRadio: "GEN",
                  valueInput: 3,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 3),
                ),
              ),
            ],
          ),
          // date and timesection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: 'Date',
                valueText: 'dd/mm/yy',
                iconSection: CupertinoIcons.calendar,
              ),
              Gap(22),
              DateTimeWidget(
                titleText: 'Time',
                valueText: 'hh：mm',
                iconSection: CupertinoIcons.clock,
              ),
            ],
          ),
          const Gap(7),
          // ボタンセクション
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: Colors.blue.shade800,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12)),
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
              ),
              Gap(20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12)),
                  onPressed: () {},
                  child: Text('Create'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
