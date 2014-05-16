//
//  CreditViewController.m
//  dui88-iOS-sdk
//
//  Created by xuhengfei on 14-5-16.
//  Copyright (c) 2014年 cpp. All rights reserved.
//

#import "CreditViewController.h"
#import "CreditNavigationController.h"
#import "CreditWebViewController.h"

@interface CreditViewController ()

@end

@implementation CreditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(100, 200, 100, 30);
    [btn setTitle:@"进入积分商城" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}
    
    -(void)enter{
        CreditWebViewController *web=[[CreditWebViewController alloc]initWithUrl:@"http://m.baidu.com"];
        
        CreditNavigationController *nav=[[CreditNavigationController alloc]initWithRootViewController:web];
        
        [self presentViewController:nav animated:YES completion:nil];
        
    }
    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
