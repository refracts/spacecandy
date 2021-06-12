@interface AirMan : UIView
    -(void)setup;
    -(void)updateColor;
    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer;
@end

@interface SBAirplaneModeController : NSObject

    @property (nonatomic, assign, readwrite, getter=isInAirplaneMode) BOOL inAirplaneMode;

    +(id)sharedInstance;
    -(BOOL)isInAirplaneMode;
    -(void)setInAirplaneMode:(BOOL)arg1;
@end

SBAirplaneModeController *airman;

UITapGestureRecognizer *taper;
