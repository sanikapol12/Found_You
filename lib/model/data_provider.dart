// import 'package:flutter/material.dart';
// import 'package:flutter_project/model/subcategory_model.dart';
// import 'category_model.dart';

// class DataProvider {
//   static final List<Category> categories = [
//     // Add your full dataset here
//     Category(
//       name: "Construction",
//       icon:
//           "https://th.bing.com/th/id/OIP.oiiCCJdEpvY79CRlJ1wL-QAAAA?w=180&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
//       subcategories: [
//         SubCategory(
//           name: "Real Estate Services",
//           subSubCategories: [
//             'Property Dealers/Brokers',
//             'Rent/PG?Hostel Listing',
//             'Builder & Developers',
//             'Architecture',
//             'Interior Design',
//           ],
//         ),
//         SubCategory(
//           name: "Home Maintainance And Sevices",
//           subSubCategories: [
//             'Electrician',
//             'Plumbers',
//             'Carpenters',
//             'Painters',
//             'Cleaning Services',
//           ],
//         ),
//         SubCategory(
//           name: "Building And Construction",
//           subSubCategories: [
//             'Cement/Sand/Brocks Suppliers',
//             'Tiles/Marbel/Granite',
//             'Paint & Hardware Stores',
//             'Conatruction Contractors',
//           ],
//         ),
//         SubCategory(
//           name: "Furniture And Home Decor",
//           subSubCategories: [
//             'Furniture Shops',
//             'Modular Kitchen Dealers',
//             'Home Decor & Lighting Shops',
//             'Curtains/ Furnishing Stores',
//           ],
//         ),
//         SubCategory(
//           name: "Appliance and Utilities",
//           subSubCategories: [
//             'Home Appliances Dealers',
//             'Water Purifiers/RO Dealers',
//             'Solar Systems & Inverters'
//                 'Security Systems',
//           ],
//         ),
//         SubCategory(
//           name: "Strorage And Moving",
//           subSubCategories: [
//             'Packers & Movers',
//             'Warehousing/Strorage',
//             'Transport Services For Shifting',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Art",
//       icon:
//           "https://th.bing.com/th/id/OIP.F3PPENi06nEUsd2ED3aQBgAAAA?w=183&h=183&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
//       subcategories: [
//         SubCategory(
//           name: "Painers",
//           subSubCategories: [
//             'Portaits',
//             'Abstract',
//             'Landscape',
//             'Wall Artist',
//             'Sculptors',
//           ],
//         ),
//         SubCategory(
//           name: "Performing Arts",
//           subSubCategories: [
//             'Dancers',
//             'Musicians /Singers',
//             'Theatre Artists',
//             'Bands/DJs',
//           ],
//         ),
//         SubCategory(
//           name: "Traditionals And Handicrafts",
//           subSubCategories: [
//             'Pottery /Clay Art',
//             'Wood Carving',
//             'Handloom & Weaving',
//             'Folk Arts',
//             'Jwellery / Handicrafts Makers',
//           ],
//         ),
//         SubCategory(
//           name: "Art Learning And Training",
//           subSubCategories: [
//             'Art Schools/Drawing Classes',
//             'Dance Academis',
//             'Music Classes',
//             'Acting/Theaters Workshops',
//           ],
//         ),
//         SubCategory(
//           name: "Art Supplies And Stores",
//           subSubCategories: [
//             'Painting & Crafts Material Shops',
//             'Musical  Instrument Shops',
//             'Dance Castumes & Accessories',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Finance",
//       icon:
//           "https://th.bing.com/th/id/OIP.3rOerrxxHSJ-ndtu9qV9NAHaHa?w=186&h=186&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
//       subcategories: [
//         SubCategory(
//           name: "Banks And ATM",
//           subSubCategories: [
//             'Public Sector Banks ',
//             'Private Sector Banks',
//             'Private Sector Banks',
//             'Regional Rural Banks ',
//             'foreign Banks',
//             'ATMS & Digital Banking Services',
//           ],
//         ),
//         SubCategory(
//           name: "Chartered Accountants",
//           subSubCategories: [
//             'Tax filling & advisory',
//             'Audit & Assurance Services',
//             'GST & Compliance Services',
//             'Financial Planning & Budgeting',
//             'Business Registration & Company setup',
//             'Corporate Governance Advisory',
//           ],
//         ),
//         SubCategory(
//           name: "Insurance Agents",
//           subSubCategories: [
//             'Life Insurance Agents',
//             'Health Insurance Agents',
//             'General Insurance Agents',
//             'Corporate Insurance Advisors',
//             'Online/Digital Insurance Brokers',
//             'Relinsurance Agents',
//           ],
//         ),
//         SubCategory(
//           name: "Consultants",
//           subSubCategories: [
//             'Business Consultants ',
//             'Financial Consultants ',
//             'Tax Consultants',
//             'Risk & Compliance Consultants',
//             'Startup Consultants',
//             'HR & Payroll Consultants',
//           ],
//         ),
//         SubCategory(
//           name: "Lawyers And Legal Advisers",
//           subSubCategories: [
//             'Corporate Lawyers',
//             'Civil Lawyers',
//             'Criminal Lawyers',
//             'Intellectual Property ',
//             'Arbitration & Mediation Expeds',
//             'Legal Consultants for Startups & SPAZI SMES',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "IT",
//       icon:
//           "https://th.bing.com/th/id/OIP.VdtwQAGRmJ4YeOjdGtyztAHaHa?w=183&h=183&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Software Development",
//           subSubCategories: [
//             "Web Development",
//             "Mobile App Development",
//             "Desktop Applications",
//             "Game Development",
//             "Software Testing & QA",
//           ],
//         ),
//         SubCategory(
//           name: "Cloud & Infrastructure",
//           subSubCategories: [
//             "Cloud Computing",
//             "DevOps & Automation",
//             "Network Administration",
//             "IT Support & Maintenance",
//             "Cybersecurity Infrastructure",
//           ],
//         ),
//         SubCategory(
//           name: "Data & Analytics",
//           subSubCategories: [
//             "Data Science",
//             "Artificial Intelligence & Machine Learning",
//             "Big Data Engineering",
//             "Business Intelligence",
//             "Database Management",
//           ],
//         ),
//         SubCategory(
//           name: "Emerging Technologies",
//           subSubCategories: [
//             "Internet of Things",
//             "Blockchain Development",
//             "Augmented & Virtual Reality",
//             "Robotics",
//             "Quantum Computing",
//           ],
//         ),
//         SubCategory(
//           name: "IT Services & Consulting",
//           subSubCategories: [
//             "IT Project Management",
//             "ERP & CRM Solutions",
//             "Digital Transformation Consulting",
//             "Technical Support Services",
//             "System Integration",
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Travel",
//       icon:
//           "https://th.bing.com/th/id/OIP.RGnR_KxggN33VuzxLW28YAHaHa?w=211&h=211&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Public Transport",
//           subSubCategories: [
//             'Bus Services',
//             'Metro /Local Trains',
//             'Taxi/ Cab Services',
//             'Auto Rickshaws/ E-Rickshaws',
//           ],
//         ),
//         SubCategory(
//           name: "Private Transport And Rentails",
//           subSubCategories: [
//             'Cars /Bikes Rentals',
//             'Chaffeur Services',
//             'Self Drive Rentals',
//             'Luxury/Premium Vehicle Rentals',
//           ],
//         ),
//         SubCategory(
//           name: "Travel Agencies And tour Operators",
//           subSubCategories: [
//             'Cars /Bikes Rentals',
//             'Chaffeur Services',
//             'Self Drive Rentals',
//             'Luxury/Premium Vehicle Rentals',
//           ],
//         ),
//         SubCategory(
//           name: "Logistics And Delivery",
//           subSubCategories: [
//             'Logistics & Cargo ',
//             'Courier & Parcel Delivery ',
//             'E-Commerce Deliveries ',
//           ],
//         ),
//         SubCategory(
//           name: "Automobile And Support Services",
//           subSubCategories: [
//             'Vehicle Leasing ',
//             'Ev Rentals & charging Stations',
//             'Automobile Repair & Maintanance ',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Healthcare",
//       icon:
//           "https://th.bing.com/th/id/OIP.5ZT6asS6jj-AyKbQ_MM-6wHaHa?w=174&h=180&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Medical And Services",
//           subSubCategories: [
//             'Hospital',
//             'Clincs',
//             ' Diagnostic Labs / Pathology Labs',
//             ' Pharmacies / Medical stores',
//           ],
//         ),
//         SubCategory(
//           name: "Doctrors And Specialist",
//           subSubCategories: [
//             'General physicians',
//             'Dentists',
//             'Eye Specialists ',
//             'Gynecologists',
//             'pediatricians ',
//             'orthopedic/Bone Specialists',
//           ],
//         ),
//         SubCategory(
//           name: "Fitness And Lifestyle",
//           subSubCategories: [
//             'Gyms/fitness centre',
//             'Yoga & Meditation centre',
//             'zumba / Aerobics classes',
//             'Personal Trainers',
//           ],
//         ),
//         SubCategory(
//           name: "Wellness And Beauty",
//           subSubCategories: [
//             'Beauty Parlours /salons',
//             'spa & Massage Centres',
//             'Skin & Hair clinics',
//             'Dieticians/ Nutritionists',
//           ],
//         ),
//         SubCategory(
//           name: "Alternative and Preventive Care",
//           subSubCategories: [
//             'Ayurvedic centres',
//             'Homoepathy clinics',
//             'Naturopathy',
//             'Acupuncture & Acupressure',
//           ],
//         ),
//         SubCategory(
//           name: "Emergency And Support Services",
//           subSubCategories: [
//             'Ambulance Services',
//             'Blood Bank',
//             'Counselling & Therapy Centres',
//             'Health NGO',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Marketing",
//       icon:
//           "https://th.bing.com/th/id/OIP.ZDmuJDGN71cFIcebyHCTUAAAAA?w=193&h=193&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Digital Marketing Businesses",
//           subSubCategories: [
//             'Social media marketing agency',
//             'SEO services',
//             'content marketing agency ',
//             'Influencer marketing platform',
//             'Emails & 8ms marketing services.',
//           ],
//         ),
//         SubCategory(
//           name: "Adversting And Branding Businesses",
//           subSubCategories: [
//             'outdoor advertising ',
//             'Branding & design studio',
//             'Print media advertising',
//             'Creative ad agency ',
//             'Personal branding consulteney',
//           ],
//         ),
//         SubCategory(
//           name: "E-Commerce And Product Marketing",
//           subSubCategories: [
//             'Dropshipping store',
//             'Affiliate marketing business',
//             'Product review & comparison, website',
//             'Market place Seller',
//             'Subscription box marketing',
//           ],
//         ),
//         SubCategory(
//           name: "Event & Experiential Marketing",
//           subSubCategories: [
//             'Event management company',
//             'Trade shows & exhibition marketing',
//             'Product Launch Promotion',
//             'college/ Corporate event sponsorship marketing',
//             'Street marketing campaigns',
//           ],
//         ),
//         SubCategory(
//           name: "Consulting And Specialized Marketing",
//           subSubCategories: [
//             'Marketing Consultancy for Startups',
//             'Political campaign marketing',
//             'Real estate marketing agency',
//             'Health Care Marketing',
//             'Education marketing ',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Shopping",
//       icon:
//           "https://tse4.mm.bing.net/th/id/OIP.vfqUDjzfWKs9xtLC5NShYAAAAA?rs=1&pid=ImgDetMain&o=7&rm=3",
//       subcategories: [
//         SubCategory(
//           name: "Clothing",
//           subSubCategories: [
//             'Mens Wear',
//             'Womens Wear ',
//             'kids wear',
//             'Ethnic & Traditional Wear',
//             'Designer Boutiques',
//           ],
//         ),
//         SubCategory(
//           name: "Footware",
//           subSubCategories: [
//             'Mens shoes',
//             'Womens footwear',
//             'Sports & out door footwear',
//             'Handmade /custom footwear',
//           ],
//         ),
//         SubCategory(
//           name: "Accessories",
//           subSubCategories: [
//             'Bags & wallests',
//             'Belts & sunglasses',
//             'Watches & Jwellery',
//             'Scarves, Caps & Hats',
//           ],
//         ),
//         SubCategory(
//           name: "Cosmetics And Beauty",
//           subSubCategories: [
//             'Makeup & Skincare products',
//             'Perfumes & Deodorants',
//             'Organic & Herbal products',
//           ],
//         ),
//         SubCategory(
//           name: "Shopping Stores",
//           subSubCategories: [
//             'Fashion Retail Chains',
//             ' Online Shopping stores',
//             'Thrift/pre-owned Stores',
//             'Local Handloom & Boutique shops',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Entertainment",
//       icon:
//           "https://th.bing.com/th/id/OIP.czQBpXXMDngHZP5J-5_XtQHaFB?w=259&h=180&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Movies And Theatre",
//           subSubCategories: [
//             'Movies & Theatre',
//             'Cinemas / Multiplexes',
//             'Theatre Groups / Drama Clubs',
//             'film production Houses',
//             'Short Film & Indie Film Creators',
//           ],
//         ),
//         SubCategory(
//           name: "Games And Recreation",
//           subSubCategories: [
//             'Games Zones/Arcades',
//             'Bowling /Pool/Snooker Club',
//             'VR/ Gaming Arenas',
//             'Indoor/Outdoor Sports Venues',
//           ],
//         ),
//         SubCategory(
//           name: "Event Managment",
//           subSubCategories: [
//             'Event Organisers & Planners',
//             'Corporate Event Managment ',
//             'Festival & Cultural Event Management',
//           ],
//         ),
//         SubCategory(
//           name: "Nightlife And Entertainment venues",
//           subSubCategories: [
//             'Bars & Pubs',
//             'Clubs & Lounges',
//             'Live Performance Venues',
//             'Cafes & Lounges With Live Music',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Food",
//       icon:
//           "https://th.bing.com/th/id/OIP.3itAnEFIP6c8uiuHGXH5YAAAAA?w=169&h=180&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Restaurant / Dhaba",
//           subSubCategories: ["Builder 1", "Builder 2", "Builder 3"],
//         ),
//         SubCategory(
//           name: "Fast Food",
//           subSubCategories: ["Contractor 1", "Contractor 2"],
//         ),
//         SubCategory(
//           name: "Bakery",
//           subSubCategories: ["Designer 1", "Designer 2"],
//         ),
//         SubCategory(
//           name: "Healthy & Organic",
//           subSubCategories: ["Supplier 1", "Supplier 2"],
//         ),
//         SubCategory(
//           name: "Cafe & Snacks Corner",
//           subSubCategories: ["Architect 1", "Architect 2"],
//         ),
//       ],
//     ),
//     Category(
//       name: "Agriculture",
//       icon:
//           "https://th.bing.com/th/id/OIP.YICxldacSg5xbW0i9PZPdwAAAA?w=186&h=186&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Crop Farming",
//           subSubCategories: [
//             'Food crops ',
//             'Cash Crops ',
//             'Horticulture ',
//             'Organic Forming',
//             'Modern Farming ',
//           ],
//         ),
//         SubCategory(
//           name: "Agri-Consultancy Services",
//           subSubCategories: [
//             'Crop Management Advisory',
//             'Fertilizer & Pesticide Guidance',
//             'Soil Testing & Irrigation Advice',
//             'Government schemas & subsidy Help',
//             'Organic Certification & Quality checks',
//           ],
//         ),
//         SubCategory(
//           name: "Marketing And Distribution Services",
//           subSubCategories: [
//             'Agri e-commerce Platforms',
//             'Farmer Producer Companies ',
//             'Cold Storage & warehousing services',
//             'Agri- logistics & Supply chain Solutions',
//             'wholesale mondis & direct-to-Consumer outlets',
//           ],
//         ),
//         SubCategory(
//           name: "Dairy And LiveStacks",
//           subSubCategories: [
//             'Dairy Farming',
//             ' Poultry Farming ',
//             'Goat & sheep farming',
//             'fish farming ',
//             'Beekeeping ',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Fitness",
//       icon:
//           "https://th.bing.com/th/id/OIP.pfzI4uPsOYh1JSprD3n_5QAAAA?w=184&h=184&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Fitness Centers And Training",
//           subSubCategories: [
//             'Gyms & health clubs',
//             'Personal training Studios',
//             'Crossfit & functional training centers',
//             'Yoga & pilates studios',
//             'Martial arts & self-defense academies',
//           ],
//         ),
//         SubCategory(
//           name: "Fitness Products And Equpments",
//           subSubCategories: [
//             'Gym equipment Sales & rentals',
//             'Home workout equipment ',
//             'Sportswear & activewear brands',
//             'Fitness accessories',
//           ],
//         ),
//         SubCategory(
//           name: "Nutrition & Supplements",
//           subSubCategories: [
//             'Protein powders & Supplement stores',
//             'Healthy meal prep services',
//             'Smoothie & juice bars',
//             'Diet & nutrition Consultancy',
//             'Online supplement Subscription boxes',
//           ],
//         ),
//         SubCategory(
//           name: "Digital And Online Fitness",
//           subSubCategories: [
//             'Fitness apps ',
//             'Online Coaching & training programs',
//             'Virtual classes',
//             'fitness blogs & content platforms',
//             'fitness gadgets & wearables ',
//           ],
//         ),
//         SubCategory(
//           name: "Wellness & Lifestyle",
//           subSubCategories: [
//             'spa & recovery Centers',
//             'physiotherapy & sports rehab clinics',
//             'corporate wellness programs',
//             'mental health & mindfulness programs',
//             'fitness retreats & bootcamps',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Music",
//       icon:
//           "https://th.bing.com/th/id/OIP.760UqadIMMqBTWliinKMnwHaHa?w=188&h=188&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Pop Music",
//           subSubCategories: [
//             "Synth Pop",
//             "Dance Pop",
//             "Indie Pop",
//             "K-Pop ",
//             "Electro Pop",
//           ],
//         ),
//         SubCategory(
//           name: "Hip-Hop / Rap",
//           subSubCategories: [
//             "Old School Hip-Hop",
//             "Trap",
//             "Desi Hip-Hop",
//             "Lo-Fi Rap",
//             "Conscious Rap",
//           ],
//         ),
//         SubCategory(
//           name: "Classical Music",
//           subSubCategories: [
//             "Hindustani Classical",
//             "Carnatic Classical",
//             "Western Classical",
//             "Instrumental Classical",
//             "Fusion Classical",
//           ],
//         ),
//         SubCategory(
//           name: "Rock & Metal",
//           subSubCategories: [
//             "Classic Rock",
//             "Hard Rock",
//             "Alternative Rock",
//             "Heavy Metal",
//             "Soft Rock",
//           ],
//         ),
//         SubCategory(
//           name: "Folk & Regional Music",
//           subSubCategories: [
//             "Marathi Folk",
//             "Punjabi Folk",
//             "Rajasthani Folk",
//             "Bengali Folk",
//             "South Indian Folk",
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Education",
//       icon:
//           "https://th.bing.com/th/id/OIP.9zoTVbP9njS9bwR-VjlS6AAAAA?w=187&h=187&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "School And Colleges",
//           subSubCategories: [
//             'Play schools / Pre-schools',
//             'Primary & Secondary schools',
//             'Junior & senior colleges',
//             'Proffesional colleges, ',
//           ],
//         ),
//         SubCategory(
//           name: "Coatching And Tuition",
//           subSubCategories: [
//             'School/ college taition classes',
//             'Competitive exam Coaching ',
//             'Language classes ',
//             'Personality Development & soft skills',
//           ],
//         ),
//         SubCategory(
//           name: "Skill Development",
//           subSubCategories: [
//             'Computer & It Training Institutes',
//             'vocational Training ',
//             'Digital Marketing & Design Cources',
//             'Public speaking & Communication skills',
//           ],
//         ),
//         SubCategory(
//           name: "Proffesstional Training",
//           subSubCategories: [
//             'Corporate & Training',
//             'Finance & Business Cources',
//             'Medical Paramedical Training',
//             'Teacher training Institute',
//           ],
//         ),
//         SubCategory(
//           name: "Online Learning",
//           subSubCategories: [
//             'E-learning platforms',
//             'Recorded viedeo Cources',
//             'Live Online classes',
//             'Certification programs',
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: "Automobile",
//       icon:
//           "https://th.bing.com/th/id/OIP.da-EzbJpc1tL4RfwR4GZQgAAAA?w=198&h=199&dpr=1.3&pid=1.7",
//       subcategories: [
//         SubCategory(
//           name: "Vehicles Sales",
//           subSubCategories: [
//             'New Car showrooms ',
//             'Used Car Dealers',
//             ' Bike & Scooter Showrooms',
//             'Luxury / Premium vehicles Dealers',
//           ],
//         ),
//         SubCategory(
//           name: "Repair And Maintainance",
//           subSubCategories: [
//             'Autorized Services Centres',
//             'Local  Garages & workshops',
//             'Body shop & Denting - Painting',
//             'Engine & transmission Repair',
//           ],
//         ),
//         SubCategory(
//           name: "Car Care And Detiling",
//           subSubCategories: [
//             'Car/Bike wash',
//             'Interior & Exterior Detailing',
//             'Ceramic Coating /PPf',
//             'Polishing & wrapping',
//           ],
//         ),
//         SubCategory(
//           name: "Fule And Charging",
//           subSubCategories: [
//             'Petrol & Dieset fuel stations',
//             'CNG filling stations',
//             'Ev Charging Stations',
//             'Battery Replacement Services',
//           ],
//         ),
//         SubCategory(
//           name: "Insurance And Support",
//           subSubCategories: [
//             'vehicle Insurance Agents',
//             'Roadside Assistance',
//             'Towing Services',
//             'vehicle Finance & Loan Services',
//           ],
//         ),
//       ],
//     ),
//   ];

