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
        for (UIImageView *vtr in self.subviews)
        {
            [vtr removeFromSuperview];
        }
        UIImageView *wifiImage = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview: wifiImage];

        if (wifiman.wiFiEnabled)
        {
            [wifiImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/wifion.png"]];
        } else {
            [wifiImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/wifioff.png"]];
        }
    }
@end