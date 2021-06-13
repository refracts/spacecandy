@interface TapeRecorder : UIView
    -(void)setup;
    -(void)updateColor;
    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer;
@end

@interface RPScreenRecorder : NSObject
    +(id)sharedRecorder;
    -(BOOL)isRecording;
    -(void)startSystemRecordingWithMicrophoneEnabled:(BOOL)arg1 handler:(/*^block*/id)arg2 ;
    -(void)stopSystemRecording:(/*^block*/id)arg1 ;
@end

RPScreenRecorder *tapeman;
UITapGestureRecognizer *tapinger;