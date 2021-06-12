#import "AirMan.h"

@implementation AirMan
    -(void)setup
    {   
        airman = [NSClassFromString(@"SBAirplaneModeController") sharedInstance];

        taper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        taper.numberOfTapsRequired = 1;
        [self addGestureRecognizer: taper];
        [self updateColor];

        for (UIImageView *vtr in self.subviews)
        {
            [vtr removeFromSuperview];
        }
        UIImageView *wifiImage = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview: wifiImage];
        [wifiImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/planeoff.png"]];
        
    }

    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer
    {
        if (tapRecognizer.state == UIGestureRecognizerStateEnded)
        {
            if (airman.isInAirplaneMode)
            {
                [airman setInAirplaneMode: NO];
            } else {
                [airman setInAirplaneMode: YES];
            }
        }

        [self updateColor];
    }

    -(void)updateColor
    {
        if (airman.inAirplaneMode)
        {
            for (UIImageView *vtr in self.subviews)
            {
                [vtr removeFromSuperview];
            }
            UIImageView *wifiImage = [[UIImageView alloc] initWithFrame:self.bounds];
            [self addSubview: wifiImage];

            [wifiImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/planeoff.png"]];
        } else {
            for (UIImageView *vtr in self.subviews)
            {
                [vtr removeFromSuperview];
            }
            UIImageView *wifiImage = [[UIImageView alloc] initWithFrame:self.bounds];
            [self addSubview: wifiImage];

            [wifiImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/planeon.png"]];
        }
    }
@end