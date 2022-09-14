import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fetchapi/controller/data_controller.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    super.initState();
    dataController.getUserInfoFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users Info"),
        ),
        body: Obx(() => dataController.isDataLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (ctx, i) {
                  String image = '';
                  String title = '';
                  String subTitle = '';
                  try {
                    image =
                        dataController.userList!.data![i].picture.toString();
                  } catch (e) {
                    image = '';
                  }
                     try {
                    title =
                        dataController.userList!.data![i].firstName.toString();
                  } catch (e) {
                    title = '';
                  }
                     try {
                    subTitle =
                        dataController.userList!.data![i].lastName.toString();
                  } catch (e) {
                    subTitle = '';
                  }

                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(image),
                    ),
                    title:  Text(title),
                    subtitle:  Text(subTitle),
                  );
                },
                itemCount: dataController.userList!.data!.length,
              )));
  }
}
