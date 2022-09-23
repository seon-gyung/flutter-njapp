// tabs/tab_home.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model_data_provider.dart';

class TabHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final dataProvider = Provider.of<DataProvider>(context);

    return FutureBuilder(
        future: dataProvider.fetchItems(),
        builder: (context, snapshots){
          if (dataProvider.datas.length == 0) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
            return Center(
              child: Text(dataProvider.datas[].mtrDt.toString()),
            );
          }
    }
    );
  }
}