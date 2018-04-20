//
//  JWAnimationViewController.m
//  JWAnimations
//
//  Created by sunjiawen on 2018/4/18.
//  Copyright © 2018年 sjw. All rights reserved.
//

#import "JWAnimationViewController.h"

@interface JWAnimationViewController ()

@end

@implementation JWAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}

- (void)setReplicatorLayerType:(JWReplicatorLayerType)replicatorLayerType {
    UIView *animationView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 300)];
    animationView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:animationView];
    
    switch (replicatorLayerType) {
        case JWReplicatorLayerCircle:
            [animationView.layer addSublayer:[JWReplicatorLayerAnimation replicatorLayer_Circle]];
            break;
        case JWReplicatorLayerWave:
            [animationView.layer addSublayer:[JWReplicatorLayerAnimation replicatorLayer_Wave]];
            break;
            
        case JWReplicatorLayerTriangle:
            [animationView.layer addSublayer:[JWReplicatorLayerAnimation replicatorLayer_Triangle]];

            break;
        case JWReplicatorLayerGrid:{
            CALayer *rLayer = [JWReplicatorLayerAnimation replicatorLayer_Grid];
            rLayer.frame = CGRectMake(CGRectGetWidth(animationView.frame)/2.0 - 50, CGRectGetHeight(animationView.frame)/2.0 - 50, 100, 100);
            rLayer.backgroundColor = [UIColor clearColor].CGColor;
            rLayer.anchorPoint = CGPointMake(1, 1);
            [animationView.layer addSublayer:rLayer];
        }
            break;
            
        case JWReplicatorLayerShake:
        {
            CALayer *rLayer = [JWReplicatorLayerAnimation replicatorLayer_Shake];
            rLayer.frame = CGRectMake(CGRectGetWidth(animationView.frame)/2.0 - 50, CGRectGetHeight(animationView.frame)/2.0 - 50, 100, 100);
            rLayer.backgroundColor = [UIColor clearColor].CGColor;
            rLayer.anchorPoint = CGPointMake(1, 1);
            [animationView.layer addSublayer:rLayer];
        }
            break;
        case JWReplicatorLayerRound:{
            CALayer *rLayer = [JWReplicatorLayerAnimation replicatorLayer_Round];
            rLayer.frame = CGRectMake(CGRectGetWidth(animationView.frame)/2.0 - 100, CGRectGetHeight(animationView.frame)/2.0 - 100, 200, 200);
            
            [animationView.layer addSublayer:rLayer];
        }
            break;
        case JWReplicatorLayerHeart:
            
            break;
        case JWReplicatorLayerTurn:
            
            break;
        case JWReplicatorLayerArrow:
            [animationView.layer addSublayer:[JWReplicatorLayerAnimation replicatorLayer_Arrow]];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
