import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/UI/registration_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms And Conditions',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ONLINE DOCTOR ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TERMS AND CONDITIONS OF THIS SITE:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'At Online doctor.pk, we respect the privacy of everyone who visits our website '
                        'and is assigned to protecting patron privacy on the internet.  '
                        'The information we receive about you rest on what you do when you visit our site. '
                        ' We will not accumulate or contract any personal Information about you '
                        'unless you choose to provide it to us.',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'OWNERSHIP AND USES OF THE SITE:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Online doctor owns and utilizes this website pinpointed at www.onlinedoctor.pk.'
                        ' All data and/or information stifled on this site is and shall remain the undivided'
                        ' property of Online Doctor. By using this site, you accede to respect the ownership'
                        ' rights and rules of use of the Online Doctor website, as well as the right of Online'
                        ' Doctor to monitor this at any time and the right of Online Doctor to process, keep back,'
                        ' copy, and subject you to our Website Terms of Use and applicable laws and regulations, use'
                        ' and unfold any information you may provide to Online Doctor through this site. The site and '
                        'all information provided are protected by copyright. Unless expressly authorized, no '
                        'information found on this site may be copied, replicated, published, uploaded, posted,'
                        ' transmitted, or distributed in any way without prior written permission of Online Doctor.',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'ONLINE SECURITY:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Online Doctor is obligated to protecting and maintaining'
                        ' the confidentiality of users personal non-public information.'
                        ' When users submit personal non-public information to Online Doctor,'
                        ' the information is protected both online and offline.',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'HOME LAB SAMPLING:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Online Doctor is offering free home sample collection services'
                        ' to the patients to help them get tested in the convenience of their homes.'
                        ' To book home sample collection call 03......................'
                        'Worn out of spending hours waiting in queues at diagnostic labs leaving'
                        ' you leaning behind? Facing difficulty in taking old age or disabled individuals'
                        ' to the lab? Or fed-up of wasting time in traffic? How about if we provide you'
                        ' with all the solutions at your doorstep for your convenience, so you don’t have '
                        'to compromise on your health just because of such issues. Hurry up and visit..........................',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'MEDICINE DELIVERY AND ONLINE CONSULTATION:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Now you don\'t have to go out for bringing your medicines.'
                        ' Online Doctor is making it convenient for customers to purchase'
                        ' medicines of their concern Online. And you can also have Online'
                        ' consultation according to your problem without an appointment.',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'When do we collect information?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'We collect the said information when you register on our'
                        'site through the web or via the Online Doctor app.',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'HOW DO WE USE YOUR INFORMATION?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Make a purchase Sign up for our email list or newsletter'
                        ' For a survey or marketing campaign Surf the website',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'HOW DO WE USE YOUR INFORMATION?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'To personalize your website experience and offer you content and products as per your inclinations.'
                        '\n To amend and update our website to better serve you.'
                        '\nTo respond to customer service inquiries appropriately.'
                        '\nTo manage rating and reviews of the website.'
                        '\nTo identify and register doctors on our website.To verify doctor\'s registrations with PMC',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        label: 'Done',
                        onTap: () {
                          Get.off(RegistrationUI_signUp());
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
