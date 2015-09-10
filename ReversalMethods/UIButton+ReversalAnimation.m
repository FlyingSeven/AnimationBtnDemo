//
//  UIButton+ReversalAnimation.m
//  AnimationBtnDemo
//
//  Created by Seven on 7/29/15.
//  Copyright (c) 2015 Seven. All rights reserved.
//

#import "UIButton+ReversalAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>


static const void *ReversalAnimationKey = &ReversalAnimationKey;

@implementation UIButton (ReversalAnimation)

@dynamic changeImgBlock;


- (void)reversalBtnWithDuration:(CGFloat)duration
{
    CAKeyframeAnimation *reversalAnimation = [CAKeyframeAnimation animation];
    reversalAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 4, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 2, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0,1,0)]];
    reversalAnimation.cumulative = YES;
    reversalAnimation.duration = duration;
    reversalAnimation.removedOnCompletion = YES;
    reversalAnimation.delegate = self;
    
    [self.layer addAnimation:reversalAnimation forKey:@"transform"];
    

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        if (self.changeImgBlock) {
            self.changeImgBlock();
        }
    }
}

- (void)changeTheImgWithBlock:(ChangeBtnImgBlock)block
{
    self.changeImgBlock = block;
}

// runtime 关联方法
- (ChangeBtnImgBlock)changeImgBlock
{
    return objc_getAssociatedObject(self, ReversalAnimationKey);
}

- (void)setChangeImgBlock:(ChangeBtnImgBlock)changeImgBlock
{
    objc_setAssociatedObject(self, ReversalAnimationKey, changeImgBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



@end
