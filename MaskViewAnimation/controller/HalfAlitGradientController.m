//
//  HalfAlitGradientController.m
//  MaskViewAnimation
//
//  Created by yanxuezhou on 2021/5/26.
//

#import "HalfAlitGradientController.h"

@interface HalfAlitGradientController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)  UIImageView *backView;

@property(nonatomic,strong) UIView * tableViewContainer;
@property(nonatomic,strong) UITableView * tableView;


@end

@implementation HalfAlitGradientController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    _backView.image = [UIImage imageNamed:@"4-112"];
    
    _backView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_backView];
    CGSize size = self.view.bounds.size;
    _tableViewContainer =[[UIView alloc]initWithFrame:CGRectMake(0, size.height*0.5, size.width*0.5, size.height*0.5)];
    [self.view addSubview:_tableViewContainer];
    _tableView = [[UITableView alloc]initWithFrame:_tableViewContainer.bounds style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor clearColor];
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [_tableViewContainer addSubview:_tableView];
    HalfAlightGradientView *mskView = [[HalfAlightGradientView alloc]initWithFrame:_tableViewContainer.bounds];
    mskView.colors = @[(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0].CGColor,
                       (__bridge id)[UIColor whiteColor].CGColor,
                       (__bridge id)[UIColor whiteColor].CGColor,
                       (__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0].CGColor
    ];
    mskView.startPoint = CGPointMake(0, 0);
    mskView.endPoint = CGPointMake(0, 1);
    // locatons 必须和colors数据对应的上
    mskView.locations = @[@0,@0.2,@0.7,@1];
    _tableViewContainer.maskView =mskView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor= [UIColor clearColor];
    cell.textLabel.text = @"xxxxlsfsdfsfdsffsfsdf \ns fsdfsdfsddfdf";
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.numberOfLines=0;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
@end
@implementation HalfAlightGradientView

+(Class)layerClass
{
    return [CAGradientLayer class];
}
- (void)setColors:(NSArray *)colors
{
    _colors = colors;
    CAGradientLayer *layer=(CAGradientLayer *)self.layer;
    layer.colors = colors;
}
-(void)setLocations:(NSArray *)locations{
    _locations = locations;
    CAGradientLayer *layer=(CAGradientLayer *)self.layer;
    layer.locations=_locations;
}
- (void)setStartPoint:(CGPoint)startPoint{
    _startPoint = startPoint;
    CAGradientLayer *layer=(CAGradientLayer *)self.layer;
    layer.startPoint = _startPoint;
}
- (void)setEndPoint:(CGPoint)endPoint{
    _endPoint = endPoint;
    CAGradientLayer *layer=(CAGradientLayer *)self.layer;
    layer.endPoint = endPoint;
}
@end
