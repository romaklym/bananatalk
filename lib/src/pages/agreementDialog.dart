import 'package:bananatalk/src/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CreateAgreement extends StatelessWidget {
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1440, height: 2960, allowFontScaling: false);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffffd800),
              title:
                  Text('Agreement', style: TextStyle(color: Color(0xff9f703d))),
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Color(0xff9f703d),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, SlideRightRoute(page: IndexPage()));
                    },
                    child: Text('AGREE',
                        style: TextStyle(color: Color(0xff9f703d)))),
              ],
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text('BananaTalk Terms Of Service'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff9f703d),
                            fontSize: ScreenUtil().setSp(60))),
                    SizedBox(height: 30.h),
                    Text(
                        'NO ACCESS TO EMERGENCY SERVICES: There are important differences between BANANATALK and your mobile and fixed-line telephone and SMS services. Our Services do not provide access to emergency services or emergency services providers, including the police, fire departments, or hospitals, or otherwise connect to public safety answering points. You should ensure you can contact your relevant emergency services providers through a mobile, fixed-line telephone, or other service.'
                            .toUpperCase()),
                    Text(
                        'IF YOU ARE A BANANATALK USER LOCATED IN THE UNITED STATES OR CANADA, OUR TERMS CONTAIN A BINDING ARBITRATION PROVISION, WHICH STATES THAT, EXCEPT IF YOU OPT OUT AND EXCEPT FOR CERTAIN TYPES OF DISPUTES, BANANATALK AND YOU AGREE TO RESOLVE ALL DISPUTES THROUGH BINDING INDIVIDUAL ARBITRATION, WHICH MEANS THAT YOU WAIVE ANY RIGHT TO HAVE THOSE DISPUTES DECIDED BY A JUDGE OR JURY, AND THAT YOU WAIVE YOUR RIGHT TO PARTICIPATE IN CLASS ACTIONS, CLASS ARBITRATIONS, OR REPRESENTATIVE ACTIONS. PLEASE READ THE “SPECIAL ARBITRATION PROVISION FOR UNITED STATES OR CANADA USERS” SECTION BELOW TO LEARN MORE.'
                            .toUpperCase()),
                    SizedBox(height: 20.h),
                    Text('About our services'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff9f703d),
                            fontSize: ScreenUtil().setSp(60))),
                    SizedBox(height: 30.h),
                    Text(
                        'Registration. You must register for our Services using accurate data, provide your current mobile phone number, and, if you change it, update this mobile phone number using our in-app change number feature. You agree to receive text messages and phone calls (from us or our third-party providers) with codes to register for our Services.'
                            .toUpperCase()),
                    Text(
                        'Address Book. You provide us the phone numbers of BANANATALK users and your other contacts in your mobile phone address book on a regular basis. You confirm you are authorized to provide us such numbers to allow us to provide our Services.'
                            .toUpperCase()),
                    Text(
                        'Age. You must be at least 13 years old to use our Services (or such greater age required in your country for you to be authorized to use our Services without parental approval). In addition to being of the minimum required age to use our Services under applicable law, if you are not old enough to have authority to agree to our Terms in your country, your parent or guardian must agree to our Terms on your behalf.'
                            .toUpperCase()),
                    Text(
                        'Devices and Software. You must provide certain devices, software, and data connections to use our Services, which we otherwise do not supply. For as long as you use our Services, you consent to downloading and installing updates to our Services, including automatically.'
                            .toUpperCase()),
                    Text(
                        'Fees and Taxes. You are responsible for all carrier data plan and other fees and taxes associated with your use of our Services. We may charge you for our Services, including applicable taxes. We may refuse or cancel orders. We do not provide refunds for our Services, except as required by law.'
                            .toUpperCase()),
                    SizedBox(height: 20.h),
                    Text('Privacy policy and user data'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff9f703d),
                            fontSize: ScreenUtil().setSp(60))),
                    SizedBox(height: 30.h),
                    Text(
                        'BANANATALK cares about your privacy. BANANATALK’s Privacy Policy describes our information (including message) practices, including the types of information we receive and collect from you and how we use and share this information. You agree to our data practices, including the collection, use, processing, and sharing of your information as described in our Privacy Policy, as well as the transfer and processing of your information to the United States and other countries globally where we have or use facilities, service providers, or partners, regardless of where you use our Services. You acknowledge that the laws, regulations, and standards of the country in which your information is stored or processed may be different from those of your own country.'
                            .toUpperCase()),
                    SizedBox(height: 20.h),
                    Text('Disclaimers'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff9f703d),
                            fontSize: ScreenUtil().setSp(60))),
                    SizedBox(height: 30.h),
                    Text(
                        'YOU USE OUR SERVICES AT YOUR OWN RISK AND SUBJECT TO THE FOLLOWING DISCLAIMERS. WE ARE PROVIDING OUR SERVICES ON AN “AS IS” BASIS WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, NON-INFRINGEMENT, AND FREEDOM FROM COMPUTER VIRUS OR OTHER HARMFUL CODE. WE DO NOT WARRANT THAT ANY INFORMATION PROVIDED BY US IS ACCURATE, COMPLETE, OR USEFUL, THAT OUR SERVICES WILL BE OPERATIONAL, ERROR FREE, SECURE, OR SAFE, OR THAT OUR SERVICES WILL FUNCTION WITHOUT DISRUPTIONS, DELAYS, OR IMPERFECTIONS. WE DO NOT CONTROL, AND ARE NOT RESPONSIBLE FOR, CONTROLLING HOW OR WHEN OUR USERS USE OUR SERVICES OR THE FEATURES, SERVICES, AND INTERFACES OUR SERVICES PROVIDE. WE ARE NOT RESPONSIBLE FOR AND ARE NOT OBLIGATED TO CONTROL THE ACTIONS OR INFORMATION (INCLUDING CONTENT) OF OUR USERS OR OTHER THIRD PARTIES. YOU RELEASE US, OUR SUBSIDIARIES, AFFILIATES, AND OUR AND THEIR DIRECTORS, OFFICERS, EMPLOYEES, PARTNERS, AND AGENTS (TOGETHER, THE “BANANATALK PARTIES”) FROM ANY CLAIM, COMPLAINT, CAUSE OF ACTION, CONTROVERSY, OR DISPUTE (TOGETHER, “CLAIM”) AND DAMAGES, KNOWN AND UNKNOWN, RELATING TO, ARISING OUT OF, OR IN ANY WAY CONNECTED WITH ANY SUCH CLAIM YOU HAVE AGAINST ANY THIRD PARTIES. YOU WAIVE ANY RIGHTS YOU MAY HAVE UNDER CALIFORNIA CIVIL CODE §1542, OR ANY OTHER SIMILAR APPLICABLE STATUTE OR LAW OF ANY OTHER JURISDICTION, WHICH SAYS THAT: A GENERAL RELEASE DOES NOT EXTEND TO CLAIMS WHICH THE CREDITOR DOES NOT KNOW OR SUSPECT TO EXIST IN HIS OR HER FAVOR AT THE TIME OF EXECUTING THE RELEASE, WHICH IF KNOWN BY HIM OR HER MUST HAVE MATERIALLY AFFECTED HIS OR HER SETTLEMENT WITH THE DEBTOR.'
                            .toUpperCase()),
                    SizedBox(height: 20.h),
                    Text('Limitation of liability'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff9f703d),
                            fontSize: ScreenUtil().setSp(60))),
                    SizedBox(height: 30.h),
                    Text(
                        'THE BANANATALK PARTIES WILL NOT BE LIABLE TO YOU FOR ANY LOST PROFITS OR CONSEQUENTIAL, SPECIAL, PUNITIVE, INDIRECT, OR INCIDENTAL DAMAGES RELATING TO, ARISING OUT OF, OR IN ANY WAY IN CONNECTION WITH OUR TERMS, US, OR OUR SERVICES, EVEN IF THE BANANATALK PARTIES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. OUR AGGREGATE LIABILITY RELATING TO, ARISING OUT OF, OR IN ANY WAY IN CONNECTION WITH OUR TERMS, US, OR OUR SERVICES WILL NOT EXCEED THE GREATER OF ONE HUNDRED DOLLARS (\$100) OR THE AMOUNT YOU HAVE PAID US IN THE PAST TWELVE MONTHS. THE FOREGOING DISCLAIMER OF CERTAIN DAMAGES AND LIMITATION OF LIABILITY WILL APPLY TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW. THE LAWS OF SOME STATES OR JURISDICTIONS MAY NOT ALLOW THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES, SO SOME OR ALL OF THE EXCLUSIONS AND LIMITATIONS SET FORTH ABOVE MAY NOT APPLY TO YOU. NOTWITHSTANDING ANYTHING TO THE CONTRARY IN OUR TERMS, IN SUCH CASES, THE LIABILITY OF THE BANANATALK PARTIES WILL BE LIMITED TO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW.'
                            .toUpperCase()),
                    SizedBox(height: 20.h),
                    Text('Indemnification'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff9f703d),
                            fontSize: ScreenUtil().setSp(60))),
                    SizedBox(height: 30.h),
                    Text(
                        'You agree to defend, indemnify, and hold harmless the BANANATALK Parties from and against all liabilities, damages, losses, and expenses of any kind (including reasonable legal fees and costs) relating to, arising out of, or in any way in connection with any of the following: (a) your access to or use of our Services, including information provided in connection therewith; (b) your breach or alleged breach of our Terms; or (c) any misrepresentation made by you. You will cooperate as fully as required by us in the defense or settlement of any Claim.'
                            .toUpperCase()),
                  ],
                ),
              ),
            )));
  }
}
