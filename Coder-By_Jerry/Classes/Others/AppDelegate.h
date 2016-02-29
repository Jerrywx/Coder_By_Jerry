//
//  AppDelegate.h
//  Coder-By_Jerry
//
//  Created by wxiao on 16/2/20.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeftSlideViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LeftSlideViewController	*LeftSlideVC;				// 侧滑
@property (strong, nonatomic) UINavigationController	*mainNavigationController;	// 主控制器

@end

