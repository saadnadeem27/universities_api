import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:universities_api/Services/remote_services.dart';

const kTetStyle = TextStyle(fontSize: 13);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteServices services = RemoteServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: services.unimodel(),
                  builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    ReusableRow(
                                        title: 'Country ',
                                        value: snapshot.data![index]['country']
                                            .toString()),
                                    ReusableRow(
                                        title: 'Univeristy',
                                        value: snapshot.data![index]['name']
                                            .toString()),
                                    ReusableRow(
                                        title: 'Domain ',
                                        value: snapshot.data![index]['domains']
                                            .toString()),
                                    ReusableRow(
                                        title: 'Website',
                                        value: snapshot.data![index]
                                                ['web_pages']
                                            .toString()),
                                    ReusableRow(
                                        title: 'Province',
                                        value: snapshot.data![index]
                                                ['state-province']
                                            .toString()),
                                    ReusableRow(
                                        title: 'Country Code',
                                        value: snapshot.data![index]
                                                ['alpha_two_code']
                                            .toString()),
                                  ],
                                ),
                              ),
                            );
                          }));
                    }
                  })),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title;
  String value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kTetStyle,
        ),
        Text(
          value,
          style: kTetStyle,
        )
      ],
    );
  }
}
