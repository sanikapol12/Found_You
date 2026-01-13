import 'package:flutter/material.dart';
import 'package:flutter_project/view/the_subscription_page.dart';

class SubscriptionPage extends StatelessWidget {
  final String planName;

  const SubscriptionPage({super.key, required this.planName});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> planDetails = {
      "Basic": {
        "price": "Free",
        "features": [
          "Limited visibility",
          "Basic business profile",
          "Standard support",
        ],
        "gradient": [Colors.grey, Colors.blueGrey],
      },
      "Pro": {
        "price": "₹299 / month",
        "features": [
          "Increased visibility",
          "Priority listing",
          "Access to analytics",
          "Email support",
        ],
        "gradient": [Colors.purple, Colors.pinkAccent],
      },
      "Premium": {
        "price": "₹599 / month",
        "features": [
          "Top placement in category",
          "Featured badge",
          "Advanced analytics",
          "24x7 support",
        ],
        "gradient": [Colors.orange, Colors.redAccent],
      },
    };

    final details = planDetails[planName]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$planName Plan",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: List<Color>.from(details["gradient"]),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      planName,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      details["price"],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    ...List.generate(
                      (details["features"] as List).length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                details["features"][index],
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("$planName Plan Activated ✅")),
                        );

                        // Navigate to Subscription Page
                        // Navigator.pop(context); // close dialog
                        Navigator.pop(context); // close SubscriptionPage
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Activate Now",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TheSubscriptionPage(),
                          ),
                        );
                      },
                      child: Text("continue with the subscription app"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
