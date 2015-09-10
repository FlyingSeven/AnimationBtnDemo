//
//  UIView+ReversalAnimation.m
//  AnimationBtnDemo
//
//  Created by Seven on 7/29/15.
//  Copyright (c) 2015 Seven. All rights reserved.
//

#import "UIView+ReversalAnimation.h"
#import <QuartzCore/QuartzCore.h>


@implementation UIView (ReversalAnimation)

- (void)reversalsBtnWithDuration:(CGFloat)aDuration
{
    CAKeyframeAnimation *reversalAnimation = [CAKeyframeAnimation animation];
    reversalAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 4, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 2, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0,1,0)]];

    reversalAnimation.cumulative = YES;
    reversalAnimation.duration = aDuration;
    reversalAnimation.repeatCount = 1;
    reversalAnimation.removedOnCompletion = YES;
    
    [self.layer addAnimation:reversalAnimation forKey:@"transform"];
}

- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount timingMode:(enum i7Rotate360TimingMode)aMode {
    CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
    theAnimation.values = [NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 4, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 2, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0,1,0)],
                           nil];
    theAnimation.cumulative =
    YES;
    theAnimation.duration = aDuration;
    theAnimation.repeatCount = aRepeatCount;
    theAnimation.removedOnCompletion = YES;
    
//    if(aMode == i7Rotate360TimingModeEaseInEaseOut)
//    {
//        theAnimation.timingFunctions =
//        [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
//									
//         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//         nil
//         ];
//    }
    [self.layer addAnimation:theAnimation forKey:@"transform"];
}



@end
