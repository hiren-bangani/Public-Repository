import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'string_collection.dart';
import 'list_data.dart';
import 'tab_executing.dart';

class OrderListItem extends StatefulWidget {
  String orderId;
  String batchedBy;
  String batchedOn;

  OrderListItem(Map order) {
    this.orderId = order['orderId'];
    this.batchedBy = order['batchedBy'];
    this.batchedOn = order['batchedOn'];
  }
  OrderListItemState createState() => new OrderListItemState();
}

class OrderListItemState extends State<OrderListItem> {
  Size size;
  bool bShowList = false;
  Icon iconToggle = Icon(Icons.keyboard_arrow_up);

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width - size.width * 0.03,
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                height: size.height * 0.1 - 10,
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.65,
                      height: size.height * 0.06,
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            Radio<int>(
                              activeColor: Colors.black,
                              value: 1,
                              onChanged: ((int value) {}),
                              groupValue: 1,
                            ),
                            SizedBox(width: 5),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(widget.orderId),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.01,
                      height: size.height * 0.065,
                      color: Colors.white,
                    ),
                    InkWell(
                      onTap: null,
                      child: Container(
                        width: size.width * 0.29,
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width: 5),
                              Container(
                                  width: size.width * 0.12,
                                  child: Image(
                                      image: AssetImage('excel-icon.png'))),
                              Container(
                                width: size.width * 0.15,
                                child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.file_download,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                indent: size.width * 0.03,
                endIndent: size.width * 0.03,
                height: size.width * 0.03,
              ),
              Container(
                color: Colors.grey,
                height: size.height * 0.1 - 10,
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          StringCollection.batched_by,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.01,
                      height: size.height * 0.065,
                      color: Colors.white,
                    ),
                    Container(
                      width: size.width * 0.15,
                      height: 40,
                      child: Image(
                        image: AssetImage('profile-icon.png'),
                      ),
                    ),
                    Container(
                      width: size.width * 0.45,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: size.height * 0.04,
                            child: Text(
                              widget.batchedBy,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: size.height * 0.04,
                            child: Text(widget.batchedOn),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.01,
                      height: size.height * 0.065,
                      color: Colors.white,
                    ),
                    Container(
                      width: size.width * 0.15,
                      child: IconButton(
                        icon: iconToggle,
                        onPressed: () {
                          setState(() {
                            bShowList = !bShowList;
                            if (bShowList)
                              iconToggle = Icon(Icons.keyboard_arrow_down);
                            else
                              iconToggle = Icon(Icons.keyboard_arrow_up);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.005),
        Visibility(
          visible: bShowList,
          child: getOrderDetailList(),
        ),
        SizedBox(height: size.height * 0.005),
      ],
    );
  }

  Widget getOrderDetailList() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: size.width - size.width * 0.03,
          height: size.height * 0.05,
          color: Colors.black87,
          child: Row(
            children: [
              Container(
                width: size.width * 0.2,
                alignment: Alignment.center,
                child: Text(
                  StringCollection.product_image,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: size.width * 0.01,
                color: Colors.white,
              ),
              Container(
                width: size.width * 0.6,
                alignment: Alignment.center,
                child: Text(
                  StringCollection.product_desc,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                width: size.width * 0.01,
                color: Colors.white,
              ),
              Container(
                width: size.width * 0.15,
                alignment: Alignment.center,
                child: Text(
                  StringCollection.product_quantity,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        new ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ListData.orderDetails.length,
            itemBuilder: (BuildContext ctxt, int index) {
              if (ListData.orderDetails[index]['orderId'] == widget.orderId) {
                return OrderDetailsListItem(ListData.orderDetails[index]);
              } else {
                return Container();
              }
            }),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}

class OrderDetailsListItem extends StatelessWidget {
  String orderId;
  String productDescription;
  String productCategory;
  String productQuantity;
  String productImageURL;

  OrderDetailsListItem(Map<String, String> orderDetails) {
    this.orderId = orderDetails['orderId'];
    this.productCategory = orderDetails['productCategory'];
    this.productDescription = orderDetails['productDescription'];
    this.productImageURL = orderDetails['productImageURL'];
    this.productQuantity = orderDetails['productQuantity'];
  }

  Size size;
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.005,
        ),
        Container(
          width: size.width - size.width * 0.03,
          height: size.height * 0.15,
          color: Colors.black12,
          child: Row(
            children: [
              Container(
                //Product Image
                width: size.width * 0.2,
                height: size.height * 0.15,
                padding: EdgeInsets.all(5),
                child: Image(
                  image: AssetImage(productImageURL),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                width: size.width * 0.01,
                color: Colors.white,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width * 0.6,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
                      child: Text(productDescription),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
                      child: Text(StringCollection.product_category,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(productCategory),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.01,
                color: Colors.white,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: size.width * 0.15,
                    height: size.height * 0.075,
                    child: Text(
                      productQuantity,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: size.width * 0.15,
                    height: size.height * 0.005,
                    color: Colors.white,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: size.width * 0.15,
                    height: size.height * 0.07,
                    child: IconButton(
                      icon: Icon(
                        Icons.launch,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return OrderDetailsDialog(
                                  orderId,
                                  productDescription,
                                  productQuantity,
                                  productImageURL,
                                  productCategory);
                            });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OrderDetailsDialog extends StatefulWidget {
  String orderId;
  String productDescription;
  String productQuantity;
  String productImageURL;
  String productCategory;

  OrderDetailsDialog(String orderId, String productDescription,
      String productQuantity, String productImageURL, String productCategory) {
    this.orderId = orderId;
    this.productDescription = productDescription;
    this.productQuantity = productQuantity;
    this.productImageURL = productImageURL;
    this.productCategory = productCategory;
  }

  @override
  OrderDetailsDialogState createState() => OrderDetailsDialogState();
}

class OrderDetailsDialogState extends State<OrderDetailsDialog> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          width: size.width * 0.8,
          height: size.height * 0.6,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 1), blurRadius: 10),
              ]),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.05,
                    width: size.width * 0.25,
                    child: Text(
                      StringCollection.order_id + ":",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: size.height * 0.05,
                    width: size.width * 0.5,
                    child: Text(
                      widget.orderId,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * 0.4,
                height: size.height * 0.25,
                child: Image(
                  image: AssetImage(widget.productImageURL),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.05,
                    width: size.width * 0.25,
                    child: Text(
                      StringCollection.product_desc + ":",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: size.height * 0.05,
                    width: size.width * 0.5,
                    child: Text(
                      widget.productDescription,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.05,
                    width: size.width * 0.25,
                    child: Text(
                      StringCollection.product_category + ":",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: size.height * 0.05,
                    width: size.width * 0.5,
                    child: Text(
                      widget.productCategory,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.05,
                    width: size.width * 0.25,
                    child: Text(
                      StringCollection.product_quantity + ":",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: size.height * 0.05,
                    width: size.width * 0.5,
                    child: Text(
                      widget.productQuantity,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    StringCollection.closeButton,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
