//
//  CreditWebViewController.m
//  dui88-iOS-sdk
//
//  Created by xuhengfei on 14-5-16.
//  Copyright (c) 2014年 cpp. All rights reserved.
//

#import "CreditWebViewController.h"

@interface CreditWebViewController ()<UIWebViewDelegate>
    
    @property(nonatomic,strong) NSString *url;
    @property(nonatomic,strong) UIWebView *webView;

@end

@implementation CreditWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
    
    -(id)initWithUrl:(NSString *)url{
        self=[super init];
        self.url=url;
        return self;
    }

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:request];
    self.webView.delegate=self;
    [self.view addSubview:self.webView];
    
    self.navigationItem.leftBarButtonItem=nil;
}

-(void)viewDidAppear:(BOOL)animated{
    self.webView.frame=self.view.bounds;
}
    
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    if(![[request.URL description]isEqualToString:self.url]){
        if([[request.URL description]rangeOfString:@"baidu.com"].location!=NSNotFound){
            CreditWebViewController *web=[[CreditWebViewController alloc]initWithUrl:[request.URL description]];
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
            [self.navigationItem setBackBarButtonItem:backItem];
            
            [self.navigationController pushViewController:web animated:YES];
            return NO;
        }
    }
    
//    if ([[request.URL description] hasPrefix:@"http://news.baidu.com"]) {
//        
//        return NO;
//    }
    
    return YES;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    self.title=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
