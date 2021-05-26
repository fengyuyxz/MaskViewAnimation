//
//  MoveCircleMaskController.m
//  MaskViewAnimation
//
//  Created by yanxuezhou on 2021/5/26.
//

#import "MoveCircleMaskController.h"
#import "CircleView.h"
@interface MoveCircleMaskController ()
@property (strong, nonatomic)  UIImageView *backView;
@property(nonatomic,strong) CircleView * maskView;

@end

@implementation MoveCircleMaskController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _backView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    _backView.image = [UIImage imageNamed:@"4-112"];
    
    _backView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:_backView];
    
    _maskView = [[CircleView alloc]initWithFrame:self.view.bounds];
    self.view.maskView = _maskView;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self animationStar];
}
-(void)animationStar{
    [self.maskView.layer removeAllAnimations];
    CGPoint center = _maskView.center;
    CAKeyframeAnimation *ani=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
//    ani.values=@[[NSValue valueWithCGPoint:CGPointMake(center.x-150, center.y-150)],[NSValue valueWithCGPoint:CGPointMake(center.x-150, center.y)],[NSValue valueWithCGPoint:CGPointMake(center.x, center.y-150)],[NSValue valueWithCGPoint:CGPointMake(center.x+50, center.y-150)],[NSValue valueWithCGPoint:CGPointMake(center.x+50, center.y+50)],[NSValue valueWithCGPoint:CGPointMake(center.x, center.y-150)]];
    ani.path = [self movePath].CGPath;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.duration = 4;
    ani.repeatDuration = INFINITY;
    [self.maskView.layer addAnimation:ani forKey:nil];
}
-(UIBezierPath *)movePath
{
    CGFloat radius = self.view.bounds.size.width*0.25;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint center = _maskView.center;
    [path moveToPoint:center];
    [path addLineToPoint:CGPointMake(center.x, center.y+radius)];
    [path addLineToPoint:CGPointMake(center.x+radius, center.y+radius)];
    [path addLineToPoint:CGPointMake(center.x+radius, center.y)];
    [path addLineToPoint:CGPointMake(center.x+radius, center.y-radius)];
    [path addLineToPoint:CGPointMake(center.x, center.y-radius)];
    [path addLineToPoint:CGPointMake(center.x-radius, center.y-radius)];
    [path addLineToPoint:center];
    return path;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
