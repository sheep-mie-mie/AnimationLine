# AnimationLine
# -动画边框
=====
围绕视图完成动画__完成之后执行方法
=====
# UIBezierPath
- - (void)moveToPoint:(CGPoint)point
- - (void)addLineToPoint:(CGPoint)point
- - (void)closePath
- 多个点+闭合 构建一个几何图形
# CAShapeLayer

# CABasicAnimation 动画
- duration 持续时间
- timingFunction 运行状态
- + (instancetype)animationWithKeyPath:(nullable NSString *)path
- path == @"strokeEnd" / NSStringFromSelector(@selector(strokeEnd)) 注意这一点 否则动画不执行
- strokeEnd strokeStart

- 遵守 CAAnimationDelegate 协议 动画结束之后可执行一下方法
- - (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag; 
