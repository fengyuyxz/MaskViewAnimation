//
//  HalfAlitGradientController.h
//  MaskViewAnimation
//
//  Created by yanxuezhou on 2021/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HalfAlitGradientController : UIViewController

@end

NS_ASSUME_NONNULL_END
@interface HalfAlightGradientView : UIView
@property(nonatomic,strong) NSArray * colors;
@property(nonatomic,strong) NSArray * locations;
@property(nonatomic,assign) CGPoint startPoint;
@property(nonatomic,assign)CGPoint endPoint;



@end
