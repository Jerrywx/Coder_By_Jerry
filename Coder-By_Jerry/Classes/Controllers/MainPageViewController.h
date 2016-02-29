//
//  MainPageViewController.h
//  LeftSlide
//
//  Created by huangzhenyu on 15/6/18.
//  Copyright (c) 2015年 eamon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainPageViewControllerScrolled <NSObject>
- (void)mainPageViewControllerDidScrolled:(BOOL)isOne;
@end

@interface MainPageViewController : UIViewController
@property (nonatomic, strong) UICollectionView					*collectionView;	// collection

@property (nonatomic, strong) id<MainPageViewControllerScrolled> delegate;
@end
