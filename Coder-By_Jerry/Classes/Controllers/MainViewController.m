//
//  MainViewController.m
//  Coder-By_Jerry
//
//  Created by wxiao on 16/2/21.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "MainViewController.h"
#import "CocoaController.h"
#import "Cocos2dController.h"
#import <HMSegmentedControl.h>
#import "controller.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@interface MainViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) NSArray					*controllerArray;		// 控制器数组
@property (nonatomic, strong) HMSegmentedControl		*segmentController;		// 选择器
@property (nonatomic, strong) UIScrollView				*scrollView;			// scrollView

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[self setUpView];
}

- (void)setUpView {
	
	self.navigationItem.title = @"首页";
	self.view.backgroundColor = [UIColor whiteColor];
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
																			 style:UIBarButtonItemStylePlain
																			target:self
																			action:@selector(close)];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"search"
																			  style:UIBarButtonItemStylePlain
																			 target:self
																			 action:@selector(search)];
	
	self.segmentController = ({
		HMSegmentedControl *segment = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 300, 32)];
		segment.sectionTitles = @[@"最新", @"iOS开发", @"Swift", @"游戏开发",
								  @"AppStore", @"苹果相关", @"产业动态", @"产品设计",
								  @"营销推广", @"Mac开发", @"程序人生", @"Cocos引擎", @"WebApp"];
		segment.titleTextAttributes = @{
										NSFontAttributeName : [UIFont systemFontOfSize:12.0f],
										NSForegroundColorAttributeName : [UIColor blackColor],
										};
		segment.selectedTitleTextAttributes = @{
										NSFontAttributeName : [UIFont systemFontOfSize:14.0f],
										NSForegroundColorAttributeName : [UIColor blackColor],
										};
		segment.backgroundColor = [UIColor clearColor];
		segment.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
		
		segment;
	});
	self.navigationItem.titleView = self.segmentController;
	
	self.scrollView = ({
		UIScrollView *scrollView	= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64)];
		scrollView.backgroundColor	= [UIColor orangeColor];
		scrollView.contentSize		= CGSizeMake(SCREEN_W * 13, SCREEN_H - 64);
		scrollView.pagingEnabled	= YES;
		scrollView.delegate			= self;
		scrollView.bounces			= NO;
		scrollView;
	});
	[self.view addSubview:self.scrollView];
	
	[self addControllers];
}

- (void)addControllers {
	
	SubChannel00 *sub0 = [[SubChannel00 alloc] init];
	SubChannel01 *sub1 = [[SubChannel01 alloc] init];
	SubChannel00 *sub2 = [[SubChannel00 alloc] init];
	SubChannel00 *sub3 = [[SubChannel00 alloc] init];
	SubChannel00 *sub4 = [[SubChannel00 alloc] init];
	SubChannel00 *sub5 = [[SubChannel00 alloc] init];
	SubChannel00 *sub6 = [[SubChannel00 alloc] init];
	SubChannel00 *sub7 = [[SubChannel00 alloc] init];
	SubChannel00 *sub8 = [[SubChannel00 alloc] init];
	SubChannel00 *sub9 = [[SubChannel00 alloc] init];
	SubChannel00 *sub10 = [[SubChannel00 alloc] init];
	SubChannel00 *sub11 = [[SubChannel00 alloc] init];
	SubChannel00 *sub12 = [[SubChannel00 alloc] init];
	
	[self addChildViewController:sub0];
	[self addChildViewController:sub1];
	[self addChildViewController:sub2];
	[self addChildViewController:sub3];
	[self addChildViewController:sub4];
	[self addChildViewController:sub5];
	[self addChildViewController:sub6];
	[self addChildViewController:sub7];
	[self addChildViewController:sub8];
	[self addChildViewController:sub9];
	[self addChildViewController:sub10];
	[self addChildViewController:sub11];
	[self addChildViewController:sub12];
	
	[self.scrollView addSubview:sub0.view];
	[self.scrollView addSubview:sub1.view];
	[self.scrollView addSubview:sub2.view];
	[self.scrollView addSubview:sub3.view];
	[self.scrollView addSubview:sub4.view];
	[self.scrollView addSubview:sub5.view];
	[self.scrollView addSubview:sub6.view];
	[self.scrollView addSubview:sub7.view];
	[self.scrollView addSubview:sub8.view];
	[self.scrollView addSubview:sub9.view];
	[self.scrollView addSubview:sub10.view];
	[self.scrollView addSubview:sub11.view];
	[self.scrollView addSubview:sub12.view];
	
	sub0.view.frame = CGRectMake(0 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub1.view.frame = CGRectMake(1 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub2.view.frame = CGRectMake(2 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub3.view.frame = CGRectMake(3 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub4.view.frame = CGRectMake(4 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub5.view.frame = CGRectMake(5 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub6.view.frame = CGRectMake(6 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub7.view.frame = CGRectMake(7 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub8.view.frame = CGRectMake(8 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub9.view.frame = CGRectMake(9 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub10.view.frame = CGRectMake(10 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub11.view.frame = CGRectMake(11 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	sub12.view.frame = CGRectMake(12 * SCREEN_W, 0, SCREEN_W, SCREEN_H - 64);
	
	sub0.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub1.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub2.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub3.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub4.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub5.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub6.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub7.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub8.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub9.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub10.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub11.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	sub12.view.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
										   saturation:( arc4random() % 256 / 256.0 )
										   brightness:( arc4random() % 256 / 256.0 ) alpha:1];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

	if ([self.delegate respondsToSelector:@selector(mainPageViewControllerDidScrolled:)]) {
		
		BOOL isOne = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width == 0;
		[self.delegate mainPageViewControllerDidScrolled:isOne];
	}
}

#pragma mark - Private Methond
- (void)close {
	NSLog(@"------- close");
}

- (void)search {
	NSLog(@"====== search");
}

- (void)swicthAppControllerWith:(NSInteger)index {
	self.AppIndex = index;
	UIViewController *controller = self.controllerArray[index];
//	[self addChildViewController:controller];
//	[self.view addSubview:controller.view];
	
	[self.navigationController pushViewController:controller animated:NO];
}

#pragma mark - 懒加载
- (NSArray *)controllerArray {
	
	if (_controllerArray) {
		return _controllerArray;
	}
	
	_controllerArray = @[
						[[CocoaController alloc] init],
						[[Cocos2dController alloc] init]];
	
	return _controllerArray;
}

@end
