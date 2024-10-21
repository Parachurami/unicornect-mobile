import 'package:flutter/cupertino.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
      child: SizedBox(
        height: deviceHeight * 0.7,
        width: double.infinity,
        child: const SingleChildScrollView(
          child: Text(
            "The tickets for this event are provided by Unicornect on behalf of the Event Organizer and are subject to the following terms and conditions.Unicornect is not the Event Organizer unless specifically stated. The Organizer is the individual or entity responsible for creating, managing, and promoting the event."
                "\n\n"
                "1. In addition to the terms and conditions outlined below, all event attendees must also comply with any terms and conditions established at the venue."
                "\n\n2. Admittance to the event will not be permitted without a valid ticket or pass. The event ticket is a single dynamic QR Code that requires a valid data connection for proper validation. Screenshots of the dynamic QR Code will not be accepted as valid. It is the customer's responsibility to have access to a data connection to present the ticket QR Code for validation. Failure to do so will result in non-admittance to the event."
                "\n\n3. The QR Code tickets provided are for single use only. No multiple-use or multiple-entry tickets will be provided. Attendees must occupy the event location specified on their ticket and will not be allowed into any other section of the event unless authorized by the Event Organizer."
                "\n\n4. Please take note that tickets cannot be exchanged or refunded after purchase, unless the event has been postponed or canceled by the Event Organizer. Duplicate tickets cannot be issued under any circumstances."
                "\n\n5. If the event is rescheduled or moved, the Organizer will offer you the choice of either keeping or exchanging your tickets for the new date or location. If the event is canceled, you may be given the option to transfer your ticket to a future event or receive a refund on your tickets. Please be aware that Booking Fees, Service Fees, Convenience fees, and/or Transaction Fees are non refundable in these situations."
                "\n\n6. Defaced or altered tickets or passes will be invalid, and the holder will be denied admission."
                "\n\n7. Tickets cannot be resold for profit. If we suspect that tickets have been resold, they will be invalidated, and the holder will be refused admission."
                "\n\n8. The organizer reserves the right to modify the content or timing of any part of the event due to circumstances beyond its control. In such cases, there will be no obligation to offer refunds or ticket exchanges."
                "\n\n9. The organizer reserves the right to deny admission or remove any individual who appears to be intoxicated, under the influence of drugs, behaving dangerously or inappropriately, or causing annoyance or damage. Failure to comply with the organizer's reasonable requests can also result in refusal of admission."
                "\n\n10. The organizer and the venue operator will not be liable for any loss, damage, death, or injury unless there is a breach of legal obligations and the loss or damage is a direct and reasonably foreseeable result of the breach. The organizer will not be responsible for the actions of any third party, including exhibitors."
                "\n\n11. The organizer is not responsible for any loss or damage to personal property brought to the event."
                "\n\n12. Please check event details, timings, and ticket fees before purchasing, as these may be subject to change."
                "\n\n13. Promotional or early bird tickets will lose their value after the specified due date if not purchased by that time.",
          ),
        ),
      ),
    );
  }
}
