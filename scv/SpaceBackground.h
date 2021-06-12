#import <UIKit/UIKit.h>


@interface SpaceBackground : UIView
    -(void)setup;
@end

@interface UIApplication (openlistener)
    +(id)sharedApplication;
    -(BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end

@interface _UIVisualEffectBackdropView : UIView
@end

CAGradientLayer *shineLayer;