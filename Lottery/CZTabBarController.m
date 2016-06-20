//
//  CZTabBarController.m
//  Lottery
//
//  Created by Geek on 16/6/20.
//  Copyright © 2016年 Geek. All rights reserved.
//

#import "CZTabBarController.h"
#import "CZTabBar.h"

@interface CZTabBarController ()<CZTabBarDelegate>

@end

@implementation CZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建导航栏
    CZTabBar *myTabBar = [[CZTabBar alloc] init];
    myTabBar.delegate = self;
    myTabBar.frame = self.tabBar.bounds;
    
    //2.代替原有导航Bar
    [self.tabBar addSubview:myTabBar];
    
    //3.添加所有的Bar中的按钮
    for(int i = 0 ; i < self.viewControllers.count;i++){
        //3.1创建图片的名称
        NSString *name = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        //3.2在TabBar中添加按钮
        [myTabBar addTabBarWithName:name selName:selName];
    }
}
-(void)tabBar:(CZTabBar *)tabBar didSelectFrom:(int)from to:(int)to{
    //选中的控制器切换
    self.selectedIndex = to;
}
@end
