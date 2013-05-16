//
//  ichartjsLineViewController.m
//  WebviewTest
//
//  Created by 文正光 on 13-5-17.
//  Copyright (c) 2013年 文正光. All rights reserved.
//

#import "ichartjsLineViewController.h"

@interface ichartjsLineViewController ()<UIWebViewDelegate>

@end

@implementation ichartjsLineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ichartjs_line" ofType:@"html"];
    self.webview.delegate = self;
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWebview:nil];
    [super viewDidUnload];
}

#pragma mark webview delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"1");
    return YES; 
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"2");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"3");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"4");
}
@end
