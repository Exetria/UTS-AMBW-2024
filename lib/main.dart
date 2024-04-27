import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'more.dart';

//langsung buat instance app untuk mulai
void main() {
  runApp(const MyApp());
}

//stateless widget untuk dasar aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //tentukan title dan theme buat app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),

      //set home page ke MyHomePage
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//home page pake state
class MyHomePage extends StatefulWidget {
  //constructor
  const MyHomePage({super.key, required this.title});
  final String title;

  //buat state pagenya, nanti isi elemen" ada di statenya
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//blank page ga pake state
class BlankPage extends StatelessWidget {
  final Color color;

  const BlankPage({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: const Center(),
    );
  }
}

//==========================================================================================================

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BlankPage(color: Colors.red),
    const BlankPage(color: Colors.green),
    const BlankPage(color: Colors.blue),
    const BlankPage(color: Colors.orange),
    const BlankPage(color: Colors.purple),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //buat widget page pertama lalu masukkin ke array
    _pages[0] = ListView(children: [
      //search bar
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50.0,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for Restaurants',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),

      //image besar atas
      SizedBox(
        height: 275,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, count) {
            return Stack(
              alignment: Alignment.center,
              children: [
                const Image(image: AssetImage('assets/images/greencurry.jpg')),
                Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: RichText(
                                text: const TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: "Thai style\n",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "10 places",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      )),
                                ])),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.circle, size: 15,),
                                Icon(Icons.radio_button_unchecked, size: 15,),
                                Icon(Icons.radio_button_unchecked, size: 15,),
                                Icon(Icons.radio_button_unchecked, size: 15,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.bottomCenter,
                )
              ],
            );
          },
        ),
      ),

      //most popular
      Container(
        padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Most Popular",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MorePage(choice: 0)));
              },
              child: const Text("See all",
                  style: TextStyle(fontSize: 20, color: Colors.blue)),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 175,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, count) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: 130,
                  height: 175,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/curry.jpg'),
                          height: 90,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: RichText(
                          text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Curry\n",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: "Ona Street\n",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: "Soup, Japanese\n",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),

      //meal deals
      Container(
        padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Meal Deals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MorePage(choice: 1)));
              },
              child: const Text("See all",
                  style: TextStyle(fontSize: 20, color: Colors.blue)),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 175,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, count) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: 130,
                  height: 175,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/greencurry.jpg'),
                          height: 90,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: RichText(
                          text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Green curry\n",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: "Acha Street\n",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: "Soup, Indian\n",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    ]);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 242, 246),
      //top bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Sydney CDB",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFF5D34C),
            onPressed: () {
              // Navigator.pop(context);
            }),
      ),

      //body
      body: _pages[_selectedIndex],

      //bottom bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Top Foods',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
