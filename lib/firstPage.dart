
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kart_demo/A/colors.dart';
import 'package:kart_demo/A/images.dart';
import 'package:kart_demo/test.dart';
import 'package:pinput/pinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import 'contants1.dart';
import 'main.dart';
import 'modelClass.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

int v=0;
int count=4;
int selecteditems=0;
bool view=true;


getProduct(){
  return FirebaseFirestore.instance.collection(Constants.product)
      .where("delete",isEqualTo: false)
      .orderBy("date",descending: true)
      .snapshots().map((event) => event.docs.map((e) => ProductModel.fromJson(e.data())).toList());
}








List ad=[];


List<Map> categories=[
  {
    "icon": Icon(Icons.widgets,color: colors.primarycolor,),
    "Text":"All"
},
  {
    "icon": Image.asset(images.footwears),
    "Text":"Footwear"
},
  {
    "icon": Image.asset(images.watch),
    "Text":"Watch"
  },
  {
    "icon": Image.asset(images.clothings),
    "Text":"clothings"
  }
];


List<Map> popular=[
  {
    "image":  Image.asset("images/nike1.png",),
    "Text": "Shoes",
    "price": "\$ 100.00",
    "color": Colors.deepOrange.shade300,
  },
  {
    "image":  Image.asset("images/chair.png"),
    "Text": "Shoes",
    "price": "\$ 100.00",
    "color":Colors.blue.shade200,
  },
  {
    "image":   Image.asset("images/watchnew.png"),
    "Text": "Shoes",
    "price": "\$ 100.00",
    "color":Colors.green.shade200,
  },
  {
    "image":  Image.asset("images/walletnew.png"),
    "Text": "Shoes",
    "price": "\$ 100.00",
    "color":Colors.red.shade200,
  },
  {
    "image":  Image.asset("images/nike1.png",),
    "Text": "Shoes",
    "price": "\$ 100.00",
    "color": Colors.deepOrange.shade300,
  },
  {
    "image":  Image.asset("images/chair.png"),
    "Text": "Shoes",
    "price": "\$ 100.00",
    "color":Colors.blue.shade200,
  },
  {
    "image":   Image.asset("images/watchnew.png"),
    "Text": "Shoes",
    "price": "\$ 100.00",
    "color":Colors.green.shade200,
  },
  {
    "image":  Image.asset("images/walletnew.png"),
    "Text": "Shoes",
    "price": "\$ 100.00",
    "color":Colors.red.shade200,
  },
];




class _firstPageState extends State<firstPage> {
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

          title: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TestPage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 95),
              child: Text("Home",style: TextStyle(
                 color: colors.blackcolor,fontWeight: FontWeight.bold
              ),),
            ),
          ),
          actions: [
         actionButton(Icon(Icons.shopping_bag,color: colors.primarycolor,),),
          SizedBox(width: w*0.03,),
         Padding(
           padding: EdgeInsets.only(right: 10),
           child: Container(
             height: h*0.1,
             width: w*0.1,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: Colors.grey.shade300,
               image: DecorationImage(image: AssetImage("images/profile.jpeg"))
             ),
           ),
         ),




          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10,right: 10,top: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
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
                            hintText: "Search.."
                          ),



                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 3),
                      child: Container(
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
                      ),
                    )
                  ],
                ),
                SizedBox(height: w*0.03,),
                Container(
                  height: w*0.51,
                  width: w*1,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('banner').snapshots(),
                    builder: (context, snapshot) {
                      var data=snapshot.data!.docs;
                      ad=data;
                      return CarouselSlider.builder(
                        itemCount: data.length,
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction:1,
                          autoPlayAnimationDuration: Duration(seconds: 1 ),
                          scrollPhysics: BouncingScrollPhysics(),
                          onPageChanged: (index, reason) {
                            v=index;
                            setState(() {

                            });
                            print(v);
                          },
                        ),
                        itemBuilder: (context, index, realIndex) {
                          // v=index;
                          // print(v);
                          return Container(
                            height: w*0.6,
                            width: w*1,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(w*0.05),
                                image: DecorationImage(image:NetworkImage(data[index]['image']),fit: BoxFit.fill)
                            ),


                            //  margin: EdgeInsets.only(right: w*0.02),
                          );

                        },

                      );
                    },
                  ),
    ),

                SizedBox(height: w*0.03,),
                AnimatedSmoothIndicator(
                  activeIndex: v,
                  count: ad.length,
                  effect: ExpandingDotsEffect(activeDotColor: Colors.black,dotHeight: w*(0.00255*6)),

                ),
                Container(
                  height: w*0.17,
                  width: w*1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selecteditems=index;
                        },
                        child: Container(
                          height: 10,
                          margin: EdgeInsets.only(right: w*0.05,top: 9,bottom: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              categories[index]["icon"],
                              Text(categories[index]['Text'],style: TextStyle(
                                color: selecteditems==index?colors.primarycolor:colors.blackcolor),),
                            ],
                          ),
                        ),
                      );
                    },),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: w*0.05
                    ),),
                    InkWell(
                      onTap: () {
                        setState(() {

                        });
                      },
                      child: Text("View all",style: TextStyle(
                        color: Colors.grey.shade500
                      ),),
                    )
                  ],
                ),
                StreamBuilder<List<ProductModel>>(
                  stream: getProduct(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData)
                    {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    List<ProductModel> productList=snapshot.data!;
                    print(productList.length);
                    return MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemCount: productList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return
                            Container(
                              height: (index % 4==0||index % 4==3)?175 : 200,

                              decoration: BoxDecoration(
                                  color:popular[index]["color"],
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              padding: EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: w*0.3,
                                    width: w*0.4,
                                    decoration:
                                    BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(productList[index].image)),
                                    )


                                  ),
                                  Text(productList[index].prdctName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                  Text(productList[index].amount.toStringAsFixed(2),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)



                                ],
                              ),
                            );

                      },
                    );
                  },
                )],




            ),
          ),
        ),
      ),
    );
  }
  Widget actionButton(Widget child){
    return CircleAvatar(
      radius: w*0.04,
      backgroundColor: Colors.grey.shade300,
      child: child,
    );
  }
}

