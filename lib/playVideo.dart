import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class playVideo extends StatefulWidget {
  final String VedioPath;
  const playVideo({Key? key, required this.VedioPath}) : super(key: key);

  @override
  State<playVideo> createState() => _playVideoState();
}

class _playVideoState extends State<playVideo> {


  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.VedioPath)
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true); // Loop the video
          _controller.setVolume(1.0);
          _controller.play();

          // Auto play when the video is initialized
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/background.png',),fit: BoxFit.cover)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 25.0.h,horizontal: 25.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 370.w,
                    height: 450.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child:  Center(
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                          : CircularProgressIndicator(),
                    ),
                  ),
                  SizedBox(height: 200.h,),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100.w,
                          height: 51.w,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xffc9c672), Color(0xffE0B51E)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            borderRadius: BorderRadius.circular(30.r)
              
                          ),
                          child: Center(
                            child: Text('Back',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 51.w,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffc9c672), Color(0xffE0B51E)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30.r)
              
                        ),
                        child: Center(
                          child: Text('Next',style: TextStyle(color: Colors.white)),
                        ),
                      ),
              
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

