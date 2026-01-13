import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/controller/register_business_controller.dart';
import 'package:flutter_project/controller/user_controller.dart';
import 'package:flutter_project/view/customeSnackBar.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:image_picker/image_picker.dart';

class BusinessForm extends StatefulWidget {
  const BusinessForm({super.key});

  @override
  State<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _plotNoController = TextEditingController();
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _streetRoadController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController category1Controller = TextEditingController();
  TextEditingController category2Controller = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  bool _isCategoryError = false;
  bool _isCategory1Error = false;
  XFile? selectImagefile;
  RegesterBusinesscontroller rejesterprojectobj = RegesterBusinesscontroller();
  bool isloading = false;
  bool isBusinessRegister = false;
  ImagePicker projectImagepicker = ImagePicker();

  // Use the stateCityMap keys as states
  late List<String> states = stateCityMap.keys.toList();
  List<String> cities = [];
  List<String> areas = []; // optional for later use

  String? selectedState;
  String? selectedCity;

  List<String> categories = [
    "Construction",
    "Art",
    "Health",
    "Shopping",
    "Automobile",
    "Education",
    "Entertainment",
    "Travel",
    "Finance",
    "Agriculture",
    "Marketing",
    "Fitness",
    "Music",
    "IT",
  ];
  final Map subCategory1 = {
    'Construction': [
      'Real Estate Services',
      'Home Maintainance And Sevices',
      'Building And Construction',
      'Furniture And Home Decor',
      'Appliance and Utilities',
      'Strorage And Moving',
    ],
    'Art': [
      'Painers',
      'Performing Arts',
      'Traditionals And Handicrafts',
      'Art Learning And Training',
      'Art Supplies And Stores',
    ],
    'Health And Wellness': [
      'Medical And Services',
      'Doctrors And Specialist',
      'Fitness And Lifestyle',
      'Wellness And Beauty',
      'Alternative and Preventive Care',
      'Emergency And Support Services',
    ],
    'Shopping': [
      'Clothing',
      'Footware',
      'Accessories',
      'Cosmetics And Beauty',
      'Shopping Stores',
    ],
    'Automobile': [
      'Vehicles Sales',
      'Repair And Maintainance',
      'Car Care And Detiling',
      'Fule And Charging',
      'Insurance And Support',
      'Accessories And Parts',
    ],
    'Education': [
      'School And Colleges',
      'Coatching And Tuition',
      'Skill Development',
      'Proffesstional Training',
      'Online Learning',
    ],
    'Entertainment': [
      'Movies And Theatre',
      'Games And Recreation',
      'Event Managment',
      'Nightlife And Entertainment venues',
    ],
    'Travel': [
      'Public Transport',
      'Private Transport And Rentails',
      'Travel Agencies And tour Operators',
      'Logistics And Delivery',
      'Automobile And Support Services',
    ],
    'Finance': [
      'Banks And ATM',
      'Chartered Accountants',
      'Insurance Agents',
      'Consultants',
      'Lawyers And Legal Advisers',
    ],
    'Agriculture': [
      'Crop Farming',
      'Dairy And LiveStack',
      'Agri-Consultancy Services',
      'Marketing And Distribution Services',
    ],
    'Marketing': [
      'Digital Marketing Businesses',
      'Adversting And Branding Businesses',
      'E-Commerce And Product Marketing',
      'Event & Experiential Marketing',
      'Consulting And Specialized Marketing',
    ],
    'Fitness': [
      'Fitness Centers And Training',
      'Fitness Products And Equpments',
      'Nutrition & Supplements',
      'Digital And Online Fitness',
      'Wellness & Lifestyle',
    ],
    "Music": [
      "Pop Music",
      "Hip-Hop / Rap",
      "Classical Music",
      "Rock & Metal",
      "Folk & Regional Music",
    ],
    "IT": [
      "Software Development",
      "Cloud & Infrastructure",
      "Data & Analytics",
      "Emerging Technologies",
      "IT Services & Consulting",
    ],
  };
  Map subCategory2 = {
    'Real Estate Services': [
      'Property Dealers/Brokers',
      'Rent/PG?Hostel Listing',
      'Builder & Developers',
      'Architecture',
      'Interior Design',
    ],
    'Home Maintainance And Sevices': [
      'Electrician',
      'Plumbers',
      'Carpenters',
      'Painters',
      'Cleaning Services',
    ],
    'Building And Construction': [
      'Cement/Sand/Brocks Suppliers',
      'Tiles/Marbel/Granite',
      'Paint & Hardware Stores',
      'Conatruction Contractors',
    ],
    'Furniture And Home Decor': [
      'Furniture Shops',
      'Modular Kitchen Dealers',
      'Home Decor & Lighting Shops',
      'Curtains/ Furnishing Stores',
    ],
    'Appliance and Utilities': [
      'Home Appliances Dealers',
      'Water Purifiers/RO Dealers',
      'Solar Systems & Inverters',
      'Security Systems',
    ],
    'Strorage And Moving': [
      'Packers & Movers',
      'Warehousing/Strorage',
      'Transport Services For Shifting',
    ],
    'Painers': [
      'Portaits',
      'Abstract',
      'Landscape',
      'Wall Artist',
      'Sculptors',
    ],
    'Performing Arts': [
      'Dancers',
      'Musicians /Singers',
      'Theatre Artists',
      'Bands/DJs',
    ],
    'Traditionals And Handicrafts': [
      'Pottery /Clay Art',
      'Wood Carving',
      'Handloom & Weaving',
      'Folk Arts',
      'Jwellery / Handicrafts Makers',
    ],
    'Art Learning And Training': [
      'Art Schools/Drawing Classes',
      'Dance Academis',
      'Music Classes',
      'Acting/Theaters Workshops',
    ],
    'Art Supplies And Stores': [
      'Painting & Crafts Material Shops',
      'Musical  Instrument Shops',
      'Dance Castumes & Accessories',
    ],
    'Medical Services': [
      'Hospital',
      'Clincs',
      ' Diagnostic Labs / Pathology Labs',
      ' Pharmacies / Medical stores',
    ],
    'Doctrors And Specialist': [
      'General physicians',
      'Dentists',
      'Eye Specialists ',
      'Gynecologists',
      'pediatricians ',
      'orthopedic/Bone Specialists',
    ],
    'Fitness And Lifestyle': [
      'Gyms/fitness centre',
      'Yoga & Meditation centre',
      'zumba / Aerobics classes',
      'Personal Trainers',
    ],
    'Wellness And Beauty': [
      'Beauty Parlours /salons',
      'spa & Massage Centres',
      'Skin & Hair clinics',
      'Dieticians/ Nutritionists',
    ],
    'Alternative and Preventive Care': [
      'Ayurvedic centres',
      'Homoepathy clinics',
      'Naturopathy',
      'Acupuncture & Acupressure',
    ],
    'Emergency And Support Services': [
      'Ambulance Services',
      'Blood Bank',
      'Counselling & Therapy Centres',
      'Health NGO',
    ],
    'Clothing': [
      'Mens Wear',
      'Womens Wear ',
      'kids wear',
      'Ethnic & Traditional Wear',
      'Designer Boutiques',
    ],
    'Footware': [
      'Mens shoes',
      'Womens footwear',
      'Sports & out door footwear',
      'Handmade /custom footwear',
    ],
    'Accessories': [
      'Bags & wallests',
      'Belts & sunglasses',
      'Watches & Jwellery',
      'Scarves, Caps & Hats',
    ],
    'Cosmetics And Beauty': [
      'Makeup & Skincare products',
      'Perfumes & Deodorants',
      'Organic & Herbal products',
    ],
    'Shopping Stores': [
      'Fashion Retail Chains',
      ' Online Shopping stores',
      'Thrift/pre-owned Stores',
      'Local Handloom & Boutique shops',
    ],
    'Vehicles Sales': [
      'New Car showrooms ',
      'Used Car Dealers',
      ' Bike & Scooter Showrooms',
      'Luxury / Premium vehicles Dealers',
    ],
    'Repair And Maintainance': [
      'Autorized Services Centres',
      'Local  Garages & workshops',
      'Body shop & Denting - Painting',
      'Engine & transmission Repair',
    ],
    'Car Care And Detiling': [
      'Car/Bike wash',
      'Interior & Exterior Detailing',
      'Ceramic Coating /PPf',
      'Polishing & wrapping',
    ],
    'Fule And Charging': [
      'Petrol & Dieset fuel stations',
      'CNG filling stations',
      'Ev Charging Stations',
      'Battery Replacement Services',
    ],
    'Insurance And Support': [
      'vehicle Insurance Agents',
      'Roadside Assistance',
      'Towing Services',
      'vehicle Finance & Loan Services',
    ],
    'Accessories And Parts': [
      'Spare parts shops',
      'Car & Bike Accessories ',
      'Tyre & Battery shops',
      'Alloy wheels & customization',
    ],
    'School And Colleges': [
      'Play schools / Pre-schools',
      'Primary & Secondary schools',
      'Junior & senior colleges',
      'Proffesional colleges, ',
    ],
    'Coatching And Tuition': [
      'School/ college taition classes',
      'Competitive exam Coaching ',
      'Language classes ',
      'Personality Development & soft skills',
    ],
    'Skill Development': [
      'Computer & It Training Institutes',
      'vocational Training ',
      'Digital Marketing & Design Cources',
      'Public speaking & Communication skills',
    ],
    'Proffesstional Training': [
      'Corporate & Training',
      'Finance & Business Cources',
      'Medical Paramedical Training',
      'Teacher training Institute',
    ],
    'Online Learning': [
      'E-learning platforms',
      'Recorded viedeo Cources',
      'Live Online classes',
      'Certification programs',
    ],
    'Movies And Theatre': [
      'Movies & Theatre',
      'Cinemas / Multiplexes',
      'Theatre Groups / Drama Clubs',
      'film production Houses',
      'Short Film & Indie Film Creators',
    ],
    'Games And Recreation': [
      'Games Zones/Arcades',
      'Bowling /Pool/Snooker Club',
      'VR/ Gaming Arenas',
      'Indoor/Outdoor Sports Venues',
    ],
    'Event Managment': [
      'Event Organisers & Planners',
      'Corporate Event Managment ',
      'Festival & Cultural Event Management',
    ],
    'Nightlife And Entertainment venues': [
      'Bars & Pubs',
      'Clubs & Lounges',
      'Live Performance Venues',
      'Cafes & Lounges With Live Music',
    ],
    'Public Transport': [
      'Bus Services',
      'Metro /Local Trains',
      'Taxi/ Cab Services',
      'Auto Rickshaws/ E-Rickshaws',
    ],
    'Private Transport And Rentails': [
      'Cars /Bikes Rentals',
      'Chaffeur Services',
      'Self Drive Rentals',
      'Luxury/Premium Vehicle Rentals',
    ],
    'Travel Agencies And tour Operators': [
      'Domestic & International Tour Packages',
      ' Adventure & Eco Tours',
      'Cruise & Boat Tours',
      'Customised Travel Planning',
    ],
    'Logistics And Delivery': [
      'Logistics & Cargo ',
      'Courier & Parcel Delivery ',
      'E-Commerce Deliveries ',
    ],
    'Automobile And Support Services': [
      'Vehicle Leasing ',
      'Ev Rentals & charging Stations',
      'Automobile Repair & Maintanance ',
    ],
    'Banks And ATM': [
      'Public Sector Banks ',
      'Private Sector Banks',
      'Private Sector Banks',
      'Regional Rural Banks ',
      'foreign Banks',
      'ATMS & Digital Banking Services',
    ],
    'Chartered Accountants': [
      'Tax filling & advisory',
      'Audit & Assurance Services',
      'GST & Compliance Services',
      'Financial Planning & Budgeting',
      'Business Registration & Company setup',
      'Corporate Governance Advisory',
    ],
    'Insurance Agents': [
      'Life Insurance Agents',
      'Health Insurance Agents',
      'General Insurance Agents',
      'Corporate Insurance Advisors',
      'Online/Digital Insurance Brokers',
      'Relinsurance Agents',
    ],
    'Consultants': [
      'Business Consultants ',
      'Financial Consultants ',
      'Tax Consultants',
      'Risk & Compliance Consultants',
      'Startup Consultants',
      'HR & Payroll Consultants',
    ],
    'Lawyers And Legal Advisers': [
      'Corporate Lawyers',
      'Civil Lawyers',
      'Criminal Lawyers',
      'Intellectual Property ',
      'Arbitration & Mediation Expeds',
      'Legal Consultants for Startups & SPAZI SMES',
    ],
    'Crop Farming': [
      'Food crops ',
      'Cash Crops ',
      'Horticulture ',
      'Organic Forming',
      'Modern Farming ',
    ],
    'Dairy And LiveStack': [
      'Dairy Farming',
      ' Poultry Farming ',
      'Goat & sheep farming',
      'fish farming ',
      'Beekeeping ',
    ],
    'Agri-Consultancy Services': [
      'Crop Management Advisory',
      'Fertilizer & Pesticide Guidance',
      'Soil Testing & Irrigation Advice',
      'Government schemas & subsidy Help',
      'Organic Certification & Quality checks',
    ],
    'Marketing And Distribution Services': [
      'Agri e-commerce Platforms',
      'Farmer Producer Companies ',
      'Cold Storage & warehousing services',
      'Agri- logistics & Supply chain Solutions',
      'wholesale mondis & direct-to-Consumer outlets',
    ],
    'Digital Marketing Businesses': [
      'Social media marketing agency',
      'SEO services',
      'content marketing agency ',
      'Influencer marketing platform',
      'Emails & 8ms marketing services.',
    ],
    'Adversting And Branding Businesses': [
      'outdoor advertising ',
      'Branding & design studio',
      'Print media advertising',
      'Creative ad agency ',
      'Personal branding consulteney',
    ],
    'E-Commerce And Product Marketing': [
      'Dropshipping store',
      'Affiliate marketing business',
      'Product review & comparison, website',
      'Market place Seller',
      'Subscription box marketing',
    ],
    'Event & Experiential Marketing': [
      'Event management company',
      'Trade shows & exhibition marketing',
      'Product Launch Promotion',
      'college/ Corporate event sponsorship marketing',
      'Street marketing campaigns',
    ],
    'Consulting And Specialized Marketing': [
      'Marketing Consultancy for Startups',
      'Political campaign marketing',
      'Real estate marketing agency',
      'Health Care Marketing',
      'Education marketing ',
    ],
    'Fitness Centers And Training': [
      'Gyms & health clubs',
      'Personal training Studios',
      'Crossfit & functional training centers',
      'Yoga & pilates studios',
      'Martial arts & self-defense academies',
    ],
    'Fitness Products And Equpments': [
      'Gym equipment Sales & rentals',
      'Home workout equipment ',
      'Sportswear & activewear brands',
      'Fitness accessories',
    ],
    'Nutrition & Supplements': [
      'Protein powders & Supplement stores',
      'Healthy meal prep services',
      'Smoothie & juice bars',
      'Diet & nutrition Consultancy',
      'Online supplement Subscription boxes',
    ],
    'Digital And Online Fitness': [
      'Fitness apps ',
      'Online Coaching & training programs',
      'Virtual classes',
      'fitness blogs & content platforms',
      'fitness gadgets & wearables ',
    ],
    'Wellness & Lifestyle': [
      'spa & recovery Centers',
      'physiotherapy & sports rehab clinics',
      'corporate wellness programs',
      'mental health & mindfulness programs',
      'fitness retreats & bootcamps',
    ],
    "Pop Music": [
      "Synth Pop",
      "Dance Pop",
      "Indie Pop",
      "K-Pop ",
      "Electro Pop",
    ],
    "Hip-Hop / Rap": [
      "Old School Hip-Hop",
      "Trap",
      "Desi Hip-Hop",
      "Lo-Fi Rap",
      "Conscious Rap",
    ],
    "Classical Music": [
      "Hindustani Classical",
      "Carnatic Classical",
      "Western Classical",
      "Instrumental Classical",
      "Fusion Classical",
    ],
    "Rock & Metal": [
      "Classic Rock",
      "Hard Rock",
      "Alternative Rock",
      "Heavy Metal",
      "Soft Rock",
    ],
    "Folk & Regional Music": [
      "Marathi Folk",
      "Punjabi Folk",
      "Rajasthani Folk",
      "Bengali Folk",
      "South Indian Folk",
    ],
    "Software Development": [
      "Web Development",
      "Mobile App Development",
      "Desktop Applications",
      "Game Development",
      "Software Testing & QA",
    ],
    " Cloud & Infrastructure": [
      "Cloud Computing",
      "DevOps & Automation",
      "Network Administration",
      "IT Support & Maintenance",
      "Cybersecurity Infrastructure",
    ],
    "Data & Analytics": [
      "Data Science",
      "Artificial Intelligence & Machine Learning",
      "Big Data Engineering",
      "Business Intelligence",
      "Database Management",
    ],
    "Emerging Technologies": [
      "Internet of Things",
      "Blockchain Development",
      "Augmented & Virtual Reality",
      "Robotics",
      "Quantum Computing",
    ],
    "IT Services & Consulting": [
      "IT Project Management",
      "ERP & CRM Solutions",
      "Digital Transformation Consulting",
      "Technical Support Services",
      "System Integration",
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 👈 leading icon
          onPressed: () {
            Navigator.pop(context); // Close the drawer first
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      selectImagefile = await projectImagepicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      log("Selected Imge:${selectImagefile?.path}");
                      setState(() {});
                    },
                    child: Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2), // border thickness
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // inner background
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: const Icon(
                                Icons.add,
                                size: 30,
                                color:
                                    Colors.white, // acts as mask for gradient
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("Add Image", style: TextStyle(fontSize: 20)),
                ],
              ),
              const SizedBox(height: 16),
              // Business Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter business name'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: discriptionController,
                decoration: InputDecoration(
                  labelText: 'Discription',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   //fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter business name'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _gstController,
                decoration: InputDecoration(
                  labelText: 'GST No',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: categoryController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Category",
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorText: _isCategoryError
                      ? "Please select category first"
                      : null,
                ),
                onTap: () async {
                  _isCategoryError = false;
                  setState(() {});
                  final RenderBox renderBox =
                      context.findRenderObject() as RenderBox;
                  final Offset offset = renderBox.localToGlobal(Offset.zero);

                  // show popup dropdown
                  final selected = await showMenu<String>(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      offset.dx + 20,
                      offset.dy + 200,
                      offset.dx + 100,
                      0,
                    ),
                    items: categories
                        .map(
                          (cat) => PopupMenuItem<String>(
                            value: cat,
                            child: Text(cat),
                          ),
                        )
                        .toList(),
                  );
                  if (selected != null) {
                    setState(() {
                      categoryController.text = selected;
                      category1Controller.clear();
                      category2Controller.clear();
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: category1Controller,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Sub Category 1",
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorText: _isCategory1Error
                      ? "Please select category first"
                      : null,
                ),
                onTap: () async {
                  if (categoryController.text.isEmpty) {
                    setState(() => _isCategoryError = true);
                    return;
                  }
                  _isCategory1Error = false;
                  setState(() {});

                  // final subcategories =
                  //     subCategory1[category1Controller.text] ?? [];

                  if (subCategory1.isEmpty) return;

                  final RenderBox renderBox =
                      context.findRenderObject() as RenderBox;
                  final Offset offset = renderBox.localToGlobal(Offset.zero);

                  final selected = await showMenu<String>(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      offset.dx + 20,
                      offset.dy + 300,
                      offset.dx + 200,
                      0,
                    ),
                    items: (subCategory1[categoryController.text] ?? [])
                        .map<PopupMenuItem<String>>(
                          (sub) => PopupMenuItem<String>(
                            value: sub,
                            child: Text(sub),
                          ),
                        )
                        .toList(),
                  );

                  if (selected != null) {
                    setState(() {
                      category1Controller.text = selected;
                      category2Controller.clear();
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: category2Controller,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Sub Category 2",
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onTap: () async {
                  if (category1Controller.text.isEmpty) {
                    setState(() => _isCategory1Error = true);
                    return;
                  }
                  _isCategory1Error = false;
                  setState(() {});

                  // final subcategories =
                  //       subCategory2[category2Controller.text] ?? [];

                  if (subCategory2.isEmpty) return;

                  final RenderBox renderBox =
                      context.findRenderObject() as RenderBox;
                  final Offset offset = renderBox.localToGlobal(Offset.zero);

                  final selected = await showMenu<String>(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      offset.dx + 20,
                      offset.dy + 300,
                      offset.dx + 200,
                      0,
                    ),
                    items: (subCategory2[category1Controller.text] ?? [])
                        .map<PopupMenuItem<String>>(
                          (sub) => PopupMenuItem<String>(
                            value: sub,
                            child: Text(sub),
                          ),
                        )
                        .toList(),
                  );

                  if (selected != null) {
                    setState(() {
                      category2Controller.text = selected;
                    });
                  }
                },
              ),

              SizedBox(height: 16),

              // Pincode
              TextFormField(
                controller: _pincodeController,
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter pincode'
                    : null,
              ),
              const SizedBox(height: 16),

              // Plot No.
              TextFormField(
                controller: _plotNoController,
                decoration: InputDecoration(
                  labelText: 'Plot No.',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Building Name
              TextFormField(
                controller: _buildingNameController,
                decoration: InputDecoration(
                  labelText: 'Building Name',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Street / Road
              TextFormField(
                controller: _streetRoadController,
                decoration: InputDecoration(
                  labelText: 'Street/Road',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // State Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'State',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                value: selectedState,
                items: states.map((state) {
                  return DropdownMenuItem(value: state, child: Text(state));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                    cities = stateCityMap[value] ?? [];
                    selectedCity = null;

                    areas = [];
                  });
                },
              ),
              const SizedBox(height: 16),

              // City Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'City',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                value: selectedCity,
                items: cities.map((city) {
                  return DropdownMenuItem(value: city, child: Text(city));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;

                    // If you have area mapping, load it here
                  });
                },
              ),
              const SizedBox(height: 16),

              // Area Dropdown (optional placeholder)
              TextField(
                controller: areaController,
                decoration: InputDecoration(
                  labelText: 'Area',
                  // labelStyle: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
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
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () async {
                  FocusScope.of(context).unfocus();

                  if (_nameController.text.trim().isNotEmpty &&
                      categoryController.text.trim().isNotEmpty &&
                      category1Controller.text.trim().isNotEmpty &&
                      category2Controller.text.trim().isNotEmpty) {
                    isloading = true;
                    setState(() {});

                    try {
                      String fileName =
                          "${selectImagefile!.name}_${DateTime.now().millisecondsSinceEpoch}";
                      String email = UserController().email;

                      // ✅ Upload image
                      await rejesterprojectobj.uploadImage(
                        filename: fileName,
                        selectedFile: File(selectImagefile!.path),
                      );

                      // ✅ Get image URL
                      String generatedUrl = await rejesterprojectobj
                          .downloadImage(fileName: fileName);
                      log("URL: $generatedUrl");

                      // ✅ Prepare data for Firestore
                      Map<String, dynamic> data = {
                        "businessName": _nameController.text,
                        "category": categoryController.text,
                        "subcategory1": category1Controller.text,
                        "subcategory2": category2Controller.text,
                        "pincode": _pincodeController.text,
                        "plotNo": _plotNoController.text,
                        "buildingName": _buildingNameController.text,
                        "road": _streetRoadController.text,
                        "state": selectedState,
                        "city": selectedCity,
                        "area": areaController.text,
                        "gst": _gstController.text,
                        "discription": discriptionController.text,
                        "imageUrl": generatedUrl,
                        "email": email,
                        "timeStamp": DateTime.now(),
                      };

                      // ✅ Add data to Firestore
                      await rejesterprojectobj.addData(data: data);

                      CustomSnackBars().showCustomSnackbar(
                        context,
                        "Business Registered Successfully ✅",
                      );

                      // ✅ Update Shared Preference
                      UserController userController = UserController();
                      await userController.setRegisterBusiness({
                        'isRegisterBusiness': true,
                      });
                      isBusinessRegister = true;

                      // ✅ Navigate to Home page immediately
                      Navigator.pushReplacementNamed(context, '/home');
                    } catch (e) {
                      log("Error: $e");
                      CustomSnackBars().showCustomSnackbar(
                        context,
                        "Something went wrong 😕",
                        bgColor: Colors.red,
                      );
                    } finally {
                      setState(() => isloading = false);
                    }
                  } else {
                    CustomSnackBars().showCustomSnackbar(
                      context,
                      "Please provide valid data ❗",
                      bgColor: Colors.red,
                    );
                  }

                  // ✅ Clear all input fields
                  categoryController.clear();
                  category1Controller.clear();
                  category2Controller.clear();
                  _nameController.clear();
                  _gstController.clear();
                  _pincodeController.clear();
                  _plotNoController.clear();
                  _buildingNameController.clear();
                  _streetRoadController.clear();
                  selectedState = null;
                  selectedCity = null;
                  selectImagefile = null;
                  discriptionController.clear();
                  areaController.clear();
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
