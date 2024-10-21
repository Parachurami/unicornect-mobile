import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/event.dart';
import 'package:unicornect/app/widgets/submit_button.dart';

class EventTicketScreen extends StatelessWidget{
  const EventTicketScreen({super.key, required this.selection, required this.event});
  final Map<String, String> selection;
  final Event event;

  String formattedPrice(double price){
    final priceNumber = price.toInt().toString();
    print(priceNumber);
    List<String> strPrice = priceNumber.split('').reversed.toList();
    List<String> priceString = [];
    int counter = 0;
    for(int i = 0; i < strPrice.length; i++){
      counter++;
      priceString.add(strPrice[i]);
      if(counter % 3 == 0) priceString.add(',');
    }
    final resultList = priceString.reversed.toList();
    String result = '';
    for(String s in resultList){
      result += s;
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Ticket',
          style: TextStyle(
            color: Helper.hexToColor('#0D0D0D'),
            fontSize: 16
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 26, left: 32, right: 32, bottom: 50),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/ticket_icon_fill.png',
                  width: 24,
                  color: Helper.hexToColor('#7C7C80'),
                ),
                const SizedBox(width: 6.33,),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Helper.hexToColor('#7C7C80'),
                ),
                SizedBox(
                  width: 172,
                  child: Text(event.title,
                    style: TextStyle(
                      color: Helper.hexToColor('#242426'),
                    ),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Helper.hexToColor('#7C7C80'),
                ),
                const SizedBox(width: 12,),
                Text('View Ticket',
                  style: TextStyle(
                    color: Helper.hexToColor('#242426'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 42,),
            Container(
              padding: const EdgeInsets.only(left: 13, right: 13, top: 16, bottom: 13),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Helper.hexToColor('#FFFFFF'),
                boxShadow: [
                  BoxShadow(
                    color: Helper.hexToColor('#0000001A'),
                    blurRadius: 7,
                    spreadRadius: 3,
                    offset: const Offset(0, 0),
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: double.infinity,
                    height: 103,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Image.asset(event.image,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Text(event.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Helper.hexToColor('#242426'),
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Text(event.getFormattedDate,
                        style: TextStyle(
                          color: Helper.hexToColor('#545456'),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(width: 16,),
                      Text(event.getFormattedTime(context),
                        style: TextStyle(
                          color: Helper.hexToColor('#545456'),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                        color: Helper.hexToColor('#7C7C80'),
                        size: 20,
                      ),
                      const SizedBox(width: 8,),
                      Text('Bells University of Technology',
                        style: TextStyle(
                          color: Helper.hexToColor('#242426'),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 14,),
                  Text(selection['tableType']!,
                    style: TextStyle(
                      color: Helper.hexToColor('#545456'),
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 17,),
                  Text('NGN ${formattedPrice(double.parse(selection['amount']!))}',
                    style: TextStyle(
                        color: Helper.hexToColor('#545456'),
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 24,),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text('Hypeman Ojobo',
                      style: TextStyle(
                        color: Helper.hexToColor('#242426'),
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Text('Organiser',
                      style: TextStyle(
                        color: Helper.hexToColor('#7C7C80'),
                      ),
                    ),
                    leading: Container(
                        height:43,
                        width: 43,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Image.asset('assets/images/organizer_image_1.png',
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  const SizedBox(height: 27,),
                  DottedLine(
                    dashColor: Helper.hexToColor('#242426'),
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(height: 46.56,),
                  Align(
                    alignment: const Alignment(0, 0),
                    child: QrImageView(
                      data: event.id,
                      size: 105.8,
                      dataModuleStyle: QrDataModuleStyle(
                        color: Helper.hexToColor('#FF8C40')
                      ),
                      eyeStyle: QrEyeStyle(
                        color: Helper.hexToColor('#FF8C40'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28.06,),
                  Align(
                    alignment: const Alignment(0, 0),
                    child: Text('Scan QR Code',
                      style: TextStyle(
                        color: Helper.hexToColor('#0D0D0D'),
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 36,),
            SubmitButton(
              title: 'Download E-Ticket',
              backgroundColor: Helper.hexToColor('#0D0D0D'),
              onPressed: (){},
              width: double.infinity,
            ),
            const SizedBox(height: 16,),
            SubmitButton(
              title: 'Print Ticket',
              backgroundColor: Helper.hexToColor('#EFF7FF'),
              onPressed: (){
                print('object');
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}