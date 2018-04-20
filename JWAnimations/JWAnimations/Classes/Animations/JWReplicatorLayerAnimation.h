//
//  JWReplicatorLayerAnimation.h
//  JWAnimations
//
//  Created by sunjiawen on 2018/4/18.
//  Copyright © 2018年 sjw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JWReplicatorLayerType) {
    JWReplicatorLayerCircle,
    JWReplicatorLayerWave,
    JWReplicatorLayerTriangle,
    JWReplicatorLayerGrid,
    JWReplicatorLayerShake,
    JWReplicatorLayerRound,
    JWReplicatorLayerHeart,
    JWReplicatorLayerTurn,
    JWReplicatorLayerArrow,
};

@interface JWReplicatorLayerAnimation : NSObject

// 波纹
+ (CALayer *)replicatorLayer_Circle;

// 波纹
+ (CALayer *)replicatorLayer_Wave;

// 三角形
+ (CALayer *)replicatorLayer_Triangle;

// 网格
+ (CALayer *)replicatorLayer_Grid;

// 条形-声波
+ (CALayer *)replicatorLayer_Shake;

// 转圈
+ (CALayer *)replicatorLayer_Round;

// 心跳
+ (CALayer *)replicatorLayer_Heart;

// 箭头
+ (CALayer *)replicatorLayer_Arrow;
@end
