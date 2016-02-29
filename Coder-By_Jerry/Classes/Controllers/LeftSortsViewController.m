//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "otherViewController.h"
#import "LeftSlideViewController.h"
#import "MainViewController.h"

@interface LeftSortsViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageview	= [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image			= [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];

	self.tableView = ({
		UITableView *tableView = [[UITableView alloc] init];
		tableView.frame = self.view.bounds;
		tableView.dataSource = self;
		tableView.delegate  = self;
		tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		tableView;
	});
	[self.view addSubview: self.tableView];

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType		= UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font		= [UIFont systemFontOfSize:18.0f];
    cell.backgroundColor	= [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"开通会员";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"QQ钱包";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"网上营业厅";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"个性装扮";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"我的收藏";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"我的相册";
    } else if (indexPath.row == 6) {
        cell.textLabel.text = @"我的文件";
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    otherViewController *vc		 = [[otherViewController alloc] init];
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
	// 弹出新窗口
//    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
	[tempAppDelegate.mainNavigationController popToRootViewControllerAnimated:NO];
	MainViewController *mainVC = (MainViewController*)tempAppDelegate.mainNavigationController.topViewController;
	[mainVC swicthAppControllerWith:indexPath.row];
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 80)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
@end
