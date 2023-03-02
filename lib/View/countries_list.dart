import 'package:covid_app/Services/states_services.dart';
import 'package:flutter/material.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with countries name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  )
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                  future: statesServices.CountriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                    if(!snapshot.hasData){
                      return Text('data');
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                        return Column(
                          children: [
                            ListTile(
                              leading: Image(
                                image: NetworkImage(
                                 snapshot.data![index]['countryInfo']['flage']
                                ),
                              ),
                            )
                          ],
                        );
                      });
                    }

                  },
                ))
          ],
        ),
      ),
    );
  }
}
