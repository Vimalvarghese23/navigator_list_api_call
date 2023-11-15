part of 'package:navigator/bloc/bloc/list_bloc.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("List")),
          backgroundColor: Colors.blueGrey,
        ),
        body: FutureBuilder(
            future: context.read<ListBloc>().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Lording"),
                );
              }
              if (snapshot.hasData) {
                final userDetails = snapshot.data;
                return ListView.builder(
                    itemCount: userDetails?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final userData = userDetails?.data?[index];

                      return Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 7,
                                  spreadRadius: 3,
                                  offset: Offset(0, 2))
                            ]),
                        child: Row(
                          children: [
                            SizedBox(height: 10, width: 10),
                            ClipOval(
                              child: Image.network("${userData?.avatar ?? ''}",
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text("${userData?.firstName ?? ''}"
                                    " ${userData?.lastName ?? ''}"),
                                Text("ID: ${userData?.id ?? ''}"),
                                Text("Email: ${userData?.email ?? ''}"),
                              ],
                            ))
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                  child: Text("Data Not Available"),
                );
              }
            }),
      ),
    );
  }
}
