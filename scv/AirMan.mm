#import "AirMan.h"

@implementation AirMan
    -(void)setup
    {   
        airman = [NSClassFromString(@"SBAirplaneModeController ") sharedInstance];

        taper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        taper.numberOfTapsRequired = 1;
        [self addGestureRecognizer: taper];
        [self updateColor];
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
        if (airman.isInAirplaneMode)
        {
            self.backgroundColor = UIColor.greenColor;
        } else {
            self.backgroundColor = UIColor.redColor;
        }
    }
@end