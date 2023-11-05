import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:kart_demo/A/colors.dart';
import 'package:kart_demo/firstPage.dart';
import 'package:kart_demo/modelClass.dart';

import 'categoryModel.dart';
import 'contants1.dart';
import 'main.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {


  var dropdownvalue;
  List <CategoryModel> category=[];




  getProduct(){
    return FirebaseFirestore.instance.collection(Constants.product)
        .where("delete",isEqualTo: false)
        .where("category",isEqualTo: dropdownvalue)
        .orderBy("date",descending: true)
        .snapshots().map((event) => event.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }

  getFullProduct(){
    return FirebaseFirestore.instance.collection(Constants.product)
        .where("delete",isEqualTo: false)
        .orderBy("date",descending: true)
        .snapshots().map((event) => event.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }


  getCategory() async {
    QuerySnapshot snapshot=await FirebaseFirestore.instance.collection(Constants.category)
        .where("delete",isEqualTo: false).get();
    if(snapshot.docs.isNotEmpty){
      category.clear();
      for(DocumentSnapshot doc in snapshot.docs){
        category.add((CategoryModel.fromjson(doc.data())));
      }
    }
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getCategory();
    super.initState();
  }




  var sort=[
    "Categories","Brands","Colours","Sizes","Price and Deals"
  ];


  List<Map> sportsshoes=[
    {
      "image":Image.asset("images/nike1.png"),
      "backgroundcolor":Colors.orange.shade50,
      "backgroundcolor1":Colors.orange.shade100,
      "backgroundcolor2":Colors.orange.shade200,
      "backgroundcolor3":Colors.orange.shade300,


    },
    {
      "image":Image.asset("images/img_shoes.png"),
      "backgroundcolor":Colors.red.shade50,
      "backgroundcolor1":Colors.red.shade100,
      "backgroundcolor2":Colors.red.shade200,
      "backgroundcolor3":Colors.red.shade300,
    },
    {
      "image":Image.asset("images/shoes_1.png"),
      "backgroundcolor":Colors.blue.shade50,
      "backgroundcolor1":Colors.blue.shade100,
      "backgroundcolor2":Colors.blue.shade200,
      "backgroundcolor3":Colors.blue.shade300,
    },
    {
      "image":Image.asset("images/shoes_2.png"),
      "backgroundcolor":Colors.green.shade50,
      "backgroundcolor1":Colors.green.shade100,
      "backgroundcolor2":Colors.green.shade200,
      "backgroundcolor3":Colors.green.shade300,
    },
    {
      "image":Image.asset("images/shoes_3.png"),
      "backgroundcolor":Colors.purple.shade50,
      "backgroundcolor1":Colors.purple.shade100,
      "backgroundcolor2":Colors.purple.shade200,
      "backgroundcolor3":Colors.purple.shade300,
    },
    {
      "image":Image.asset("images/shoes_4.png"),
      "backgroundcolor":Colors.yellow.shade50,
      "backgroundcolor1":Colors.yellow.shade100,
      "backgroundcolor2":Colors.yellow.shade200,
      "backgroundcolor3":Colors.yellow.shade300,
    },
    {
      "image":Image.asset("images/img_shoes.png"),
      "backgroundcolor":Colors.red.shade50,
      "backgroundcolor1":Colors.red.shade100,
      "backgroundcolor2":Colors.red.shade200,
      "backgroundcolor3":Colors.red.shade300,
    },
    {
      "image":Image.asset("images/shoes_1.png"),
      "backgroundcolor":Colors.blue.shade50,
      "backgroundcolor1":Colors.blue.shade100,
      "backgroundcolor2":Colors.blue.shade200,
      "backgroundcolor3":Colors.blue.shade300,
    },
    {
      "image":Image.asset("images/shoes_2.png"),
      "backgroundcolor":Colors.green.shade50,
      "backgroundcolor1":Colors.green.shade100,
      "backgroundcolor2":Colors.green.shade200,
      "backgroundcolor3":Colors.green.shade300,
    },
  ];

  int selected=0;



  bool fav=true;
  bool borde=true;
  double rating=0;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          leading: Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: colors.secondarycolor,
              radius: w*0.03,
              child: Icon(Icons.widgets,color: colors.primarycolor,),
            ),
          ),

          actions: [
            Container(
                height: h*0.1,
                width: w*0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                   ),
                child: Icon(Icons.shopping_bag,color: colors.primarycolor,)
                ),

            SizedBox(width: w*0.03,),
            Container(
              height: h*0.1,
              width: w*0.1,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  image: DecorationImage(image: AssetImage("images/profile.jpeg"))
              ),
            ),




          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 5,right: 5,top: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h*0.07,
                    width: w*0.75,
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // enabledBorder:InputBorder.none,
                          suffixIcon: Icon(Icons.search,color: Colors.grey,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.02),
                              borderSide: BorderSide.none
                          ),
                          hintText: "Sports shoes"
                      ),



                    ),
                  ),
                  Container(
                    height: h*0.07,
                    width: w*0.14,
                    decoration: BoxDecoration(
                        color: colors.primarycolor,
                        borderRadius: BorderRadius.circular(w*0.02)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: w*0.02,
                              width: w*0.02,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),
                            SizedBox(width: w*0.008,),
                            Container(
                              height: w*0.013,
                              width: w*0.04,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: w*0.013,
                              width: w*0.04,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),
                            SizedBox(width: w*0.008,),
                            Container(
                              height: w*0.02,
                              width: w*0.02,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: w*0.04,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dropdownvalue ?? "All" ,style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: w*0.05
                  ),),
                  Container(
                    height: w*0.07,
                    width: w*0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:DropdownButton(
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text("select Category"),
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      value: dropdownvalue,
                      items: category.map((e) =>
                          DropdownMenuItem(
                              value: e.name,
                              child: Text(e.name,style: TextStyle(
                                  color: Colors.black,
                                  fontSize: w*0.04,
                                  fontWeight: FontWeight.w500
                              ),))
                      ).toList() ,
                      onChanged: (newValue) {
                        setState(() {
                          print(newValue);
                          print("newValue");
                          dropdownvalue=newValue!;
                        });
                      },),
                      

                  )
                ],
              ),
              SizedBox(height: w*0.02,),
              Expanded(
                child: StreamBuilder<List<ProductModel>>(
                  stream: dropdownvalue!=null ? getProduct() : getFullProduct(),
                    builder: (context, snapshot) {
                  if(!snapshot.hasData)
                  {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  List<ProductModel> productList=snapshot.data!;
                  print(productList.length);
                  return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {

                          });
                        },
                        child: Container(
                          height: h*2,

                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left:35,
                                child: Container(
                                    height: h*0.5,
                                    width: w*0.6,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: CircleAvatar(
                                              radius: 55,
                                              backgroundColor:sportsshoes[index]['backgroundcolor']
                                          ),
                                        ),
                                        Positioned(
                                          left: 9,
                                          top:9,
                                          child: CircleAvatar(
                                              radius: 45,
                                              backgroundColor: sportsshoes[index]['backgroundcolor1']
                                          ),
                                        ),
                                        Positioned(
                                          top: 20,
                                          left: 19,

                                          child: CircleAvatar(

                                              radius: 35,
                                              backgroundColor: sportsshoes[index]['backgroundcolor2']
                                          ),
                                        ),
                                        Positioned(
                                          left:30,
                                          top:30,
                                          child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor:sportsshoes[index]['backgroundcolor3']
                                          ),
                                        ),
                                        CircleAvatar(
                                            radius: 55,
                                            backgroundColor: Colors.transparent,

                                            child:Image.network(productList[index].image)
                                        ),
                                      ],
                                    )
                                ),
                              ),

                              Positioned(
                                  right: 10,
                                  child: InkWell(
                                      onTap: () {
                                        fav=!fav;
                                        setState(() {

                                        });
                                      },
                                      child:fav? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: colors.greycolor,))),
                              Positioned(
                                bottom: 10,
                                right: 15,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: colors.primarycolor,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                child: Container(
                                    height: h*0.06,
                                    width: w*0.25,
                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(productList[index].prdctName,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                        Row(
                                          children: [
                                            Text("\$",style: TextStyle(fontSize: 10),),
                                            Text(productList[index].amount.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                child: Container(
                                  height: h*0.03,
                                  width: w*0.22,
                                  child:
                                  PannableRatingBar(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment: WrapCrossAlignment.start ,

                                    rate: rating,
                                    items: List.generate(5, (index) =>
                                    const RatingWidget(
                                      selectedColor: Colors.yellow,
                                      unSelectedColor: Colors.grey,
                                      child: Icon(
                                        Icons.star,
                                        size: 13,
                                      ),
                                    )),
                                    onChanged: (value) { // the rating value is updated on tap or drag.
                                      setState(() {
                                        rating = value;
                                      });
                                    },
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      );
                    },);

                },



                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

