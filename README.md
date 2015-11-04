简单的视图反转动画
===

主要用的是iOS的核心动画－__CAKeyframeAnimation__ 
---
### 首先，跟CABasicAnimation相比，前者只能从一个数值（fromValue）变到另一个数值（toValue）,而CAKeyframeAnimation会使用一个数组来保存这些数值。  
###-属性解析  
####-values: 就是上述的NSArray对象。里面的元素称为“关键帧”（keyframe）。动画对象会在指定的时间（duration）内，依次显示values数组中的每一个关键帧  
####-path: 可以设置一个CGPathRef/CGMutablePathRef,让层跟着路径移动。path只对CALayer的anchorPoint和position起作用，如果你设置了path，那么values将被忽略  
####-keyTimes: 可以为对应的关键帧指定对应的时间点，其取值范围为0到1.0，keyTimes中的每一个时间值都对应values中的每一帧。当keyTimes没有设置的时候，各个关键帧的时间是平分的  
####-说明：CABasicAnimation可看做是最多只有2个关键帧的CAKeyframeAnimation  
####-Values方式:
	 CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];  
	 animation.keyPath = @"transform";  
	 reversalAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 4, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 2, 0,1,0)],
                                 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0,1,0)]];  
                                 reversalAnimation.cumulative = YES;
    animation.duration = duration;
    animation.removedOnCompletion = YES;
    animation.delegate = self;  
    [self.layer addAnimation:reversalAnimation forKey:nil];  
      
*`注:`* `本文为markdown语法练习所写`，文章大部分内容摘自[该文章](http://www.tuicool.com/articles/jeYfIv)
	 


