
import 'package:flutter/rendering.dart';
import 'package:flutter_assessment/screens/home_screen/home_screen_shimmer.dart';
import 'package:flutter_assessment/screens/home_screen/widgets/reusable_text_widget.dart';

import '../../../providers/user_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getTransactions();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        // User is scrolling up
        setState(() {
        });
      } else {
        // User is scrolling down or at the top
        setState(() {
        });
      }
    });
    super.initState();
  }
  getTransactions()async{
    await Provider.of<ApiDataProvider>(context,listen:false).getBanners();
    setState(() {
      isLoading=false;
    });
  }

  final ScrollController _scrollController = ScrollController();
  bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return isLoading?const HomeScreenShimmer():Consumer<ApiDataProvider>(
        builder: (context,apiData,_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Text("Hello ${apiData.userData!.name}",style: const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold
                ),),
                const SizedBox(width: 10,),
                Transform.rotate(
                  angle: 60,
                  child: Transform.flip(
                      flipY: true,
                      // flipX: true,
                      child: const Icon(Icons.waving_hand,color: Colors.amber,)),
                )
              ],
            ),
          ),
          body:


          Column(
            children: [
             const Padding(
               padding: EdgeInsets.only(left: 30,top: 30),
               child: Row(
                 children: [
                   Icon(Icons.electric_meter_sharp,color: Colors.green,),
                   Text("Saudi Riyal account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                 ],
               ),
             ),
              Expanded(
                child: CustomScrollView(
                  slivers:[

                    SliverAppBar(
                      expandedHeight: 100.0,
                      floating: false,
                      pinned: false,
                      title: Padding(
                        padding: const EdgeInsets.only(left: 30,top: 30),
                        child: Row(
                          children: [
                            RichText(text: TextSpan(
                                children: [
                                  const TextSpan(

                                    text: "SAR ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: apiData.userData!.balance.toString(),style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 28,color: Colors.black),
                                  )
                                ]
                            ))
                            // RichT("SAR ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                          ],
                        ),
                      ),
                    ),
                    SliverAppBar(
                      expandedHeight: 80.0,
                      floating: false,
                      pinned: false,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.orange)
                                ),
                                onPressed: (){},
                                child: const Text("Add money",style: TextStyle(color: Colors.white),)),
                            const SizedBox(width: 10,),
                            ElevatedButton(
                                onPressed: (){},
                                child: const Text("Transfer")),
                            const Spacer(),

                            CircleAvatar(
                              backgroundColor: Colors.grey[200],

                              child: const Icon(Icons.more_horiz,color: Colors.black,),
                            )
                          ],
                        ),
                      ),

                    ),
                    SliverAppBar(
                      expandedHeight: 80.0,
                      floating: false,
                      pinned: false,
                      title: Card(
                        color: Colors.white,
                        child: ListTile(
                          title: const ReusableTextWidget(text: "New Edge card",fontWeight: FontWeight.w600,),
                          subtitle: const ReusableTextWidget(text: "Enjoy 2% cashback offer",fontWeight: FontWeight.w400,),
                          leading: const Icon(Icons.bookmarks_sharp,color: Colors.orange,),
                          trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                              onPressed: (){},
                              child: const ReusableTextWidget(text: "Get now",color: Colors.white,)),
                        ),
                      )

                    ),


                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        semanticIndexOffset: 1,
                            addAutomaticKeepAlives: false,
                            (BuildContext context, int index) {
                         
                          return

                            ListView.builder(
                              itemCount: apiData.transactions.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index) {
                                return ListTile(
                                  title: ReusableTextWidget(text: apiData.transactions[index].details.from,fontWeight: FontWeight.w600,),
                                  subtitle: ReusableTextWidget(text: apiData.transactions[index].details.description,fontWeight: FontWeight.w400,),
                                  leading: apiData.transactions[index].details.image!=null?
                                  Image.network(apiData.transactions[index].details.image!):CircleAvatar(

                                      child: apiData.transactions[index].type=="credit"?Transform.rotate(
                                          angle: 269,
                                          child: const Icon(Icons.arrow_back_sharp,color: Colors.orange,)):
                                      Transform.rotate(
                                          angle: 90,
                                          child: const Icon(Icons.arrow_back_sharp,color: Colors.orange,))),
                                  trailing: ReusableTextWidget(text: apiData.transactions[index].amount.toString(),fontWeight: FontWeight.w800,),
                                );
                              }
                          );
                        },
                        // childCount: 10, // Number of list items
                      ),
                    ),
                  ]
                ),
                // SingleChildScrollView(
                //   controller: _scrollController,
                //   child: Column(
                //     children: [
                //       if(_isFirstVisible)ListView.builder(
                //           itemCount: 1,
                //           shrinkWrap: true,
                //           physics: NeverScrollableScrollPhysics(),
                //           itemBuilder: (context,index) {
                //             return Padding(
                //               padding: const EdgeInsets.only(left: 30,top: 30),
                //               child: Row(
                //                 children: [
                //                   RichText(text: TextSpan(
                //                       children: [
                //                         TextSpan(
                //
                //                           text: "SAR ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
                //                         ),
                //                         TextSpan(
                //                           text: apiData.userData!.balance.toString(),style: TextStyle(fontWeight: FontWeight.w800,fontSize: 28,color: Colors.black),
                //                         )
                //                       ]
                //                   ))
                //                   // RichT("SAR ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                //                 ],
                //               ),
                //             );
                //           }
                //       ),
                //
                //       if(_isSecondVisible)ListView.builder(
                //           itemCount: 1,
                //           shrinkWrap: true,
                //           physics: NeverScrollableScrollPhysics(),
                //           itemBuilder: (context,index) {
                //             return Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                 children: [
                //                   ElevatedButton(
                //                       style: ButtonStyle(
                //                           backgroundColor: MaterialStateProperty.all(Colors.orange)
                //                       ),
                //                       onPressed: (){},
                //                       child: Text("Add money",style: TextStyle(color: Colors.white),)),
                //                   SizedBox(width: 10,),
                //                   ElevatedButton(
                //                       onPressed: (){},
                //                       child: Text("Transfer")),
                //                   Spacer(),
                //
                //                   CircleAvatar(
                //                     backgroundColor: Colors.grey[200],
                //
                //                     child: Icon(Icons.more_horiz,color: Colors.black,),
                //                   )
                //                 ],
                //               ),
                //             );
                //           }
                //       ),
                //       if(_isThirdVisible)ListView.builder(
                //           itemCount: 1,
                //           shrinkWrap: true,
                //           physics: NeverScrollableScrollPhysics(),
                //           itemBuilder: (context,index) {
                //             return Card(
                //               color: Colors.white,
                //               child: ListTile(
                //                 title: ReusableTextWidget(text: "New Edge card",fontWeight: FontWeight.w600,),
                //                 subtitle: ReusableTextWidget(text: "Enjoy 2% cashback offer",fontWeight: FontWeight.w400,),
                //                 leading: Icon(Icons.bookmarks_sharp,color: Colors.orange,),
                //                 trailing: ElevatedButton(
                //                     style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                //                     onPressed: (){},
                //                     child: ReusableTextWidget(text: "Get now",color: Colors.white,)),
                //               ),
                //             );
                //           }
                //       ),
                //       ListView.builder(
                //           itemCount: apiData.transactions.length,
                //           shrinkWrap: true,
                //           physics: NeverScrollableScrollPhysics(),
                //           itemBuilder:(context,index){
                //             return Card(
                //               color: Colors.white,
                //               child: ListTile(
                //                 title: ReusableTextWidget(text: "New Edge card",fontWeight: FontWeight.w600,),
                //                 subtitle: ReusableTextWidget(text: "Enjoy 2% cashback offer",fontWeight: FontWeight.w400,),
                //                 leading: Icon(Icons.bookmarks_sharp,color: Colors.orange,),
                //                 trailing: ElevatedButton(
                //                     style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                //                     onPressed: (){},
                //                     child: ReusableTextWidget(text: "Get now",color: Colors.white,)),
                //               ),
                //             );
                //           }),
                //     ],
                //   ),
                // )
              )

            ],
          ),
        );
      }
    );
  }
}


