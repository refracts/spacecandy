#import "TapeRecorder.h"

@implementation TapeRecorder
    -(void)setup
    {   
        tapeman = [NSClassFromString(@"RPScreenRecorder") sharedRecorder];
        tapinger = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tapinger.numberOfTapsRequired = 1;
        [self addGestureRecognizer: tapinger];

        [self updateColor];
    }

    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer
    {
        if (tapRecognizer.state == UIGestureRecognizerStateEnded)
        {
            if (tapeman.isRecording)
            {
                [tapeman stopSystemRecording: NULL];
            } else {
                [tapeman startSystemRecordingWithMicrophoneEnabled: NO handler:NULL];
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

        if (tapeman.isRecording)
        {
            [wifiImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/recording.png"]];
        } else {
            [wifiImage setImage: [UIImage imageWithContentsOfFile:@"/Library/Application Support/SpaceCandy/primed.png"]];
        }
    }
@end