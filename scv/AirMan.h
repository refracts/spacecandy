@interface AirMan : UIView
    -(void)setup;
    -(void)updateColor;
    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer;
@end

@interface SBAirplaneModeController : NSObject
    +(id)sharedInstance;
    -(BOOL)isInAirplaneMode;
    -(void)setInAirplaneMode:(BOOL)arg1;
@end

SBAirplaneModeController *airman;

UITapGestureRecognizer *taper;