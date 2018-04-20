//
//  JWReplicatorLayerAnimation.m
//  JWAnimations
//
//  Created by Jarvan on 2018/4/18.
//  Copyright © 2018年 Jarvan. All rights reserved.
//

#import "JWReplicatorLayerAnimation.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation JWReplicatorLayerAnimation

// 波纹
+ (CALayer *)replicatorLayer_Circle {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 80, 80);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 80, 80)].CGPath;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    shapeLayer.opacity = 0;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = ({
        CABasicAnimation *alphaAnimation = [CABasicAnimation animation];
        alphaAnimation.keyPath = @"opacity";
        alphaAnimation.fromValue = @(1);
        alphaAnimation.toValue = @(0);
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
        scaleAnimation.keyPath = @"transform";
        scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0, 0, 1)];
        scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 1)];
        
        @[alphaAnimation, scaleAnimation];
    });
    
    animationGroup.duration = 5;
    animationGroup.repeatCount = HUGE;
    [shapeLayer addAnimation:animationGroup forKey:@"circle_animation"];
    
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc]init];
    replicatorLayer.frame = CGRectMake(0, 0, 80, 80);
    replicatorLayer.instanceDelay = 1;
    replicatorLayer.instanceCount = 5;
    [replicatorLayer addSublayer:shapeLayer];
    
    
    return replicatorLayer;
}

// 波浪
+ (CALayer *)replicatorLayer_Wave {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 50)].CGPath;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    shapeLayer.frame = CGRectMake(0, 0, 50, 50);
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
    scaleAnimation.keyPath = @"transform";
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 1)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.5, 0.5, 1)];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = HUGE;
    scaleAnimation.duration = 0.5;
    [shapeLayer addAnimation:scaleAnimation forKey:@"wave_animation"];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = 3;
    replicatorLayer.instanceDelay = 0.1;
//    // 设置复制层的背景色，如果原始层设置了背景色，这里设置就失去效果
//    replicatorLayer.instanceColor = [UIColor greenColor].CGColor;
//    // 设置复制层颜色的偏移量
//    replicatorLayer.instanceGreenOffset = -0.1;

    CATransform3D transform = CATransform3DTranslate(CATransform3DIdentity, 60, 0, 0);
    transform = CATransform3DScale(transform, 0.8, 0.8, 1);
    
    replicatorLayer.instanceTransform = transform;
    [replicatorLayer addSublayer:shapeLayer];
    replicatorLayer.frame = CGRectMake(0, 0, 50 * 3 + 10, 50);
    return replicatorLayer;
    
}

// 三角形
+ (CALayer *)replicatorLayer_Triangle {
    CGFloat r = 50;
    CGFloat tranX = 150;
    CGFloat replicatorLayerWidthAndHeight = 100;
    
    // 渐变色层
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, r, r)].CGPath;
    maskLayer.fillColor = [UIColor orangeColor].CGColor;
    maskLayer.frame = CGRectMake(0, 0, replicatorLayerWidthAndHeight/2.0, replicatorLayerWidthAndHeight/2.0);
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, r, r);
    gradientLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor purpleColor].CGColor, (__bridge id)[UIColor redColor].CGColor];
    gradientLayer.locations = @[@(0.0),@(0.2),@(0.8)];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    gradientLayer.mask = maskLayer;
    gradientLayer.position = CGPointMake(50, 50);
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(100, 0, replicatorLayerWidthAndHeight, replicatorLayerWidthAndHeight);
    replicatorLayer.instanceCount = 3;
    replicatorLayer.instanceDelay = 0.0;
    replicatorLayer.backgroundColor = [UIColor blackColor].CGColor;
    CATransform3D trans3D = CATransform3DTranslate(CATransform3DIdentity, tranX, 0, 0);
    trans3D = CATransform3DRotate(trans3D, 120.0 * M_PI/180.0, 0.0, 0.0, 1.0);
    replicatorLayer.instanceTransform = trans3D;
    [replicatorLayer addSublayer:gradientLayer];

    // 添加动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform";
    CATransform3D toValue = CATransform3DTranslate(CATransform3DIdentity, tranX, 0.0, 0.0);
    toValue = CATransform3DRotate(toValue,120.0 * M_PI/180.0, 0.0, 0.0, 1.0);
    animation.toValue = [NSValue valueWithCATransform3D:toValue];
    animation.repeatCount = HUGE;
    animation.duration = 1;
    [gradientLayer addAnimation:animation forKey:@"Triangle_animation"];
    
    return replicatorLayer;
}

