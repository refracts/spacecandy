@interface BTManager : UIView
    -(void)setup;
    -(void)updateColor;
    -(void)handleTap:(UITapGestureRecognizer *)tapRecognizer;
@end

@interface BluetoothManager
    +(id)sharedInstance;
    -(void)setEnabled:(BOOL)enabled;
    -(bool)enabled;
    -(void)setPowered:(BOOL)powered;
    -(bool)powered;
@end

BluetoothManager *btoothManager;
UITapGestureRecognizer *tap;
