#import "Tweak.h"

//Remove modules

%hook CCUIModuleCollectionView
	-(void)layoutSubviews 
	{
		[self removeFromSuperview];
	}
%end

%hook MTMaterialView
	-(void)layoutSubviews 
	{
		if ([self.superview.superview isKindOfClass:[UIWindow class]])
		{
			[self removeFromSuperview];
		}
	}
%end

%hook CCUIHeaderPocketView
	-(void)layoutSubviews
	{
		self.hidden = YES;
	}
%end

%hook CCUIScrollView
	-(void)layoutSubviews 
	{
		for (SpaceBackground *sbg in self.subviews)
		{
			[sbg removeFromSuperview];
		}
				
		SpaceBackground *spaceBackground = [[SpaceBackground alloc] initWithFrame:self.bounds];
		[self addSubview: spaceBackground];
		[spaceBackground setup];

	}
%end

