//
//  ViewController.m
//  MaskViewAnimation
//
//  Created by yanxuezhou on 2021/5/26.
//

#import "ViewController.h"
#import "CircleView.h"
@interface ViewController ()
@property (strong, nonatomic)  UIImageView *frontView;
@property (strong, nonatomic)  UIImageView *backView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    _backView.image = [UIImage imageNamed:@"4-112"];
    
    _backView.contentMode = UIViewContentModeScaleAspectFill;
    _frontView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    _frontView.contentMode = UIViewContentModeScaleAspectFill;
    _frontView.image = [UIImage imageNamed:@"4-113"];
    [self.view addSubview:_backView];
    [self.view addSubview:_frontView];
    [self circleMaskView];
//    [self butMaskView];
}
-(void)butMaskView{
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    [but setTitle:@"烂漫" forState:UIControlStateNormal];
    but.titleLabel.font = [UIFont systemFontOfSize:50];
    but.frame = CGRectMake(0, 200, 300, 400);
    self.frontView.maskView = but;
}
-(void)circleMaskView{
    CircleView *circleView = [[CircleView alloc]initWithFrame:self.view.bounds];
    //作为maskView的view的背景色必须是透明 不然mask无效
    circleView.backgroundColor = [UIColor clearColor];
    circleView.filleColor = [UIColor redColor];
    
    self.frontView.maskView = circleView;
}

@end

