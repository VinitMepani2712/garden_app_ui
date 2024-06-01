import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/cart_model.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _incrementQuantity(CartItem item) {
    setState(() {
      item.quantity++;
    });
  }

  void _decrementQuantity(CartItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity--;
      }
    });
  }

  void _removeItem(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text('Your cart is empty'),
            )
          : ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return _buildCartItem(cartItem);
              },
            ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Checkout'),
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem cartItem) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6.h,
              width: MediaQuery.of(context).size.width / 3.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  cartItem.plant.imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.plant.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.h),
                  Text('\u{20B9}${cartItem.plant.price}'),
                  SizedBox(height: 5.h),
                  _buildQuantityControl(cartItem),
                  SizedBox(height: 5.h),
                  ElevatedButton(
                    onPressed: () => _removeItem(cartItem),
                    child: Text('Remove'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControl(CartItem cartItem) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF0F4EF),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffB5C9AD),
            child: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => _decrementQuantity(cartItem),
            ),
          ),
          SizedBox(width: 5.w),
          Text(cartItem.quantity.toString()),
          SizedBox(width: 5.w),
          CircleAvatar(
            backgroundColor: Color(0xffB5C9AD),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () => _incrementQuantity(cartItem),
            ),
          ),
        ],
      ),
    );
  }
}
