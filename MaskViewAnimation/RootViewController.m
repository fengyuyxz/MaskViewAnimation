//
//  RootViewController.m
//  MaskViewAnimation
//
//  Created by yanxuezhou on 2021/5/26.
//

#import "RootViewController.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray<NSDictionary<NSString *,NSString *> *> * dataSouce;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    _dataSouce = @[@{@"圆窗双图":@"ViewController"},
                   @{@"渐变圆窗":@"GradientController"},
                   @{@"半透明渐变（直播聊天室顶部半透明过渡）":@"HalfAlitGradientController"},
                     @{@"移动圆窗":@"MoveCircleMaskController"}
    ];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSouce count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary *data = self.dataSouce[indexPath.row];
    cell.textLabel.text = [data.allKeys firstObject];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = self.dataSouce[indexPath.row];
    NSString *clazz = [[data allValues]firstObject];
    UIViewController *vc=[[NSClassFromString(clazz) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
