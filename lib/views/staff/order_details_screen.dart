import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final dynamic order; // The order passed from the StaffHomeScreen

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderDetailCard('Order ID', order.orderId, Colors.blue),
              SizedBox(height: 10),
              _buildOrderDetailCard(
                  'Order Status', order.orderStatus ?? 'Pending', Colors.green),
              SizedBox(height: 10),
              _buildOrderDetailCard('Payment Method',
                  order.paymentMethod ?? 'N/A', Colors.orange),
              SizedBox(height: 10),
              _buildOrderDetailCard(
                'Items',
                order.items?.map((item) => item.productName).join(', ') ??
                    'No items',
                Colors.purple,
              ),
              SizedBox(height: 10),
              _buildOrderDetailCard('Total Price',
                  '\$${order.orderTotalPrice ?? '0'}', Colors.teal),
              SizedBox(height: 20),
              _buildSectionTitle('Shipping Address'),
              _buildDetailText(order.shippingAddress ?? 'N/A'),
              SizedBox(height: 10),
              _buildSectionTitle('Payment Status'),
              _buildDetailText(order.paymentStatus ?? 'N/A'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetailCard(String title, String value, Color color) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
            Flexible(
              child: Text(
                value,
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildDetailText(String text) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }
}
