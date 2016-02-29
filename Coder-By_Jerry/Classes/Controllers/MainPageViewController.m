//
//  MainPageViewController.m
//  LeftSlide
//
//  Created by huangzhenyu on 15/6/18.
//  Copyright (c) 2015年 eamon. All rights reserved.
//

#import "MainPageViewController.h"
#import "AppDelegate.h"
#import "LeftSlideViewController.h"
#define vBackBarButtonItemName  @"backArrow.png"    //导航条返回默认图片名

@interface MainPageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UICollectionViewFlowLayout		*layout;			// layout
@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主界面";
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
	
	[self setUpView];
}

- (void)setUpView {
	
	self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
	self.collectionView.delegate = self;
	self.collectionView.dataSource = self;
	self.collectionView.bounces = NO;
	self.collectionView.pagingEnabled = YES;
	[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"item"];
	[self.view addSubview:self.collectionView];
	
	UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(test:)];
	pan.delaysTouchesBegan = YES;
	pan.delegate = self;
//	[self.collectionView addGestureRecognizer:pan];
}

- (void)test:(UIPanGestureRecognizer *)rec {
	NSLog(@"====== %@", rec);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	NSLog(@"--------- ");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	NSLog(@"========= %@", NSStringFromCGPoint(scrollView.contentOffset));
	
	if ([self.delegate respondsToSelector:@selector(mainPageViewControllerDidScrolled:)]) {
		
		BOOL isOne = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width == 0;
		[self.delegate mainPageViewControllerDidScrolled:isOne];
	}
}

#pragma mark - UIGestureRecognizerDelegate
// 设置手势 滑动 和 tableView 滚动并存
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	
	return YES;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
	cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
	return cell;
}

#pragma mark - 懒加载
- (UICollectionViewFlowLayout *)layout {
	
	if (_layout) {
		return _layout;
	}
	
	_layout = [[UICollectionViewFlowLayout alloc] init];
	_layout.minimumLineSpacing = 0;
	_layout.minimumInteritemSpacing = 0;
	_layout.itemSize = self.view.bounds.size;
	_layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	return _layout;
}

#pragma mark -
- (void) openOrCloseLeftList {
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed) {
        [tempAppDelegate.LeftSlideVC openLeftView];
    } else {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}

@end







