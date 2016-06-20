//
//  CZTabBar.m
//  Lottery
//
//  Created by Geek on 16/6/20.
//  Copyright © 2016年 Geek. All rights reserved.
//

#import "CZTabBar.h"
#import "CZTabBarButton.h"

@interface CZTabBar()
/**
 *  记录当前的选择的按钮
 */
@property (nonatomic,weak) CZTabBarButton *selectedBtn;
@end

@implementation CZTabBar

-(void)addTabBarWithName:(NSString *)name selName:(NSString *)selname{
    
    //1.创建按钮
    CZTabBarButton *btn = [CZTabBarButton buttonWithType:UIButtonTypeCustom];
    
    //2.设置图片
    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selname] forState:UIControlStateSelected];
    
    //3.添加子控件
    [self addSubview:btn];
    
    //4.添加点击事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    if(self.subviews.count == 1){
        [self btnClick:btn];
    }
}

//按钮布局
-(void)layoutSubviews{
    [super layoutSubviews];
    int count = self.subviews.count;
    for (int i = 0 ; i < count; i++) {
        CZTabBarButton *btn = self.subviews[i];
        btn.tag = i;
        CGFloat btnY = 0;
        CGFloat btnW = self.bounds.size.width / count;
        CGFloat btnH = self.bounds.size.height;
        CGFloat btnX = btnW * i;
        btn.frame = CGRectMake(btnX, btnY, btnW,btnH);
    }
}

//点击事件
-(void)btnClick:(CZTabBarButton *)btn{
    //1.通知代理(切换控制器)
    if([self.delegate respondsToSelector:@selector(tabBar:didSelectFrom:to:)]){
        [self.delegate tabBar:self didSelectFrom:self.selectedBtn.tag to:btn.tag];
    }
    
    //2.取消当前选择的按钮
    self.selectedBtn.selected = NO;
    
    //3.选择当前按钮
    btn.selected = YES;
    
    //4.修改当前选择按钮
    self.selectedBtn = btn;
}
@end
