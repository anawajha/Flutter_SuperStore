import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_store/utls/app_colors.dart';

class AccountSettings extends StatelessWidget {
  IconData icon;
  String title;
  bool hasAdditionSettings;
  bool isNew;

  AccountSettings({
    required this.icon,
    required this.title,
    this.hasAdditionSettings = false,
    this.isNew = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        width: 35,
        height: 35,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.all(5),
        color: AppColors.red.withOpacity(0.31),
        child: Icon(icon,color: AppColors.red,),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(
            width: 15,
          ),
          Container(
            padding: const EdgeInsets.all(3),
                  color: isNew ? AppColors.red : Colors.white,
                  child: const Text(
                    'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
        ],
      ),
      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size: 15, color: hasAdditionSettings ? Colors.grey : Colors.transparent,))
    );
  }
}
