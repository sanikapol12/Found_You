import 'package:flutter/material.dart';
import 'package:flutter_project/view/home_page.dart';

class BusinessForm extends StatefulWidget {
  const BusinessForm({super.key});

  @override
  State<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _plotNoController = TextEditingController();
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _streetRoadController = TextEditingController();

  // Use the stateCityMap keys as states
  late List<String> states = stateCityMap.keys.toList();
  List<String> cities = [];
  List<String> areas = []; // optional for later use

  String? selectedState;
  String? selectedCity;
  String? selectedArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), //  leading icon
          onPressed: () {
            Navigator.pop(context); // Close the drawer first
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: ShaderMask(
          shaderCallback:
              (bounds) => const LinearGradient(
                colors: [Colors.blue, Colors.purple, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
          child: const Text(
            'Business Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white, // important
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Business Name
              TextFormField(
                controller: _businessNameController,
                decoration: const InputDecoration(
                  labelText: 'Business Name',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter business name'
                            : null,
              ),
              const SizedBox(height: 16),

              // Pincode
              TextFormField(
                controller: _pincodeController,
                decoration: const InputDecoration(
                  labelText: 'Pincode',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter pincode'
                            : null,
              ),
              const SizedBox(height: 16),

              // Plot No.
              TextFormField(
                controller: _plotNoController,
                decoration: const InputDecoration(
                  labelText: 'Plot No.',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Building Name
              TextFormField(
                controller: _buildingNameController,
                decoration: const InputDecoration(
                  labelText: 'Building Name',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Street / Road
              TextFormField(
                controller: _streetRoadController,
                decoration: const InputDecoration(
                  labelText: 'Street/Road',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // State Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                value: selectedState,
                items:
                    states.map((state) {
                      return DropdownMenuItem(value: state, child: Text(state));
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                    cities = stateCityMap[value] ?? [];
                    selectedCity = null;
                    selectedArea = null;
                    areas = [];
                  });
                },
              ),
              const SizedBox(height: 16),

              // City Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                value: selectedCity,
                items:
                    cities.map((city) {
                      return DropdownMenuItem(value: city, child: Text(city));
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                    selectedArea = null;
                    // If you have area mapping, load it here
                  });
                },
              ),
              const SizedBox(height: 16),

              // Area Dropdown (optional placeholder)
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Area',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                value: selectedArea,
                items:
                    areas.map((area) {
                      return DropdownMenuItem(value: area, child: Text(area));
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedArea = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Submit button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                  backgroundColor: Colors.transparent, // important
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the drawer first
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ Proper state-city mapping
  final Map<String, List<String>> stateCityMap = {
    "Andhra Pradesh": [
      "Visakhapatnam",
      "Vijayawada",
      "Guntur",
      "Tirupati",
      "Nellore",
    ],
    "Arunachal Pradesh": ["Itanagar", "Tawang", "Pasighat"],
    "Assam": ["Guwahati", "Dibrugarh", "Silchar", "Jorhat", "Tezpur"],
    "Bihar": ["Patna", "Gaya", "Muzaffarpur", "Bhagalpur", "Darbhanga"],
    "Chhattisgarh": ["Raipur", "Bilaspur", "Durg", "Bhilai", "Korba"],
    "Delhi (NCT)": ["New Delhi", "Dwarka", "Rohini", "Karol Bagh", "Saket"],
    "Goa": ["Panaji", "Margao", "Vasco da Gama", "Mapusa"],
    "Gujarat": ["Ahmedabad", "Surat", "Vadodara", "Rajkot", "Gandhinagar"],
    "Haryana": ["Gurugram", "Faridabad", "Panipat", "Karnal", "Hisar"],
    "Himachal Pradesh": ["Shimla", "Manali", "Dharamshala", "Solan", "Mandi"],
    "Jharkhand": ["Ranchi", "Jamshedpur", "Dhanbad", "Bokaro", "Hazaribagh"],
    "Karnataka": ["Bengaluru", "Mysuru", "Mangaluru", "Hubballi", "Belagavi"],
    "Kerala": [
      "Thiruvananthapuram",
      "Kochi",
      "Kozhikode",
      "Thrissur",
      "Kollam",
    ],
    "Madhya Pradesh": ["Bhopal", "Indore", "Gwalior", "Jabalpur", "Ujjain"],
    "Maharashtra": ["Mumbai", "Pune", "Nagpur", "Nashik", "Aurangabad"],
    "Manipur": ["Imphal", "Churachandpur", "Thoubal"],
    "Meghalaya": ["Shillong", "Tura", "Jowai"],
    "Mizoram": ["Aizawl", "Lunglei", "Champhai"],
    "Nagaland": ["Kohima", "Dimapur", "Mokokchung"],
    "Odisha": ["Bhubaneswar", "Cuttack", "Rourkela", "Sambalpur", "Puri"],
    "Punjab": ["Amritsar", "Ludhiana", "Jalandhar", "Patiala", "Bathinda"],
    "Rajasthan": ["Jaipur", "Udaipur", "Jodhpur", "Kota", "Ajmer"],
    "Sikkim": ["Gangtok", "Namchi", "Gyalshing"],
    "Tamil Nadu": [
      "Chennai",
      "Coimbatore",
      "Madurai",
      "Tiruchirappalli",
      "Salem",
    ],
    "Telangana": [
      "Hyderabad",
      "Warangal",
      "Nizamabad",
      "Karimnagar",
      "Khammam",
    ],
    "Tripura": ["Agartala", "Udaipur", "Dharmanagar", "Kailashahar"],
    "Uttar Pradesh": ["Lucknow", "Kanpur", "Varanasi", "Agra", "Noida"],
    "Uttarakhand": [
      "Dehradun",
      "Haridwar",
      "Nainital",
      "Rishikesh",
      "Haldwani",
    ],
    "West Bengal": ["Kolkata", "Siliguri", "Durgapur", "Asansol", "Howrah"],
  };
}