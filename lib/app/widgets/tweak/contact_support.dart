import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  void copyText(String text, BuildContext context) async{
    await FlutterClipboard.copy(text);
    if(context.mounted){
      Navigator.of(context).pop();
    }
  }

  void _showCopyModal(BuildContext context){
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          height: 85,
          width: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Helper.hexToColor('#F6F0E9')
          ),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Copy Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('unicornect.event@support.com'),
                    const SizedBox(width: 10,),
                    IconButton(
                      onPressed: (){
                        copyText('unicornect.event@support.com', context);
                      },
                      icon: Image.asset('assets/images/copy_icon.png', width: 24,),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: Helper.hexToColor('#F6F0E9'),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 52),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.phone_rounded,
                      color: Helper.hexToColor('#FF8C40'),
                    ),
                  ),
                ),
                const SizedBox(width: 12,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Our 24/7 customer service',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text('0802 654 0264',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            _showCopyModal(context);
          },
          child: Card(
            color: Helper.hexToColor('#F6F0E9'),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(
                      child: Icon(
                        Icons.email_rounded,
                        color: Helper.hexToColor('#FF8C40'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email us at',
                        style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text('unicornect.event@support.com',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
