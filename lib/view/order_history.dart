import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  Widget gradientIcon({
    required IconData icon,
    required List<Color> gradientColors,
    double size = 28,
  }) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        size: size,
        color: Colors.white, // important: keeps icon transparent for gradient
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        'id': '#ORD12345',
        'name': 'Sanika Collection',
        'date': 'Oct 5, 2025',
        'status': 'Done',
      },
      {
        'id': '#ORD12345',
        'name': 'Sanika Collection',
        'date': 'Oct 5, 2025',
        'status': 'Shipped',
      },
      {
        'id': '#ORD12345',
        'name': 'Sanika Collection',
        'date': 'Oct 5, 2025',
        'status': 'Cancelled',
      },
      {
        'id': '#ORD12345',
        'name': 'Sanika Collection',
        'date': 'Oct 5, 2025',
        'status': 'Delivered',
      },
    ];

    Color getStatusColor(String status) {
      switch (status) {
        case 'Delivered':
          return Colors.green;
        case 'Shipped':
          return Colors.orange;
        case 'Cancelled':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // make sure text is visible
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF6A11CB), // Purple
                Color(0xFF2575FC), // Blue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.white, // important for gradient to show
        elevation: 0,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8FBFF), Color(0xFFEFF6FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFFFFF), Color(0xFFF5F9FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.teal.shade50,
                  child: gradientIcon(
                    icon: Icons.shopping_bag,
                    gradientColors: [
                      Color(0xFF6A11CB), // purple
                      Color(0xFF2575FC), // blue
                    ],
                    size: 28,
                  ),
                ),

                title: Text(
                  order['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date: ${order['date']}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Order ID: ${order['id']}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(order['status']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: getStatusColor(order['status']).withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    order['status'],
                    style: TextStyle(
                      color: getStatusColor(order['status']),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsPage(order: order),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class OrderDetailsPage extends StatelessWidget {
  final Map<String, dynamic> order;
  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order ID: ${order['id']}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text("Product: ${order['name']}"),
            Text("Date: ${order['date']}"),

            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  order['status'],
                  style: TextStyle(
                    color: order['status'] == 'Delivered'
                        ? Colors.green
                        : order['status'] == 'Shipped'
                        ? Colors.orange
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Reorder or contact support action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Reorder coming soon!")),
                  );
                },
                icon: const Icon(Icons.replay),
                label: const Text("Reorder"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
