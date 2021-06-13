#import "SpaceBackground.h"
#import "BTManager.h"
#import "WifiButton.h"
#import "AirMan.h"
#import "RotLock.h"
#import "FlashMan.h"
#import "TapeRecorder.h"

@implementation SpaceBackground

-(void)setup
{
    //Gradient
    CALayer *layer = self.layer;
    layer.masksToBounds = YES;
    UIColor *blackcolor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 0.00];
    UIColor *transcolor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 0.50];
    shineLayer = [CAGradientLayer layer];
    shineLayer.frame = layer.bounds;
    shineLayer.colors = @[(id)blackcolor.CGColor, (id)transcolor.CGColor];
    shineLayer.locations = @[[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:0.5f]];
    [self.layer insertSublayer:shineLayer atIndex:0];

    //Blur
    UIVisualEffect *visualEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *vfv = [[UIVisualEffectView alloc] initWithEffect:visualEffect];
    vfv.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:vfv];
    
    [vfv.widthAnchor constraintEqualToConstant:self.bounds.size.width].active = YES;
    [vfv.heightAnchor constraintEqualToConstant:self.bounds.size.height/2].active = YES;
    [vfv.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [vfv.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;

    for (_UIVisualEffectBackdropView *vtr in vfv.subviews) {
        vtr.backgroundColor = UIColor.clearColor;
    }

    
    BTManager *bt = [[BTManager alloc] initWithFrame: CGRectMake(0,0,100,100)];
    [vfv.contentView addSubview:bt];
    [bt setup];

    WifiButton *wf = [[WifiButton alloc] initWithFrame: CGRectMake(0,100,100,100)];
    [vfv.contentView addSubview:wf];
    [wf setup];

    RotLock *rl = [[RotLock alloc] initWithFrame: CGRectMake(100,0,100,100)];
    [vfv.contentView addSubview:rl];
    [rl setup];

    AirMan *am = [[AirMan alloc] initWithFrame: CGRectMake(100,100,100,100)];
    [vfv.contentView addSubview:am];
    [am setup];

    FlashMan *fm = [[FlashMan alloc] initWithFrame: CGRectMake(0,200,100,100)];
    [vfv.contentView addSubview:fm];
    [fm setup];

    TapeRecorder *tr = [[TapeRecorder alloc] initWithFrame: CGRectMake(100,200,100,100)];
    [vfv.contentView addSubview:tr];
    [tr setup];
}

@end