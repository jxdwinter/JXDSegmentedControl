//
//  JXDSegmentedControl.m
//  JXDSegmentedControl
//
//  Created by JiangXiaodong on 3/24/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "JXDSegmentedControl.h"


#define IS_IOS_7 ( [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0 ? YES : NO )

@implementation JXDSegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSInteger previousSelectedSegmentIndex = self.selectedSegmentIndex;
    [super touchesBegan:touches withEvent:event];
    if (!IS_IOS_7) {
        if (previousSelectedSegmentIndex == self.selectedSegmentIndex) {
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSInteger previousSelectedSegmentIndex = self.selectedSegmentIndex;
    [super touchesEnded:touches withEvent:event];
    if (IS_IOS_7) {
        if (previousSelectedSegmentIndex == self.selectedSegmentIndex) {
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
}

@end
