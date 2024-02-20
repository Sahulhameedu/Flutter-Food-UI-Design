import 'package:flutter/material.dart';
import 'package:food_app_ui/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF21BFBD),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(Icons.filter_list),
                        ),
                        IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Healthy",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Food",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75.0),
                ),
              ),
              child: ListView(
                primary: false,
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 300.0,
                      child: ListView(
                        children: [
                          _buildFoodItem(context,'assets/images/plate1.png',
                              'Salmon bowl', '\$24.00'),
                          _buildFoodItem(context, 'assets/images/plate2.png',
                              'Spring bowl', '\$24.00'),
                          _buildFoodItem(context, 'assets/images/plate3.png',
                              'Avocado bowl', '\$24.00'),
                          _buildFoodItem(context, 'assets/images/plate4.png',
                              'Berry bowl', '\$24.00'),
                          _buildFoodItem(context, 'assets/images/plate5.png',
                              'Berry bowl', '\$24.00'),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 65.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.shopping_basket,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xFF1C1428),
                        ),
                        child: const Center(
                          child: Text(
                            "Check Out",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

Widget _buildFoodItem(BuildContext context, String imgPath, String foodName, String price) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  DetailsScreen(
              heroTag: imgPath,
              foodPrice: price,
              foodName: foodName,
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Hero(
                  tag: imgPath,
                  child: Image(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                    height: 75.0,
                    width: 75.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
              icon: const Icon(Icons.add),
              color: Colors.black,
              onPressed: () {})
        ],
      ),
    ),
  );
}
