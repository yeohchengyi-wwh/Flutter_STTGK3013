import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //vairable
  late double width;
  TextEditingController clothesController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  double totalWater = 0.0;
  double totalTime = 0.0;
  int totalLoads = 0;

  //https://stackoverflow.com/questions/52030797/making-a-dropdown-menu-in-flutter-with-a-map
  String washCycleType = 'Normal';
  final Map<String, Map<String, double>> cycleDetails = {
    'Normal': {'water': 50.0, 'time': 45.0},
    'Heavy': {'water': 70.0, 'time': 60.0},
    'Quick': {'water': 30.0, 'time': 25.0},
  };

  String clothesErrorMsg = '';
  String capacityErrorMsg = '';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    if (width > 400) {
      width = 400;
    } else {
      width = width;
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Laundry Load Planner'),
            SizedBox(width: 10),
            Image.asset("assets/images/laundryIcon.png", height: 32),
          ],
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Please Fill In Below Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: clothesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Number of Clothes",
                  hintText: 'Enter total number of Clothes',
                  prefixIcon: Icon(Icons.checkroom),
                  border: OutlineInputBorder(),
                  errorText: clothesErrorMsg.isEmpty ? null : clothesErrorMsg,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: capacityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Mashine Capacity(clothes per load)",
                  hintText: 'Enter washing machine Capacity',
                  prefixIcon: Icon(Icons.local_laundry_service),
                  border: OutlineInputBorder(),
                  errorText: capacityErrorMsg.isEmpty ? null : capacityErrorMsg,
                ),
              ),
              SizedBox(height: 15),
              Text('Select Wash Cycle:'),
              SizedBox(height: 15),
              DropdownButton<String>(
                value: washCycleType,
                items: cycleDetails.keys.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    washCycleType = value!;
                  });
                },
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: calculateCost,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Calculate'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      clothesController.clear();
                      capacityController.clear();
                      totalWater = 0.0;
                      totalTime = 0.0;
                      totalLoads = 0;
                      washCycleType = 'Normal';
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Reset'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Text(
                      'Result',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 1, 57, 48),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Total Water',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '$totalWater L',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        12,
                                        84,
                                        142,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Total Time',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '$totalTime mins',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        12,
                                        84,
                                        142,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Total Loads',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '$totalLoads',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        12,
                                        84,
                                        142,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Water Cycle Type',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '$washCycleType ',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        12,
                                        84,
                                        142,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateCost() {
    setState(() {
      clothesErrorMsg = '';
      capacityErrorMsg = '';
    });//Empty the wrong information

    //https://dart.dev/language/operators
    double? clothes = double.tryParse(clothesController.text.trim());
    double? capacity = double.tryParse(capacityController.text.trim());
    bool error = false;

    if (clothes == null || clothes <= 0) {
      clothesErrorMsg = 'Please Enter A Valid Number';
      error = true;
    }
    if (capacity == null || capacity <= 0) {
      capacityErrorMsg = 'Please Enter A Number greater than 0';
      error = true;
    }
    if (error) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please insert all the curent fields correctly.'),
        ),
      );
      return;
    }

    setState(() {
      final cycle = cycleDetails[washCycleType]!;
      totalLoads = (clothes! / capacity!).ceil();
      //makesure the variable is non-null
      totalWater = totalLoads * cycle['water']!;
      totalTime = totalLoads * cycle['time']!;
    });
  }
}
