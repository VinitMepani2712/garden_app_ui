import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../provider/cart_screen_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return cartProvider.items.isEmpty
              ? Center(
                  child: Text('Your cart is empty'),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: cartProvider.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartProvider.items[index];
                    return _buildCartItem(cartItem, context);
                  },
                );
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Price: \u{20B9}${cartProvider.totalPrice.toStringAsFixed(2)}',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCartItem(CartItem cartItem, BuildContext context) {
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
                  _buildQuantityControl(cartItem, context),
                  SizedBox(height: 5.h),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          side: BorderSide(color: Colors.red),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xffF0F4EF),
                      ),
                    ),
                    onPressed: () =>
                        Provider.of<CartProvider>(context, listen: false)
                            .removeItem(cartItem),
                    child: Text(
                      'Remove',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControl(CartItem cartItem, BuildContext context) {
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
              onPressed: () => Provider.of<CartProvider>(context, listen: false)
                  .decrementQuantity(cartItem),
            ),
          ),
          SizedBox(width: 5.w),
          Text(cartItem.quantity.toString()),
          SizedBox(width: 5.w),
          CircleAvatar(
            backgroundColor: Color(0xffB5C9AD),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () => Provider.of<CartProvider>(context, listen: false)
                  .incrementQuantity(cartItem),
            ),
          ),
        ],
      ),
    );
  }
}
