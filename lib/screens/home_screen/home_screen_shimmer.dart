
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assessment/screens/home_screen/widgets/reusable_text_widget.dart';
import 'package:flutter_assessment/screens/home_screen/widgets/shimmer_effect.dart';
import 'package:shimmer/shimmer.dart';

import '../../../providers/user_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreenShimmer extends StatefulWidget {
  const HomeScreenShimmer({super.key});

  @override
  State<HomeScreenShimmer> createState() => _HomeScreenShimmerState();
}

class _HomeScreenShimmerState extends State<HomeScreenShimmer> {

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ShimmerEffect(),
      ),
      body:


      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 30,bottom: 30),
                child: ShimmerEffect(),
              ),
              ShimmerEffect(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShimmerEffect(height: 50,width: 100,),
                    SizedBox(width: 10,),
                    ShimmerEffect(height: 50,width: 100,),
                    Spacer(),

                    ShimmerEffect(height: 50,width: 50,),
                  ],
                ),
              ),
              ShimmerEffect(height: 80,width: width*.9,),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return ListTile(
                      title: ShimmerEffect(width: 80,height: 10,),
                      subtitle: ShimmerEffect(width: 100,height: 10,),
                      leading: ShimmerEffect(height: 40,width: 40,),
                      trailing: ShimmerEffect(width: 50,),
                    );
                  })

            ],
          ),
        ),
      ),
    );
  }
}


