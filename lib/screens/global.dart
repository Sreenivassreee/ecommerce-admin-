import 'package:admin_for_e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class CategeriesCard extends StatelessWidget {
  final image, category, numOfBrands;
  GestureTapCallback? ontap;
  CategeriesCard({this.image, this.category, this.numOfBrands, @required this.ontap});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
     
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: ontap,
                child: Stack(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        
                        child: Image.network(
                          
                          image,
                          
                          fit: BoxFit.fill,
                        ),
                      ),
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
                        horizontal: 20,
                        // getProportionateScreenWidth(15.0),
                        vertical: 10,
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
      ),
    );
  }
}
