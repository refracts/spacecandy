#import "WifiButton.h"

@implementation WifiButton
    -(void)setup
    {   
        wifiman = [NSClassFromString(@"SBWiFiManager") sharedInstance];

        theTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        theTapRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer: theTapRecognizer];
        [self updateColor];
    }

    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer
    {
        if (tapRecognizer.state == UIGestureRecognizerStateEnded)
        {
            if (wifiman.wiFiEnabled)
            {
                [wifiman setWiFiEnabled: NO];
            } else {
                [wifiman setWiFiEnabled: YES];
            }
        }

        [self updateColor];
    }

    -(void)updateColor
    {
        if (wifiman.wiFiEnabled)
        {
            self.backgroundColor = UIColor.greenColor;
        } else {
            self.backgroundColor = UIColor.redColor;
        }
    }
@end