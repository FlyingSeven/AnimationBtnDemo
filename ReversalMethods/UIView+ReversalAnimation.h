//
//  UIView+ReversalAnimation.h
//  AnimationBtnDemo
//
//  Created by Seven on 7/29/15.
//  Copyright (c) 2015 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

enum i7Rotate360TimingMode {
    i7Rotate360TimingModeEaseInEaseOut,
    i7Rotate360TimingModeLinear
};

@interface UIView (ReversalAnimation)
- (void)reversalsBtnWithDuration:(CGFloat)duration;
- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount timingMode:(enum i7Rotate360TimingMode)aMode ;


@end
