import 'package:aman_food_delivery/data/data.dart';
import 'package:flutter/material.dart';
import 'package:aman_food_delivery/models/order.dart';
class CartScreeen extends StatefulWidget {
  @override
  _CartScreeenState createState() => _CartScreeenState();
}

class _CartScreeenState extends State<CartScreeen> {


  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20.0, ),
      height: 170.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12.0),
                  width: 150.0,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(order.food.imageUrl,
                  ),
                  ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(order.food.name,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,),

                        SizedBox(height: 10.0,),
                        Text(order.restaurant.name,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 10.0,),
                        Container(

                          width: 100.0,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 0.8,color: Colors.black54),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                            Text('-',style: TextStyle(color:Theme.of(context).primaryColor,fontSize: 20.0,fontWeight: FontWeight.w600)),
                            Text(order.quantity.toString(),style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
                            Text('+',style: TextStyle(color:Theme.of(context).primaryColor,fontSize: 20.0,fontWeight: FontWeight.w600)),
                          ],),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Text('\$${order.quantity *order.food.price}',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double totalprice =0;
    currentUser.cart.forEach((Order order)=>totalprice +=order.food.price);
    return Scaffold(
      appBar: AppBar(title: Text('Cart (${currentUser.cart.length})'),

      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length +1,
          itemBuilder: (BuildContext context,int index) {
          if(index < currentUser.cart.length) {
            Order order = currentUser.cart[index];

            return _buildCartItem(order);
          }
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('Estimated Delivery time' ,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
                  Text('25 min',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
                ],),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total price' ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),),
                    Text('\$${totalprice.toStringAsFixed(2)}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600,color: Colors.green[700],),),
                  ],),
                SizedBox(height: 70.0,),
              ],
            ),
          );
      },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1.0,
              color: Colors.grey,
            );
          },
      ),
      bottomSheet: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [BoxShadow(
            color: Colors.black54,
            offset: Offset(0,-1),
            blurRadius: 6.0
          ),
          ]
        ),
        child: Center(
          child: FlatButton(onPressed: (){},
              child: Text('Check out',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w600,letterSpacing: 2.0),),
          ),
        ),


      ),
    );
  }
}


