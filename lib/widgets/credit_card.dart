import 'package:flutter/material.dart';
import 'package:wallet/models/credit_card.dart';
import 'package:wallet/widgets/big_dots.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({Key key, @required this.creditCard})
      : assert(creditCard != null),
        super(key: key);

  final CreditCard creditCard;

  @override
  Widget build(BuildContext context) {
    final BigDotsWidget _bigDots = BigDotsWidget(
      count: 4,
      width: 6,
      height: 6,
      color: Colors.white,
    );

    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1573FF),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              ClipPath(
                clipper: CardClipperLeft(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E1671),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              ClipPath(
                clipper: CardClipperRight(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF4EB4FF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 25.0,
                left: 20.0,
                child: Text(
                  creditCard.clientName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Positioned(
                top: 90.0,
                left: 20.0,
                child: Text(
                  creditCard.bankName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Positioned(
                top: 122.0,
                left: 20.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      creditCard.cardNumberFirst,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    _bigDots,
                    const SizedBox(
                      width: 5.0,
                    ),
                    _bigDots,
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      creditCard.cardNumberLast,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150.0,
                left: 20.0,
                child: Text(
                  '\$${creditCard.balance}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 140.0,
                right: 20.0,
                child: Image.asset(
                  'assets/images/visa.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFF4267),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          width: 280,
          height: 10,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF5655B9),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          width: 260,
          height: 10,
        ),
      ],
    );
  }
}

class CardClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(size.width * 0.45, 0.0);
    path.arcToPoint(Offset(size.width * 0.65, size.height), radius: Radius.circular(size.width * 0.6));
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CardClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * 0.6);
    path.arcToPoint(Offset(size.width * 0.7, 0.0), radius: Radius.circular(size.width * 0.3));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
