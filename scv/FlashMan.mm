#import "FlashMan.h"

@implementation FlashMan
    -(void)setup
    {   
        flc = [NSClassFromString(@"SBUIFlashlightController") sharedInstance];

        taping = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        taping.numberOfTapsRequired = 1;
        [self addGestureRecognizer: taping];
        [self updateColor];
    }

    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer
    {
        if (tapRecognizer.state == UIGestureRecognizerStateEnded)
        {
            if (flc.level == 3)
            {
                [flc setLevel: 0];
            } else {
                [flc setLevel: 3];
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

        if (flc.level == 3)
        {
            [rotImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/flashon.png"]];
        } else {
            [rotImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/flashoff.png"]];
        }
    }
@end