// 网格
+ (CALayer *)replicatorLayer_Grid {
    CGFloat layerWidth = 50;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, layerWidth, layerWidth);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, layerWidth, layerWidth)].CGPath;
    shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    shapeLayer.fillColor = [UIColor purpleColor].CGColor;
    
    CAReplicatorLayer *replicatorLayerH = [CAReplicatorLayer layer];
    replicatorLayerH.instanceCount = 3;
    replicatorLayerH.instanceDelay = 0.1;
    replicatorLayerH.instanceTransform = CATransform3DTranslate(CATransform3DIdentity, layerWidth + 10, 0, 0);
    [replicatorLayerH addSublayer:shapeLayer];
    
    CAReplicatorLayer *replicatorLayerV = [CAReplicatorLayer layer];
    replicatorLayerV.instanceCount = 3;
    replicatorLayerV.instanceDelay = 0.1;
    replicatorLayerV.instanceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, layerWidth + 10, 0);
    [replicatorLayerV addSublayer:replicatorLayerH];
    

    // 添加动画
    CAAnimationGroup *groupAnimation = ({
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
        scaleAnimation.keyPath = @"transform";
        scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.1, 0.1, 1)];
        
        CABasicAnimation *alphaAnimation = [CABasicAnimation animation];
        alphaAnimation.keyPath = @"opacity";
        alphaAnimation.toValue = @(0);
        
        CAAnimationGroup *animation = [CAAnimationGroup animation];
        animation.animations = @[scaleAnimation,alphaAnimation];
        animation.autoreverses = YES;
        animation.repeatCount = HUGE;
        animation.duration = 1;
        
        animation;
    });
    [shapeLayer addAnimation:groupAnimation forKey:@"grid_animation_group"];
    return replicatorLayerV;
}

// 条形
+ (CALayer *)replicatorLayer_Shake {
    CGFloat slayerWidth = 15;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(0, 0)];
    
    CAShapeLayer *slayer = [CAShapeLayer layer];
    slayer.frame = CGRectMake(0, 0, slayerWidth, 100);
    slayer.path = path.CGPath;
    slayer.strokeColor = [UIColor redColor].CGColor;
    slayer.lineWidth = slayerWidth;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = 6;
    replicatorLayer.instanceDelay = 0.05;
    replicatorLayer.instanceTransform = CATransform3DTranslate(CATransform3DIdentity, slayerWidth + 12, 0, 0);
    [replicatorLayer addSublayer:slayer];
    
    // 添加动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.autoreverses = YES;
    animation.keyPath = @"strokeEnd";
    animation.fromValue = @(1.0);
    animation.toValue = @(0.2);
    animation.duration = 0.3;
    animation.repeatCount = HUGE;
    [slayer addAnimation:animation forKey:@"animation_Shake"];
    
    return replicatorLayer;
}

// 转圈
+ (CALayer *)replicatorLayer_Round {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 50, 50);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 50)].CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    CGFloat instanceCount = 10.0;
    CGFloat animationDuration = 1.0;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = instanceCount;
    replicatorLayer.instanceDelay = animationDuration/instanceCount;
    replicatorLayer.instanceAlphaOffset = -0.1;
    replicatorLayer.instanceTransform = CATransform3DRotate(CATransform3DIdentity, 2.0 * M_PI / instanceCount, 0, 0, 1);
    [replicatorLayer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform";
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 1)];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.1, 0.1, 1)];
    animation.duration = animationDuration;
    animation.repeatCount = HUGE;
    [shapeLayer addAnimation:animation forKey:nil];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//
//
//    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
//    keyframeAnimation.path = path.CGPath;
//    keyframeAnimation.duration = animationDuration;
//    keyframeAnimation.repeatCount = HUGE;
//    keyframeAnimation.keyPath = @"position";
//    [shapeLayer addAnimation:keyframeAnimation forKey:nil];
    
    return replicatorLayer;
    
}

//// 心跳
//+ (CALayer *)replicatorLayer_Heart {
//    
//}

