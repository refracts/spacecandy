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
        for (UIImageView *vtr in self.subviews)
        {
            [vtr removeFromSuperview];
        }
        UIImageView *rotImage = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview: rotImage];

        if (orientationManager.isUserLocked)
        {
            [rotImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/lockon.png"]];
        } else {
            [rotImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/lockoff.png"]];
        }
    }
@end