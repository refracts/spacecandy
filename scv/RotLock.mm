#import "RotLock.h"

@implementation RotLock
    -(void)setup
    {   
        orientationManager = [NSClassFromString(@"SBOrientationLockManager") sharedInstance];

        taps = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        taps.numberOfTapsRequired = 1;
        [self addGestureRecognizer: taps];
        [self updateColor];
    }

    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer
    {
        if (tapRecognizer.state == UIGestureRecognizerStateEnded)
        {
            if ([orientationManager isUserLocked])
            {
                [orientationManager unlock];
            } else {
                [orientationManager lock];
            }
        }

        [self updateColor];
    }

    -(void)updateColor
    {
        if ([orientationManager isUserLocked])
        {
            self.backgroundColor = UIColor.greenColor;
        } else {
            self.backgroundColor = UIColor.redColor;
        }
    }
@end