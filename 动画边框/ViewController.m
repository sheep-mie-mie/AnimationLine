//
//  ViewController.m
//  动画边框
//
//  Created by ifly on 2017/3/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// 哈哈哈 测试提交代码
    
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(40, 340, 300, 240)];
    [self.view addSubview:backView];
    backView.backgroundColor = [UIColor greenColor];
    
    UIBezierPath *lineBezierPath = [UIBezierPath bezierPath];
    [lineBezierPath moveToPoint:CGPointMake(0, 0)];
    [lineBezierPath addLineToPoint:CGPointMake(backView.frame.size.width, 0)];
    [lineBezierPath addLineToPoint:CGPointMake(backView.frame.size.width, backView.frame.size.height)];
    [lineBezierPath addLineToPoint:CGPointMake(0, backView.frame.size.height)];
    [lineBezierPath closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = backView.bounds;
    layer.path = lineBezierPath.CGPath;
    //layer.position = backView.center;
    layer.fillColor = [UIColor grayColor].CGColor;
    layer.lineWidth   = 4.f;
    layer.strokeColor = [UIColor redColor].CGColor;
   
    //添加动画
    CABasicAnimation *basicAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAniamtion.duration = 10.f;
    basicAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    basicAniamtion.fromValue = [NSNumber numberWithFloat:0.f];
    basicAniamtion.toValue   = [NSNumber numberWithFloat:1.f];
    basicAniamtion.fillMode  = kCAFillModeForwards;
    basicAniamtion.removedOnCompletion = NO;
    [layer addAnimation:basicAniamtion forKey:@"strokeEnd"];
    [backView.layer addSublayer:layer];

    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(40, 40)];
    [path addLineToPoint:CGPointMake(240, 40)];
    [path addLineToPoint:CGPointMake(240, 200)];
    [path addLineToPoint:CGPointMake(40, 200)];
    [path closePath];
    
  
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    //    shaperLayer.frame = CGRectMake(30, 100, 300, 20);
    //    shaperLayer.backgroundColor = [UIColor yellowColor].CGColor;
    shaperLayer.fillColor = [UIColor blueColor].CGColor;
    shaperLayer.lineWidth = 5.f;
    shaperLayer.path = path.CGPath;
    shaperLayer.strokeColor = [UIColor redColor].CGColor;
    //[UIView setAnimationDidStopSelector:@selector(strokeEnd)];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    anim.fromValue = @0;
    anim.toValue = @1;
    anim.duration = 10;
    anim.delegate = self;
    [shaperLayer addAnimation:anim forKey:NSStringFromSelector(@selector(strokeEnd))];
    [self.view.layer addSublayer:shaperLayer];
    
}

//协议方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
     NSLog(@"我跑完了");
    
}

//uiview方法

+ (void)setAnimationDidStopSelector:(SEL)selector {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
