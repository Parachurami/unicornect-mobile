import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 30),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'General This privacy policy applies to all the information we collect about customers who purchase tickets or have their event (Organizer) from the UniCornect platform',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(text: ' https://index.html. ',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Helper.hexToColor('#FF8C40')
              )
            ),
            TextSpan(
              text: "UniCornect;  is allowed to collect, use, and share your information with the event organizer and us as well.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black
              ),
            ),
            TextSpan(
              text: "Your privacy is important to us, and we are committed to respecting it. This applies to any information we may collect from you on our website,",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black
              ),
            ),
            TextSpan(text: ' https://index.html.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Helper.hexToColor('#FF8C40')
              )
            ),
            TextSpan(
              text: ", and other sites we own and operate.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black
              ),
            ),
            TextSpan(
              text: "Data collected outside UniCornect's service platform is not covered by our privacy policy, except when collected by an outside source with our approval.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black
              ),
            ),
            TextSpan(
              text: " We only request personal information when necessary to provide you with a service, and we will always do so in a fair and lawful manner with your consent. We will inform you of the reasons for collecting your information and how it will be used. Any data we collect will only be retained for as long as necessary to provide the requested service.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black
              ),
            ),
            TextSpan(
              text: "We will protect the collected data using commercially acceptable means to prevent loss, theft, unauthorized access, disclosure, copying, use, or modification. We do not share any personally identifying information publicly or with third parties, except when required by law.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black
              ),
            ),
            TextSpan(
              text: 'What data do we collect and why?\n',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
            TextSpan(
              text: "1. Tickets Data & Events Data When visitors book a ticket on the site, we collect data such as name, email, phone number, IP address, and browser user agent string for spam detection purposes.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: '2. Cookies We use cookies on our website, and by using the website, you consent to the use of cookies in accordance with our privacy policy. Cookies are used to enhance the functionality of the site and improve user experience. Additionally, some of our affiliate/advertising partners may also use cookies.\n\n',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: "3. Media If you upload images to the website, please ensure that they do not include embedded location data (EXIF GPS). Visitors can download and extract any location data from images on the website.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: "4. Embedded content from other websites Articles on this site may contain embedded content (e.g. videos, images, articles) from other websites. This embedded content behaves in the exact same way as if the visitor has visited the other website, including the collection of data, use of cookies, and third-party tracking.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: "Who do we share your data with?\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
            TextSpan(
              text: "If you have an account on",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(text: ' https://index.html ',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Helper.hexToColor('#FF8C40')
              )
            ),
            TextSpan(
              text: "or have obtained a ticket, you have the right to request an exported file containing the personal data we have about you. This includes any data you have provided to us. Additionally, you can request the deletion of any personal data we have about you. Please be aware that this does not apply to any data that we are obligated to retain for administrative, legal, or security reasons. \n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: 'Where do we send your data?\n',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
            TextSpan(
              text: "Visitor data and ticket information may be transmitted via an automated service to the event organizer that you register with or to relevant government authorities.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: 'Security\n',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
            TextSpan(
              text: "The safety of our users' personal information is very important to us. We take all necessary measures to safeguard our database of customer information. We use the latest physical and technical methods to secure the data, including encrypting data transmitted over the internet.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: 'Payment\n',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
            TextSpan(
              text: "Payment information will be processed through the example.com platform. Credit/debit card details and personally identifiable information will not be stored, sold, shared, rented, or leased to any third parties.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: 'Further Contact\n',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
            TextSpan(
              text: "Your continued use of our website will be considered as acceptance of our privacy practices and how we handle personal information. If you have any questions regarding our user data and personal information handling, please feel free to contact us via email at",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: " info@example.com",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Helper.hexToColor('#1B3CB1')
              )
            ),
            TextSpan(
              text: ". You may also schedule an appointment to visit UniCornect, which is located at Bells University of Technology in Ota, Ogun State, Nigeria.\n\n",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black
              )
            ),
            TextSpan(
              text: "By accessing this app, we assume that you accept these privacy policies in full.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
          ]
        )
      ),
    );
  }
}