//   static final List<Color> buttonColors = [
//     Colors.blue,
//     Colors.red,
//     Colors.green,
//     Colors.orange,
//     Colors.purple,
//     Colors.teal,
//     Colors.brown,
//   ];
// }

import 'category_model.dart';

class DataProvider {
  static List<Category> getAllCategories() {
    return [
      Category(
        name: "Construction",
        icon:
            "https://th.bing.com/th/id/OIP.uY0sxrOiQdFkDAOoXkpu3AHaE6?w=258&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Real Estate Services",
            subSubCategories: [
              'Property Dealers/Brokers',
              'Rent/PG?Hostel Listing',
              'Builder & Developers',
              'Architecture',
              'Interior Design',
            ],
          ),
          SubCategory(
            name: "Home Maintainance And Sevices",
            subSubCategories: [
              'Electrician',
              'Plumbers',
              'Carpenters',
              'Painters',
              'Cleaning Services',
            ],
          ),
          SubCategory(
            name: "Building And Construction",
            subSubCategories: [
              'Cement/Sand/Brocks Suppliers',
              'Tiles/Marbel/Granite',
              'Paint & Hardware Stores',
              'Conatruction Contractors',
            ],
          ),
          SubCategory(
            name: "Furniture And Home Decor",
            subSubCategories: [
              'Furniture Shops',
              'Modular Kitchen Dealers',
              'Home Decor & Lighting Shops',
              'Curtains/ Furnishing Stores',
            ],
          ),
          SubCategory(
            name: "Appliance and Utilities",
            subSubCategories: [
              'Home Appliances Dealers',
              'Water Purifiers/RO Dealers',
              'Solar Systems & Inverters'
                  'Security Systems',
            ],
          ),
          SubCategory(
            name: "Strorage And Moving",
            subSubCategories: [
              'Packers & Movers',
              'Warehousing/Strorage',
              'Transport Services For Shifting',
            ],
          ),
        ],
      ),
      Category(
        name: "Art",
        icon:
            "https://th.bing.com/th/id/OIP.Grk_7gKug6OSRbgSnrLkxQHaFj?w=232&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Painers",
            subSubCategories: [
              'Portaits',
              'Abstract',
              'Landscape',
              'Wall Artist',
              'Sculptors',
            ],
          ),
          SubCategory(
            name: "Performing Arts",
            subSubCategories: [
              'Dancers',
              'Musicians /Singers',
              'Theatre Artists',
              'Bands/DJs',
            ],
          ),
          SubCategory(
            name: "Traditionals And Handicrafts",
            subSubCategories: [
              'Pottery /Clay Art',
              'Wood Carving',
              'Handloom & Weaving',
              'Folk Arts',
              'Jwellery / Handicrafts Makers',
            ],
          ),
          SubCategory(
            name: "Art Learning And Training",
            subSubCategories: [
              'Art Schools/Drawing Classes',
              'Dance Academis',
              'Music Classes',
              'Acting/Theaters Workshops',
            ],
          ),
          SubCategory(
            name: "Art Supplies And Stores",
            subSubCategories: [
              'Painting & Crafts Material Shops',
              'Musical  Instrument Shops',
              'Dance Castumes & Accessories',
            ],
          ),
        ],
      ),
      Category(
        name: "Finance",
        icon:
            "https://th.bing.com/th/id/OIP.AcxP7SUCPer1nNjZmRJ5VgHaE8?w=259&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Banks And ATM",
            subSubCategories: [
              'Public Sector Banks ',
              'Private Sector Banks',
              'Private Sector Banks',
              'Regional Rural Banks ',
              'foreign Banks',
              'ATMS & Digital Banking Services',
            ],
          ),
          SubCategory(
            name: "Chartered Accountants",
            subSubCategories: [
              'Tax filling & advisory',
              'Audit & Assurance Services',
              'GST & Compliance Services',
              'Financial Planning & Budgeting',
              'Business Registration & Company setup',
              'Corporate Governance Advisory',
            ],
          ),
          SubCategory(
            name: "Insurance Agents",
            subSubCategories: [
              'Life Insurance Agents',
              'Health Insurance Agents',
              'General Insurance Agents',
              'Corporate Insurance Advisors',
              'Online/Digital Insurance Brokers',
              'Relinsurance Agents',
            ],
          ),
          SubCategory(
            name: "Consultants",
            subSubCategories: [
              'Business Consultants ',
              'Financial Consultants ',
              'Tax Consultants',
              'Risk & Compliance Consultants',
              'Startup Consultants',
              'HR & Payroll Consultants',
            ],
          ),
          SubCategory(
            name: "Lawyers And Legal Advisers",
            subSubCategories: [
              'Corporate Lawyers',
              'Civil Lawyers',
              'Criminal Lawyers',
              'Intellectual Property ',
              'Arbitration & Mediation Expeds',
              'Legal Consultants for Startups & SPAZI SMES',
            ],
          ),
        ],
      ),
      Category(
        name: "IT",
        icon:
            "https://th.bing.com/th/id/OIP.rmAODMYOA14DP30dOZZGsQHaE8?w=260&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Software Development",
            subSubCategories: [
              "Web Development",
              "Mobile App Development",
              "Desktop Applications",
              "Game Development",
              "Software Testing & QA",
            ],
          ),
          SubCategory(
            name: "Cloud & Infrastructure",
            subSubCategories: [
              "Cloud Computing",
              "DevOps & Automation",
              "Network Administration",
              "IT Support & Maintenance",
              "Cybersecurity Infrastructure",
            ],
          ),
          SubCategory(
            name: "Data & Analytics",
            subSubCategories: [
              "Data Science",
              "Artificial Intelligence & Machine Learning",
              "Big Data Engineering",
              "Business Intelligence",
              "Database Management",
            ],
          ),
          SubCategory(
            name: "Emerging Technologies",
            subSubCategories: [
              "Internet of Things",
              "Blockchain Development",
              "Augmented & Virtual Reality",
              "Robotics",
              "Quantum Computing",
            ],
          ),
          SubCategory(
            name: "IT Services & Consulting",
            subSubCategories: [
              "IT Project Management",
              "ERP & CRM Solutions",
              "Digital Transformation Consulting",
              "Technical Support Services",
              "System Integration",
            ],
          ),
        ],
      ),
      Category(
        name: "Travel",
        icon:
            "https://th.bing.com/th/id/OIP.0nMQnWc9RO8-5aZgAEia9gHaE8?w=272&h=181&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Public Transport",
            subSubCategories: [
              'Bus Services',
              'Metro /Local Trains',
              'Taxi/ Cab Services',
              'Auto Rickshaws/ E-Rickshaws',
            ],
          ),
          SubCategory(
            name: "Private Transport And Rentails",
            subSubCategories: [
              'Cars /Bikes Rentals',
              'Chaffeur Services',
              'Self Drive Rentals',
              'Luxury/Premium Vehicle Rentals',
            ],
          ),
          SubCategory(
            name: "Travel Agencies And tour Operators",
            subSubCategories: [
              'Cars /Bikes Rentals',
              'Chaffeur Services',
              'Self Drive Rentals',
              'Luxury/Premium Vehicle Rentals',
            ],
          ),
          SubCategory(
            name: "Logistics And Delivery",
            subSubCategories: [
              'Logistics & Cargo ',
              'Courier & Parcel Delivery ',
              'E-Commerce Deliveries ',
            ],
          ),
          SubCategory(
            name: "Automobile And Support Services",
            subSubCategories: [
              'Vehicle Leasing ',
              'Ev Rentals & charging Stations',
              'Automobile Repair & Maintanance ',
            ],
          ),
        ],
      ),
      Category(
        name: "Healthcare",
        icon:
            "https://th.bing.com/th/id/OIP.rA9mQ9gYhZUkpzhHp7Nh5AHaEL?w=287&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Medical And Services",
            subSubCategories: [
              'Hospital',
              'Clincs',
              ' Diagnostic Labs / Pathology Labs',
              ' Pharmacies / Medical stores',
            ],
          ),
          SubCategory(
            name: "Doctrors And Specialist",
            subSubCategories: [
              'General physicians',
              'Dentists',
              'Eye Specialists ',
              'Gynecologists',
              'pediatricians ',
              'orthopedic/Bone Specialists',
            ],
          ),
          SubCategory(
            name: "Fitness And Lifestyle",
            subSubCategories: [
              'Gyms/fitness centre',
              'Yoga & Meditation centre',
              'zumba / Aerobics classes',
              'Personal Trainers',
            ],
          ),
          SubCategory(
            name: "Wellness And Beauty",
            subSubCategories: [
              'Beauty Parlours /salons',
              'spa & Massage Centres',
              'Skin & Hair clinics',
              'Dieticians/ Nutritionists',
            ],
          ),
          SubCategory(
            name: "Alternative and Preventive Care",
            subSubCategories: [
              'Ayurvedic centres',
              'Homoepathy clinics',
              'Naturopathy',
              'Acupuncture & Acupressure',
            ],
          ),
          SubCategory(
            name: "Emergency And Support Services",
            subSubCategories: [
              'Ambulance Services',
              'Blood Bank',
              'Counselling & Therapy Centres',
              'Health NGO',
            ],
          ),
        ],
      ),
      Category(
        name: "Marketing",
        icon:
            "https://th.bing.com/th/id/OIP.OgkiaLXnCv3Hrz2CcZO6sQHaE8?w=290&h=193&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Digital Marketing Businesses",
            subSubCategories: [
              'Social media marketing agency',
              'SEO services',
              'content marketing agency ',
              'Influencer marketing platform',
              'Emails & 8ms marketing services.',
            ],
          ),
          SubCategory(
            name: "Adversting And Branding Businesses",
            subSubCategories: [
              'outdoor advertising ',
              'Branding & design studio',
              'Print media advertising',
              'Creative ad agency ',
              'Personal branding consulteney',
            ],
          ),
          SubCategory(
            name: "E-Commerce And Product Marketing",
            subSubCategories: [
              'Dropshipping store',
              'Affiliate marketing business',
              'Product review & comparison, website',
              'Market place Seller',
              'Subscription box marketing',
            ],
          ),
          SubCategory(
            name: "Event & Experiential Marketing",
            subSubCategories: [
              'Event management company',
              'Trade shows & exhibition marketing',
              'Product Launch Promotion',
              'college/ Corporate event sponsorship marketing',
              'Street marketing campaigns',
            ],
          ),
          SubCategory(
            name: "Consulting And Specialized Marketing",
            subSubCategories: [
              'Marketing Consultancy for Startups',
              'Political campaign marketing',
              'Real estate marketing agency',
              'Health Care Marketing',
              'Education marketing ',
            ],
          ),
        ],
      ),
      Category(
        name: "Shopping",
        icon:
            "https://th.bing.com/th/id/OIP.aU-vS18jGjZSzpJgoIU3sQHaEt?w=271&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Clothing",
            subSubCategories: [
              'Mens Wear',
              'Womens Wear ',
              'kids wear',
              'Ethnic & Traditional Wear',
              'Designer Boutiques',
            ],
          ),
          SubCategory(
            name: "Footware",
            subSubCategories: [
              'Mens shoes',
              'Womens footwear',
              'Sports & out door footwear',
              'Handmade /custom footwear',
            ],
          ),
          SubCategory(
            name: "Accessories",
            subSubCategories: [
              'Bags & wallests',
              'Belts & sunglasses',
              'Watches & Jwellery',
              'Scarves, Caps & Hats',
            ],
          ),
          SubCategory(
            name: "Cosmetics And Beauty",
            subSubCategories: [
              'Makeup & Skincare products',
              'Perfumes & Deodorants',
              'Organic & Herbal products',
            ],
          ),
          SubCategory(
            name: "Shopping Stores",
            subSubCategories: [
              'Fashion Retail Chains',
              ' Online Shopping stores',
              'Thrift/pre-owned Stores',
              'Local Handloom & Boutique shops',
            ],
          ),
        ],
      ),
      Category(
        name: "Entertainment",
        icon:
            "https://th.bing.com/th/id/OIP.X9hBUqiNvQn8PbVTymFTKQAAAA?w=243&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Movies And Theatre",
            subSubCategories: [
              'Movies & Theatre',
              'Cinemas / Multiplexes',
              'Theatre Groups / Drama Clubs',
              'film production Houses',
              'Short Film & Indie Film Creators',
            ],
          ),
          SubCategory(
            name: "Games And Recreation",
            subSubCategories: [
              'Games Zones/Arcades',
              'Bowling /Pool/Snooker Club',
              'VR/ Gaming Arenas',
              'Indoor/Outdoor Sports Venues',
            ],
          ),
          SubCategory(
            name: "Event Managment",
            subSubCategories: [
              'Event Organisers & Planners',
              'Corporate Event Managment ',
              'Festival & Cultural Event Management',
            ],
          ),
          SubCategory(
            name: "Nightlife And Entertainment venues",
            subSubCategories: [
              'Bars & Pubs',
              'Clubs & Lounges',
              'Live Performance Venues',
              'Cafes & Lounges With Live Music',
            ],
          ),
        ],
      ),
      Category(
        name: "Food",
        icon:
            "https://th.bing.com/th/id/OIP.qbaIsqVVZUgz6pOePsI0QwHaE8?w=257&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Restaurant / Dhaba",
            subSubCategories: ["Builder 1", "Builder 2", "Builder 3"],
          ),
          SubCategory(
            name: "Fast Food",
            subSubCategories: ["Contractor 1", "Contractor 2"],
          ),
          SubCategory(
            name: "Bakery",
            subSubCategories: ["Designer 1", "Designer 2"],
          ),
          SubCategory(
            name: "Healthy & Organic",
            subSubCategories: ["Supplier 1", "Supplier 2"],
          ),
          SubCategory(
            name: "Cafe & Snacks Corner",
            subSubCategories: ["Architect 1", "Architect 2"],
          ),
        ],
      ),
      Category(
        name: "Agriculture",
        icon:
            "https://th.bing.com/th/id/OIP.leUcEChYZIbEsnNYuhNvmAHaE8?w=290&h=193&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Crop Farming",
            subSubCategories: [
              'Food crops ',
              'Cash Crops ',
              'Horticulture ',
              'Organic Forming',
              'Modern Farming ',
            ],
          ),
          SubCategory(
            name: "Agri-Consultancy Services",
            subSubCategories: [
              'Crop Management Advisory',
              'Fertilizer & Pesticide Guidance',
              'Soil Testing & Irrigation Advice',
              'Government schemas & subsidy Help',
              'Organic Certification & Quality checks',
            ],
          ),
          SubCategory(
            name: "Marketing And Distribution Services",
            subSubCategories: [
              'Agri e-commerce Platforms',
              'Farmer Producer Companies ',
              'Cold Storage & warehousing services',
              'Agri- logistics & Supply chain Solutions',
              'wholesale mondis & direct-to-Consumer outlets',
            ],
          ),
          SubCategory(
            name: "Dairy And LiveStacks",
            subSubCategories: [
              'Dairy Farming',
              ' Poultry Farming ',
              'Goat & sheep farming',
              'fish farming ',
              'Beekeeping ',
            ],
          ),
        ],
      ),
      Category(
        name: "Fitness",
        icon:
            "https://th.bing.com/th/id/OIP.xB1KVnZtAcCPSYNNmG4unAHaEK?w=324&h=182&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Fitness Centers And Training",
            subSubCategories: [
              'Gyms & health clubs',
              'Personal training Studios',
              'Crossfit & functional training centers',
              'Yoga & pilates studios',
              'Martial arts & self-defense academies',
            ],
          ),
          SubCategory(
            name: "Fitness Products And Equpments",
            subSubCategories: [
              'Gym equipment Sales & rentals',
              'Home workout equipment ',
              'Sportswear & activewear brands',
              'Fitness accessories',
            ],
          ),
          SubCategory(
            name: "Nutrition & Supplements",
            subSubCategories: [
              'Protein powders & Supplement stores',
              'Healthy meal prep services',
              'Smoothie & juice bars',
              'Diet & nutrition Consultancy',
              'Online supplement Subscription boxes',
            ],
          ),
          SubCategory(
            name: "Digital And Online Fitness",
            subSubCategories: [
              'Fitness apps ',
              'Online Coaching & training programs',
              'Virtual classes',
              'fitness blogs & content platforms',
              'fitness gadgets & wearables ',
            ],
          ),
          SubCategory(
            name: "Wellness & Lifestyle",
            subSubCategories: [
              'spa & recovery Centers',
              'physiotherapy & sports rehab clinics',
              'corporate wellness programs',
              'mental health & mindfulness programs',
              'fitness retreats & bootcamps',
            ],
          ),
        ],
      ),
      // Category(
      //   name: "Music",
      //   icon:
      //       "https://th.bing.com/th/id/OIP.760UqadIMMqBTWliinKMnwHaHa?w=188&h=188&dpr=1.3&pid=1.7",
      //   subcategories: [
      //     SubCategory(
      //       name: "Pop Music",
      //       subSubCategories: [
      //         "Synth Pop",
      //         "Dance Pop",
      //         "Indie Pop",
      //         "K-Pop ",
      //         "Electro Pop",
      //       ],
      //     ),
      //     SubCategory(
      //       name: "Hip-Hop / Rap",
      //       subSubCategories: [
      //         "Old School Hip-Hop",
      //         "Trap",
      //         "Desi Hip-Hop",
      //         "Lo-Fi Rap",
      //         "Conscious Rap",
      //       ],
      //     ),
      //     SubCategory(
      //       name: "Classical Music",
      //       subSubCategories: [
      //         "Hindustani Classical",
      //         "Carnatic Classical",
      //         "Western Classical",
      //         "Instrumental Classical",
      //         "Fusion Classical",
      //       ],
      //     ),
      //     SubCategory(
      //       name: "Rock & Metal",
      //       subSubCategories: [
      //         "Classic Rock",
      //         "Hard Rock",
      //         "Alternative Rock",
      //         "Heavy Metal",
      //         "Soft Rock",
      //       ],
      //     ),
      //     SubCategory(
      //       name: "Folk & Regional Music",
      //       subSubCategories: [
      //         "Marathi Folk",
      //         "Punjabi Folk",
      //         "Rajasthani Folk",
      //         "Bengali Folk",
      //         "South Indian Folk",
      //       ],
      //     ),
      //   ],
      // ),
      Category(
        name: "Education",
        icon:
            "https://th.bing.com/th/id/OIP.0vLfnWNdloIFmCX9rpUuCQHaE8?w=272&h=181&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "School And Colleges",
            subSubCategories: [
              'Play schools / Pre-schools',
              'Primary & Secondary schools',
              'Junior & senior colleges',
              'Proffesional colleges, ',
            ],
          ),
          SubCategory(
            name: "Coatching And Tuition",
            subSubCategories: [
              'School/ college taition classes',
              'Competitive exam Coaching ',
              'Language classes ',
              'Personality Development & soft skills',
            ],
          ),
          SubCategory(
            name: "Skill Development",
            subSubCategories: [
              'Computer & It Training Institutes',
              'vocational Training ',
              'Digital Marketing & Design Cources',
              'Public speaking & Communication skills',
            ],
          ),
          SubCategory(
            name: "Proffesstional Training",
            subSubCategories: [
              'Corporate & Training',
              'Finance & Business Cources',
              'Medical Paramedical Training',
              'Teacher training Institute',
            ],
          ),
          SubCategory(
            name: "Online Learning",
            subSubCategories: [
              'E-learning platforms',
              'Recorded viedeo Cources',
              'Live Online classes',
              'Certification programs',
            ],
          ),
        ],
      ),
      Category(
        name: "Automobile",
        icon:
            "https://th.bing.com/th/id/OIP.XvScO1EgPiwghgX3Umh-CwHaE6?w=241&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        subcategories: [
          SubCategory(
            name: "Vehicles Sales",
            subSubCategories: [
              'New Car showrooms ',
              'Used Car Dealers',
              ' Bike & Scooter Showrooms',
              'Luxury / Premium vehicles Dealers',
            ],
          ),
          SubCategory(
            name: "Repair And Maintainance",
            subSubCategories: [
              'Autorized Services Centres',
              'Local  Garages & workshops',
              'Body shop & Denting - Painting',
              'Engine & transmission Repair',
            ],
          ),
          SubCategory(
            name: "Car Care And Detiling",
            subSubCategories: [
              'Car/Bike wash',
              'Interior & Exterior Detailing',
              'Ceramic Coating /PPf',
              'Polishing & wrapping',
            ],
          ),
          SubCategory(
            name: "Fule And Charging",
            subSubCategories: [
              'Petrol & Dieset fuel stations',
              'CNG filling stations',
              'Ev Charging Stations',
              'Battery Replacement Services',
            ],
          ),
          SubCategory(
            name: "Insurance And Support",
            subSubCategories: [
              'vehicle Insurance Agents',
              'Roadside Assistance',
              'Towing Services',
              'vehicle Finance & Loan Services',
            ],
          ),
        ],
      ),
    ];
  }
}
