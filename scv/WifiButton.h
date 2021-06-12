@interface WifiButton : UIView
    -(void)setup;
    -(void)updateColor;
    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer;
@end

@interface SBWiFiManager : NSObject
    +(id)sharedInstance;
    -(void)setWiFiEnabled:(BOOL)enabled;
    -(bool)wiFiEnabled;
@end

SBWiFiManager *wifiman;
UITapGestureRecognizer *theTapRecognizer;