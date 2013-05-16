//
//  LineViewController.h
//  WebviewTest
//
//  Created by wzg on 13-5-10.
//  Copyright (c) 2013年 文正光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineViewController : UIViewController

// Chart properties.
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (nonatomic, retain) NSMutableString *htmlContent;
@property (nonatomic, retain) NSMutableString *javascriptPath;
@property (nonatomic, retain) NSMutableString *chartData;
@property (nonatomic, retain) NSMutableString *chartType;
@property (nonatomic, assign) UIInterfaceOrientation currentOrientation;
@property (nonatomic, assign) CGFloat chartWidth;
@property (nonatomic, assign) CGFloat chartHeight;
@property (nonatomic, retain) NSMutableString *debugMode;
@property (nonatomic, retain) NSMutableString *registerWithJavaScript;

// Twitter data.
@property (nonatomic, retain) NSMutableString *twitterQuery;
@property (nonatomic, retain) NSMutableData *twitterData;
@property (nonatomic, retain) NSDictionary *twitterDataDictionary;
@property (nonatomic, assign) BOOL twitterDataError;

- (void)displayDataError;
- (void)createChartData:(UIInterfaceOrientation)interfaceOrientation;
- (void)plotChart;
- (void)removeChart;

@end
