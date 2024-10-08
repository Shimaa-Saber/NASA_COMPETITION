import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/playVideo.dart';
import 'package:video_player/video_player.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;

  @override
  void initState() {
  
    super.initState();
    _controller1=VideoPlayerController.asset('assets/videos/video1.mp4',videoPlayerOptions:VideoPlayerOptions(allowBackgroundPlayback: bool.fromEnvironment(AutofillHints.familyName)))..initialize().then((_) {
      setState(() {
    _controller1.play();
      });
    });

    _controller2 = VideoPlayerController.asset('assets/videos/video2.mp4',videoPlayerOptions:VideoPlayerOptions(allowBackgroundPlayback: bool.fromEnvironment(AutofillHints.familyName)))
      ..initialize().then((_) {
        setState(() {
          _controller2.play();
        });
      });

    _controller3 = VideoPlayerController.asset('assets/videos/video3.mp4',videoPlayerOptions:VideoPlayerOptions(allowBackgroundPlayback: bool.fromEnvironment(AutofillHints.familyName)))
      ..initialize().then((_) {
        setState(() {
          _controller3.play();
        });
      });

  }
@override
void dispose() {
  _controller1.dispose();
  _controller2.dispose();
  _controller3.dispose();
  super.dispose();

}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          width: double.infinity,
          height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background.png',),fit: BoxFit.cover)
        ),
        child: Padding(
          padding:  EdgeInsets.only(top: 25.0.h,left: 20.w,right: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/TELESCOPE 1.png')),
                //SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.only(right: 90.0.w,),
                  child: Image(image: AssetImage('assets/images/Group 18 (1).png')),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => playVideo(VedioPath: 'assets/videos/video1.mp4'),));
                    },
                    child: Container(
                      width: 114.w,
                      height: 109.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                       // color: Colors.purple
                      ),
                      child: Center(
                        child: _controller1.value.isInitialized?AspectRatio(aspectRatio: _controller1.value.aspectRatio,
                        child: VideoPlayer(_controller1),
                        ):CircularProgressIndicator(),

                      )

                      //Image(image: AssetImage('assets/images/518673_7387899_updates.png'),width: 114.w,height: 109.h,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,),
                  child: Image(image: AssetImage('assets/images/Group 23 (3).png')),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => playVideo(VedioPath: 'assets/videos/video2.mp4'),));
                      },
                      child: Container(
                        width: 114.w,
                        height: 109.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r)
                            ,
                           // color: Colors.purple
                        ),
                        child:Center(
                          child: _controller2.value.isInitialized
                              ? AspectRatio(
                            aspectRatio: _controller2.value.aspectRatio,
                            child: VideoPlayer(_controller2),
                          )
                              : CircularProgressIndicator(),
                        ),

                        // Image(image: AssetImage('assets/images/518673_7387899_updates.png'),width: 114.w,height: 109.h,),
                      ),
                    ),
                  ),

                ),
                Padding(
                  padding:  EdgeInsets.only(left: 60.0.w,),
                  child: Image(image: AssetImage('assets/images/Group 18 (3).png')),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => playVideo(VedioPath: 'assets/videos/video3.mp4'),));
                    },
                    child: Container(
                      width: 114.w,
                      height: 109.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r)
                          ,
                         // color: Colors.purple
                      ),
                      child: Center(
                        child: _controller3.value.isInitialized
                            ? AspectRatio(
                          aspectRatio: _controller3.value.aspectRatio,
                          child: VideoPlayer(_controller3),
                        )
                            : CircularProgressIndicator(),
                      ),

                      // Image(image: AssetImage('assets/images/518673_7387899_updates.png'),width: 114.w,height: 109.h,),
                    ),
                  ),

                ),

              ]
            ),
          ),
        ),

      ),
    );
  }
}
