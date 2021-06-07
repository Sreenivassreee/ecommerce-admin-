import 'package:admin_for_e_commerce/size_config.dart';
import 'package:flutter/material.dart';


class CategeriesCard extends StatelessWidget {
  final image,category,numOfBrands;
  CategeriesCard({this.image,this.category,this.numOfBrands});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Expanded(
        child: GestureDetector(
            onTap: (){},
            child: SizedBox(
              width: 30,
              height: 180,
              // width: getProportionateScreenWidth(242),
              // height: getProportionateScreenWidth(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                  Container(
                    alignment: Alignment.center,
                  
                    child: Image.network(image,
                  alignment: Alignment.center,
                  fit: BoxFit.fitWidth,),
                  
                  ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF343434).withOpacity(0.4),
                            Color(0xFF343434).withOpacity(0.15),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:20, 
                        // getProportionateScreenWidth(15.0),
                        vertical:10,
                        //  getProportionateScreenWidth(10),
                      ),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                text: "$category\n",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // TextSpan(text: "$numOfBrands Brands")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
        ),
      ),
    );
  }
}