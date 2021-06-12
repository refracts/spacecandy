#import "BTManager.h"

@implementation BTManager
    -(void)setup
    {
        btoothManager = [NSClassFromString(@"BluetoothManager") sharedInstance];

        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer: tap];
        [self updateColor];
    }

    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer
    {
        if (tapRecognizer.state == UIGestureRecognizerStateEnded)
        {
            if (btoothManager.enabled)
            {
                [btoothManager setEnabled: NO];
                [btoothManager setPowered:NO];
            } else {
                [btoothManager setEnabled: YES];
                [btoothManager setPowered:YES];
            }
        }

        [self updateColor];
    }

    -(void)updateColor
    {
        if (btoothManager.enabled)
        {
            self.backgroundColor = UIColor.greenColor;
        } else {
            self.backgroundColor = UIColor.redColor;
        }
    }
@end