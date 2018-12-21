//
//  ArrowLabel.m
//  XLIrregularLabel
//
//  Created by Mac-Qke on 2018/12/21.
//  Copyright © 2018 Mac-Qke. All rights reserved.
//

#import "ArrowLabel.h"

@interface ArrowLabel ()

/** 遮罩 */
@property (nonatomic, strong) CAShapeLayer *maskLayer;
/** 路径 */
@property (nonatomic, strong) UIBezierPath *borderPath;

@end

@implementation ArrowLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化遮罩
        self.maskLayer = [CAShapeLayer layer];
        
        // 设置遮罩
        [self.layer setMask:self.maskLayer];
        
        // 初始化路径
        self.borderPath = [UIBezierPath bezierPath];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 遮罩层frame
    self.maskLayer.frame = self.bounds;
    
    // 设置path起点
    [self.borderPath moveToPoint:CGPointMake(0, 10)];
    
    // 箭头
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2-5, 10)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2, 0)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2+5, 10)];
    
    // 到右上角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, 10)];
    // 到右下角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    
    // 到左下角
    [self.borderPath addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    // 回到起点
    [self.borderPath addLineToPoint:CGPointMake(0, 10)];
    
    // 将这个path赋值给maskLayer的path
    self.maskLayer.path = self.borderPath.CGPath;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end