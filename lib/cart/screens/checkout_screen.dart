import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trading_courses/cart/Provider/cart_provider.dart';
import 'package:trading_courses/home_screen/models/course_model.dart';
import 'package:trading_courses/home_screen/widgets/TitleText.dart';

import '../../navigation/navigators.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dS = MediaQuery.of(context).size;
    final dW = dS.width;
    final courseList = Provider.of<CartProvider>(context);
    List<Course> coursesToShow = courseList.cartCourses;
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffFBFFF4), Color(0xff98CCEC)])),
        child: Scaffold(
          //   appBar:AppBar(),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: dW * 0.1),
            child: ListView(children: [
              Row(children: [
                IconButton(
                  onPressed: () {
                    pop(context);
                  },
                  icon: SvgPicture.asset(
                    'assets/svg/back_arrow.svg',
                  ),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: TitleText(title: 'Cart Items'),
              ),
              coursesToShow.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('No Courses Added'),
                    )
                  : SizedBox(
                      height: ((dW * 0.4) * (coursesToShow.length)),
                      width: dW * 0.4,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: coursesToShow.length,
                        itemBuilder: (context, index) {
                          return CourseWidget(
                              coursesToShow: coursesToShow, dW: dW);
                        },
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/Discount.svg'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Offers available',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.clip),
                              ),
                              Text(
                                'Add promo code',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.clip),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/Chevron.png',
                          scale: 1.0,
                        ))
                  ],
                ),
              ),
              const TitleText(title: 'Order Details'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items Total',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.clip),
                          ),
                          Text(
                            Provider.of<CartProvider>(context)
                                .itemsTotal
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total GST (18%)',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.clip),
                          ),
                          Text(
                            Provider.of<CartProvider>(context)
                                .totalGst
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wallet Used',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.clip),
                          ),
                          Text(
                            Provider.of<CartProvider>(context)
                                .walletUsed
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To Pay',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.clip),
                          ),
                          Text(
                            Provider.of<CartProvider>(context).toPay.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(dW * 0.05),
                      child: Text(
                        'By completing your purchase you agree to these Terms of services.',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.clip),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              //  decoration: BoxDecoration(boxShadow: BoxShadow(offset: 10)),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: dW * 0.15,
              width: dW,
              child: FloatingActionButton(
                elevation: 15.0,

                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                onPressed: () {
                  print("Button is pressed.");
                  //task to execute when this button is pressed
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: dW * 0.05, vertical: dW * 0.02),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.clip),
                          ),
                          Text(
                            Provider.of<CartProvider>(context).toPay.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'CHECKOUT',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: const Color(0xff3199D8),
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                          ),
                          Image.asset('assets/images/Chevron.png'),
                        ],
                      ),
                    ],
                  ),
                ),
                //
              ),
            ),
          ),
        ));
  }
}

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    Key? key,
    required this.coursesToShow,
    required this.dW,
  }) : super(key: key);

  final List<Course> coursesToShow;
  final double dW;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        coursesToShow[0].bannerImage,
                        height: dW * 0.25,
                      )),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          coursesToShow[0].courseName,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.fade),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/star.svg'),
                          Text(
                            coursesToShow[0].stars.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.clip),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              '(${coursesToShow[0].reviewCount})',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.clip),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '₹${coursesToShow[0].price}',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.clip),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextButton.icon(
              icon: SvgPicture.asset('assets/svg/Union.svg'),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .removeCourse(coursesToShow[0]);
                print('object');
              },
              label: Text(
                'Remove',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.clip),
              )),
          TextButton.icon(
              icon: SvgPicture.asset('assets/svg/Rectangle.svg'),
              onPressed: () {},
              label: Text(
                'Move to Wishlist',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.clip),
              )),
        ]),
      ],
    );
  }
}
