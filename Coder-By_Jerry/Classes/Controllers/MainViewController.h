//
//  MainViewController.h
//  Coder-By_Jerry
//
//  Created by wxiao on 16/2/21.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainPageViewControllerScrolled <NSObject>
- (void)mainPageViewControllerDidScrolled:(BOOL)isOne;
@end


@interface MainViewController : UIViewController

/**
 *  当前显示索引
 */
@property (nonatomic, assign) NSInteger AppIndex;

@property (nonatomic, strong) id<MainPageViewControllerScrolled> delegate;

- (void)swicthAppControllerWith:(NSInteger)index;

@end
