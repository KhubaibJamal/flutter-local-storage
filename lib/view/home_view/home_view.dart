import 'package:flutter/material.dart';
import 'package:hive_db/box/boxes.dart';
import 'package:hive_db/model/transaction.dart';
import 'package:hive_db/viewmodel/home_view_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Hive Database"),
            centerTitle: true,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // _showDialogBox();
            },
            backgroundColor: Theme.of(context).primaryColorLight,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: ValueListenableBuilder<Box<Transaction>>(
            valueListenable: Boxes.getTransactions().listenable(),
            builder: (context, box, child) {
              var data = box.values.toList().cast<Transaction>();
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15.0),
                    height: 120,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              data[index].name.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                // delete(data[index]);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // editDialog(
                                //     data[index],
                                //     data[index].title.toString(),
                                //     data[index].description.toString());
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          data[index].amount.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
