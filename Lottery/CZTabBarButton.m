//
//  CZTabBarButton.m
//  Lottery
//
//  Created by Geek on 16/6/20.
//  Copyright © 2016年 Geek. All rights reserved.
//

#import "CZTabBarButton.h"

@implementation CZTabBarButton

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

/**
 *  只要覆盖了这个方法,按钮就不存在高亮状态
 */
-(void)setHighlighted:(BOOL)highlighted{
    
}
@end
