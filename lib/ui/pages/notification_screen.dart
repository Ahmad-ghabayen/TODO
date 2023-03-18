import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo1/ui/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);
  final String payload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';

  @override
  void initState() {
    _payload = widget.payload;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back,color: primaryClr,),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          _payload.toString().split('|')[0],
          style: TextStyle(
              color: Get.isDarkMode ? white : Colors.black,
              fontSize: 25),
        ),
        backgroundColor: context.theme.backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),

            Column(
              children: [
                Text(
                  'Hello ahmad',
                  style: TextStyle(
                      fontSize: 26,
                      color: Get.isDarkMode ? white :darkGreyClr,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10,),
                Text(
                  'You Have New Reminder',
                  style: TextStyle(
                      fontSize: 18,
                      color: Get.isDarkMode ? Colors.grey[100] :darkGreyClr,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryClr
              ),
               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(children: [
                       const Icon(Icons.text_format,size: 30,color: white,),
                       const SizedBox(width: 20,),
                       Text("Title",style: TextStyle(color: white,fontSize:30 ),),

                     ],),
                     const SizedBox(height: 20,),
                      Text(_payload.toString().split('|')[0],style:const  TextStyle(color: white,fontSize: 20),),
                     const SizedBox(height: 20,),
                     Row(children: const [
                       Icon(Icons.description,size: 30,color: white,),
                       SizedBox(width: 20,),
                       Text("Description",style: TextStyle(color: white,fontSize:30 ),),
                       SizedBox(width: 20,),

                     ],),
                     const SizedBox(height: 10,),
                      Text(_payload.toString().split('|')[1],style: const TextStyle(color: white,fontSize: 20),),
                     const SizedBox(height: 20,),
                     Row(children: const [
                       Icon(Icons.calendar_today_outlined,size: 30,color: white,),
                       SizedBox(width: 20,),
                       Text('Date',style: TextStyle(color: white,fontSize:30 ),),
                       SizedBox(width: 20,),

                     ],),
                     const SizedBox(height: 10,),
                      Text(_payload.toString().split('|')[2],style:const TextStyle(color: white,fontSize: 20),),
                     const SizedBox(height:20,),
                   ],
                 ),
               ),

            )),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
