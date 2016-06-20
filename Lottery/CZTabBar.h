//
//  CZTabBar.h
//  Lottery
//
//  Created by Geek on 16/6/20.
//  Copyright © 2016年 Geek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZTabBar;

@protocol CZTabBarDelegate <NSObject>

@optional
/**
 *  从一个按钮 点击 到另一个按钮
 */
-(void)tabBar:(CZTabBar *)tabBar didSelectFrom:(int)from to:(int)to;
@end

@interface CZTabBar : UIView

@property (nonatomic,weak) id<CZTabBarDelegate> delegate;
/**
 *  向导航栏中添加按钮
 */
-(void)addTabBarWithName:(NSString *)name selName:(NSString *)selname;
@end