// 箭头
+ (CALayer *)replicatorLayer_Arrow {
    CGFloat radius = 50;
    CGFloat arcDegress = 140.0;
    CGFloat tDegress = (180.0 - arcDegress)/2.0;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 5;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineCap = kCALineCapRound;
    
    CGFloat arrowLength = 10.0f;
    CGFloat arrowDegrees = 70.0;
    
    CGPoint arrowBeginPoint = CGPointMake(radius - cos(DEGREES_TO_RADIANS(tDegress)) * radius, radius - sin(DEGREES_TO_RADIANS(tDegress)) * radius);
    
    CGFloat downArrowDegress = 90.0 - tDegress - arrowDegrees/2.0;
    CGFloat upArrowDegress = 180.0 - arrowDegrees - downArrowDegress;
    
    CGPoint arrowEndPointDown = CGPointMake(arrowBeginPoint.x + cos(DEGREES_TO_RADIANS(downArrowDegress)) * arrowLength , arrowBeginPoint.y - sin(DEGREES_TO_RADIANS(downArrowDegress) * arrowLength));
    CGPoint arrowEndPointUp = CGPointMake(arrowBeginPoint.x - cos(DEGREES_TO_RADIANS(upArrowDegress)) * arrowLength, arrowBeginPoint.y - sin(DEGREES_TO_RADIANS(upArrowDegress)) * arrowLength);
    
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:DEGREES_TO_RADIANS(-tDegress)  endAngle:DEGREES_TO_RADIANS(-(180 - tDegress)) clockwise:NO];
    [arcPath moveToPoint:arrowBeginPoint];
    [arcPath addLineToPoint:arrowEndPointDown];
    [arcPath moveToPoint:arrowBeginPoint];
    [arcPath addLineToPoint:arrowEndPointUp];
    shapeLayer.path = arcPath.CGPath;
    
    
    CGFloat animationArrowDownDregress = upArrowDegress;
    CGFloat animationArrowUpDregress = downArrowDegress;
    CGPoint animationArrowPointDown = CGPointMake(arrowBeginPoint.x + cos(DEGREES_TO_RADIANS(animationArrowDownDregress)) * arrowLength, arrowBeginPoint.y + sin(DEGREES_TO_RADIANS(animationArrowDownDregress)) * arrowLength);
    CGPoint animationArrowPointUp = CGPointMake(arrowBeginPoint.x - cos(DEGREES_TO_RADIANS(animationArrowUpDregress)) * arrowLength, arrowBeginPoint.y + sin(DEGREES_TO_RADIANS(animationArrowUpDregress)) * arrowLength);
    
    UIBezierPath *animationPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:DEGREES_TO_RADIANS(-tDegress)  endAngle:DEGREES_TO_RADIANS(-(180 - tDegress)) clockwise:NO];
    [animationPath moveToPoint:arrowBeginPoint];
    [animationPath addLineToPoint:animationArrowPointDown];
    [animationPath moveToPoint:arrowBeginPoint];
    [animationPath addLineToPoint:animationArrowPointUp];
    
    // 动画
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    keyframeAnimation.values = @[(__bridge id)arcPath.CGPath,(__bridge id)animationPath.CGPath,(__bridge id)arcPath.CGPath,(__bridge id)animationPath.CGPath];
    keyframeAnimation.keyTimes = @[@(0.45),@.75,@.85,@.95];
    keyframeAnimation.autoreverses = YES;
    keyframeAnimation.duration = 1;
    keyframeAnimation.repeatCount = HUGE;
    [shapeLayer addAnimation:keyframeAnimation forKey:nil];
    

    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = 2;
    replicatorLayer.instanceTransform = CATransform3DRotate(CATransform3DIdentity, M_PI, 0, 0, 1);
    replicatorLayer.instanceDelay = 0.0;
    replicatorLayer.frame = CGRectMake(100, 100, radius * 2, radius * 2);
    [replicatorLayer addSublayer:shapeLayer];
    
    CABasicAnimation *baseAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    baseAni.fromValue = @(M_PI * 2);
    baseAni.toValue = @(0);
    baseAni.duration = 2;
    baseAni.repeatCount = NSIntegerMax;
    baseAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [replicatorLayer addAnimation:baseAni forKey:nil];
    
    return replicatorLayer;
    
}















@end
