//
//  CircleView.m
//  MaskViewAnimation
//
//  Created by yanxuezhou on 2021/5/26.
//

#import "CircleView.h"

@implementation CircleView


- (void)layoutSubviews{
    [super layoutSubviews];
    ((CAShapeLayer *)self.layer).path = [self circlePath].CGPath;
}

+(Class)layerClass
{
    return [CAShapeLayer class];
}
-(void)setFilleColor:(UIColor *)filleColor
{
    _filleColor = filleColor;
    ((CAShapeLayer *)self.layer).fillColor = _filleColor.CGColor;
}
-(UIBezierPath *)circlePath
{
    CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))*0.25;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.bounds)*0.5, CGRectGetHeight(self.bounds)*0.5) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    return path;
}

@end
