import 'package:flutter/material.dart';

//class MorePage buat page kedua
// ignore: must_be_immutable
class MorePage extends StatefulWidget {
  int choice;

  MorePage({required this.choice});

  @override
  State<MorePage> createState() => _MorePageState();
}

//blank page buat isi array
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

class _MorePageState extends State<MorePage>
{
  final List<Widget> pages = [
    const BlankPage(color: Colors.red),
    const BlankPage(color: Colors.green),
  ];
  late final int choice;

  @override
  Widget build(BuildContext context) {
    //karena ada 2 jenis item, buat 2 jenis body
    pages[0] = SizedBox(
        child: 
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, count) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 390,
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
                          height: 250,
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
                                      fontSize: 45,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: "Ona Street\n",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: "Soup, Japanese\n",
                                  style: TextStyle(
                                      fontSize: 20,
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
      );

    pages[1] = SizedBox(
        child: 
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, count) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 390,
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
                          height: 250,
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
                                  text: "Green Curry\n",
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: "Acha Street\n",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: "Soup, Indian\n",
                                  style: TextStyle(
                                      fontSize: 20,
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
      );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 242, 246),
      
      //app bar
      appBar: AppBar(
        centerTitle: true,
        title: Text('See More Page'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFF5D34C),
            onPressed: () {
              widget.choice = 3;
              Navigator.pop(context);
            }),
      ),
      
      //2 body, berdasarkan angka yg dipass dari Home
      body: pages[widget.choice]
    );
  }
}
