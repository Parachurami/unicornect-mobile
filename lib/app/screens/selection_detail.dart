import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/event.dart';
import 'package:unicornect/app/screens/event_ticket.dart';
import 'package:unicornect/app/widgets/home/event_date_time_detail.dart';
import 'package:unicornect/app/widgets/selection_detail/selection_input.dart';
import 'package:unicornect/app/widgets/submit_button.dart';

class SelectionDetailScreen extends StatefulWidget{
  const SelectionDetailScreen({super.key, required this.event, required this.selection});
  final Event event;
  final Map<String, String> selection;

  @override
  State<SelectionDetailScreen> createState(){
    return _SelectionDetailScreenState();
  }
}

class _SelectionDetailScreenState extends State<SelectionDetailScreen>{
  final formKey = GlobalKey<FormState>();
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
  void saveDetails(){
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EventTicketScreen(selection: widget.selection, event: widget.event,),
        )
      );
    }
  }
  final title = 'Checkout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
          style: const TextStyle(
            fontSize: 16
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Icon(Icons.home_rounded),
                  const SizedBox(width: 9,),
                  const Icon(Icons.chevron_right_rounded),
                  const SizedBox(width: 12,),
                  SizedBox(
                    width: 120,
                    child: Text(widget.event.title,
                      style: TextStyle(
                        color: Helper.hexToColor('#242426'),
                      ),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded),
                  const SizedBox(width: 4.33,),
                  Text(title,
                    style: TextStyle(
                      color: Helper.hexToColor('#242426'),
                    ),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            const SizedBox(height: 34,),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    widget.event.image,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(width: 8,),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Helper.hexToColor('#242426')
                        ),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10,),
                      Text('Bells University of Technology',
                        style: TextStyle(
                          color: Helper.hexToColor('#444446'),
                          fontWeight: FontWeight.w400
                        ),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          EventDateTimeDetail(
                            icon: Icons.calendar_today_outlined,
                            title: widget.event.getFormattedDate
                          ),
                          const SizedBox(width: 16,),
                          EventDateTimeDetail(
                            icon: Icons.access_time,
                            title: widget.event.getFormattedTime(context)
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 36,),
            Row(
              children: [
                Image.asset(
                  'assets/images/ticket_icon_outline.png',
                  color: Helper.hexToColor('#F5A571'),
                  height: 20,
                ),
                const SizedBox(width: 6.03,),
                Text('Your Selection',
                  style: TextStyle(
                    color: Helper.hexToColor('#545456'),
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.selection['tableType']!,
                  style: TextStyle(
                    color: Helper.hexToColor('#242426'),
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  'NGN ${formattedPrice(double.parse(widget.selection['amount']!))}',
                  style: TextStyle(
                    color: Helper.hexToColor('#242426'),
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service Fee',
                  style: TextStyle(
                    color: Helper.hexToColor('#242426'),
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  'NGN 150',
                  style: TextStyle(
                    color: Helper.hexToColor('#242426'),
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Fee',
                  style: TextStyle(
                    color: Helper.hexToColor('#242426'),
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  'NGN${formattedPrice(double.parse(widget.selection['amount']!) + 150.0)}',
                  style: TextStyle(
                      color: Helper.hexToColor('#242426'),
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        width: 1,
                        color: Helper.hexToColor('#444446')
                      )
                    )
                  ),
                  onPressed: (){},
                  child: Text('Edit Selection',
                    style: TextStyle(
                      color: Helper.hexToColor('#0D0D0D'),
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),
              ],
            ),
            const SizedBox(height: 41),
            Text('Customer Information',
              style: TextStyle(
                color: Helper.hexToColor('#363638'),
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8,),
            Text('Please kindly ensure you fill in your Information correctly',
              style: TextStyle(
                color: Helper.hexToColor('#545456'),
                fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: 40,),
            Form(
              key: formKey,
              child: SizedBox(
                child: Column(
                  children: [
                    SelectionInput(
                      formKey: formKey,
                      title: 'First Name',
                      placeholder: 'e.g John',
                      validator: (value){
                        if(value == null || value.trim().isEmpty) return 'Please enter your first name';
                        if(value.trim().length < 3) return 'Your first name must be at least 3 characters long';
                        return null;
                      },
                      inputType: TextInputType.text
                    ),
                    const SizedBox(height: 16,),
                    SelectionInput(
                      formKey: formKey,
                      title: 'Last Name',
                      placeholder: 'e.g doe',
                      validator: (value){
                        if(value == null || value.trim().isEmpty) return 'Please enter your last name';
                        if(value.trim().length < 3) return 'Your last name must be at least 3 characters long';
                        return null;
                      },
                      inputType: TextInputType.text
                    ),
                    const SizedBox(height: 16,),
                    SelectionInput(
                      formKey: formKey,
                      title: 'Email',
                      placeholder: 'e.g Johndoe@gmail.com',
                      validator: (value){
                        if(value == null || value.trim().isEmpty) return 'Please enter your email';
                        if(!Helper.validEmail(value.trim())) return 'Please enter a valid email address';
                        return null;
                      },
                      inputType: TextInputType.emailAddress
                    ),
                    const SizedBox(height: 16,),
                    SelectionInput(
                      formKey: formKey,
                      title: 'Phone number',
                      validator: (value){
                        if(value == null || value.trim().isEmpty) return 'Please enter your first name';
                        if(value.trim().length < 11 || (int.tryParse(value.trim()) == null)) return 'Enter valid phone number';
                        return null;
                      },
                      inputType: TextInputType.phone
                    ),
                    const SizedBox(height: 48,),
                    SubmitButton(
                      width: double.infinity,
                      title: 'Proceed to Payment',
                      backgroundColor: Helper.hexToColor('#0D0D0D'),
                      onPressed: saveDetails
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}