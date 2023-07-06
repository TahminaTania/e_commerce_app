import 'package:flutter/material.dart';

class FilterOptionsWidget extends StatelessWidget {
  const FilterOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> filterby = <String>[
      'All',
      'Latest',
      'Most Populer',
      'Expensive',
      'Cheapest'
    ];

    return SingleChildScrollView(
      child: Container(
        height: 45,
        width: double.infinity,
        // color: Colors.amberAccent,
        child: ListView.builder(
            itemCount: filterby.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Container(
                  height: 40,
                  // width: 100,
                  margin: EdgeInsets.all(5.0),
                  //color: Colors.grey,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.5),
                  ),

                  // margin: EdgeInsets.all(8),
                  // color: Colors.amber[colorCodes[index]],
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${filterby[index]}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}


//  decoration:
                        