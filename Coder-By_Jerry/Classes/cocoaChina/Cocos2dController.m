//
//  Cocos2dController.m
//  Coder-By_Jerry
//
//  Created by wxiao on 16/2/21.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "Cocos2dController.h"

@interface Cocos2dController ()

@end

@implementation Cocos2dController

- (void)viewDidLoad {
    [super viewDidLoad];

	[self setUpView];
}

- (void)setUpView {
	
	self.navigationItem.title = @"Cocos2dController";
	self.view.backgroundColor = [UIColor orangeColor];
	
//	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
//																			  style:UIBarButtonItemStylePlain
//																			 target:self
//																			 action:@selector(close)];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"search"
																			  style:UIBarButtonItemStylePlain
																			 target:self
																			 action:@selector(search)];
}

- (void)close {
	NSLog(@"------- close");
}

- (void)search {
	NSLog(@"====== search");
}

@end
