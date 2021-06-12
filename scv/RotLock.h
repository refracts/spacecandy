@interface RotLock : UIView
    -(void)setup;
    -(void)updateColor;
    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer;
@end


@interface SBOrientationLockManager	: NSObject
    +(instancetype)sharedInstance;
    -(BOOL)isUserLocked;
    -(void)lock;
    -(void)unlock;
@end

SBOrientationLockManager *orientationManager;

UITapGestureRecognizer *taps;