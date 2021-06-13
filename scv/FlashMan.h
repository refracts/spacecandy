@interface FlashMan : UIView
    -(void)setup;
    -(void)updateColor;
    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer;
@end


@interface SBUIFlashlightController : NSObject
    +(id)sharedInstance;

    -(void)turnFlashlightOnForReason:(id)arg1;
    -(void)turnFlashlightOffForReason:(id)arg1;
    -(void)setLevel:(NSUInteger)arg1;
    -(unsigned long long)level;
@end

SBUIFlashlightController *flc;

UITapGestureRecognizer *taping;