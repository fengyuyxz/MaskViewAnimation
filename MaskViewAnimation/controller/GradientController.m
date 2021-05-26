//
//  GradientController.m
//  MaskViewAnimation
//
//  Created by yanxuezhou on 2021/5/26.
//

#import "GradientController.h"
#import "CircleView.h"
@interface GradientController ()
@property(nonatomic,strong) GradientView * frontView;
@property(nonatomic,strong) CircleView *circleView ;

@end

@implementation GradientController

- (void)viewDidLoad {
    [super viewDidLoad];
    _frontView = [[GradientView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_frontView];
    self.view.backgroundColor = [UIColor blueColor];
//    _circleView = [[CircleView alloc]initWithFrame:self.view.bounds];
//    _frontView.maskView = _circleView;
    [self butMaskView];
}
-(void)butMaskView{
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    [but setTitle:@"烂漫" forState:UIControlStateNormal];
    but.titleLabel.font = [UIFont systemFontOfSize:50];
    but.frame = CGRectMake(0, 200, 300, 400);
    self.frontView.maskView = but;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_frontView start];
}
@end

@implementation GradientView

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupView];
}
-(void)setupView{
    CAGradientLayer *layer=(CAGradientLayer *)self.layer;
    layer.colors = @[(__bridge id)UIColor.blackColor.CGColor,
                     (__bridge id)UIColor.blackColor.CGColor,
                     (__bridge id)UIColor.whiteColor.CGColor,
                     (__bridge id)UIColor.blackColor.CGColor,
                     (__bridge id)UIColor.blackColor.CGColor];
    layer.startPoint=CGPointMake(0, 0);
    layer.endPoint=CGPointMake(1, 0);
    layer.locations = @[@0, @0, @0.05, @0.1, @1];
}
+(Class)layerClass
{
    return [CAGradientLayer class];
}
-(void)start
{
    [self.layer removeAllAnimations];
    CABasicAnimation *an=[CABasicAnimation animationWithKeyPath:@"locations"];
    an.fromValue = @[@0, @0, @0.05, @0.1, @1];
    an.toValue = @[@0, @0.9, @0.95, @1, @1];
    an.duration = 1;
    an.repeatDuration = INFINITY;
    [self.layer addAnimation:an forKey:nil];
}
-(void)stop{
    [self.layer removeAllAnimations];
}
@end
