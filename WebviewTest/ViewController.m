//
//  ViewController.m
//  WebviewTest
//
//  Created by 文正光 on 13-5-9.
//  Copyright (c) 2013年 文正光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,retain) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
//    NSString *html = [[NSString alloc] initWithContentsOfFile:filePath];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [webView stringByEvaluatingJavaScriptFromString:@"myFunction(){alert(\"你好\")};"];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
     [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#pragma mark UIWebViewDelegate
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    if ( [request.mainDocumentURL.relativePath isEqualToString:@"/click/false"] ) {
//        NSLog( @"not clicked" );
//        return false;
//    }
//    if ( [request.mainDocumentURL.relativePath isEqualToString:@"/click/true"] ) {        //the image is clicked, variable click is true
//        NSLog( @"image clicked" );
//        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"JavaScript called"
//                                                     message:@"You’ve called iPhone provided control from javascript!!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
//        [alert show];
//        return false;
//    }
//    return true;
//}
//- (void)webViewDidStartLoad:(UIWebView *)webView
//{
//    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
//    NSLog(@"title11=%@",title);
//}
//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
////    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
////     "script.type = 'text/javascript';"
////     "script.id = 'wzg'"
////     "script.text = \"function myFunction() { "
////    "var myChart = new JSChart('graph', 'line');"
////    "myChart.setDataArray([[1, 80],[2, 40],[3, 60],[4, 65],[5, 50],[6, 50],[7, 60],[8, 80],[9, 150],[10, 100]], 'blue');"
////    "myChart.setDataArray([[1, 100],[2, 55],[3, 80],[4, 115],[5, 80],[6, 70],[7, 30],[8, 130],[9, 160],[10, 170]], 'green');"
////    "myChart.setDataArray([[1, 150],[2, 25],[3, 100],[4, 80],[5, 20],[6, 65],[7, 0],[8, 155],[9, 190],[10, 200]], 'gray');"
////    "myChart.setAxisPaddingBottom(40);"
////    "myChart.setTextPaddingBottom(10);"
////    "myChart.setAxisValuesNumberY(5);"
////    "myChart.setIntervalStartY(0);"
////    "myChart.setIntervalEndY(200);"
////    "myChart.setLabelX([2,'p1']);"
////    "myChart.setLabelX([4,'p2']);"
////    "myChart.setLabelX([6,'p3']);"
////    "myChart.setLabelX([8,'p4']);"
////    "myChart.setLabelX([10,'p5']);"
////    "myChart.setAxisValuesNumberX(5);"
////    "myChart.setShowXValues(false);"
////    "myChart.setTitleColor('#454545');"
////    "myChart.setAxisValuesColor('#454545');"
////    "myChart.setLineColor('#A4D314', 'green');"
////    "myChart.setLineColor('#BBBBBB', 'gray');"
////    "myChart.setTooltip([1]);"
////    "myChart.setTooltip([2]);"
////    "myChart.setTooltip([3]);"
////    "myChart.setTooltip([4]);"
////    "myChart.setTooltip([5]);"
////    "myChart.setTooltip([6]);"
////    "myChart.setTooltip([7]);"
////    "myChart.setTooltip([8]);"
////    "myChart.setTooltip([9]);"
////    "myChart.setTooltip([10]);"
////    "myChart.setFlagColor('#9D16FC');"
////    "myChart.setFlagRadius(4);"
////    "myChart.setBackgroundImage('chart_bg.jpg');"
////    "myChart.setSize(616, 321);"
////    "myChart.draw();"
////
////     "}\";"
////     "document.getElementById('wzg').appendChild(script);"];
////    
////    [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
//    
////    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
////     "script.type = 'text/javascript';"
////     "script.text = \"function myFunction() { "
////     "alert('shit')"
////     "}\";"
////     "document.getElementsByTagName('head')[0].appendChild(script);"];
////    
////    [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
//
//    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
//    NSLog(@"title=%@",title);
//    //添加数据
//    [self.webView stringByEvaluatingJavaScriptFromString:@"var field = document.getElementById('field_2');"
//     "field.value='Multiple statements - OK';"];
//    //[myWebView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
//    //     "script.type = 'text/javascript';"
//    //     "script.text = \"function myFunction() { "
//    //     "var field = document.getElementById('field_3');"
//    //     "field.value='Calling function - OK';"
//    //     "}\";"
//    //     "document.getElementsByTagName('head')[0].appendChild(script);"];
//    //
//    //    [myWebView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
//}
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
//{ 
//}

#pragma mark -
#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ( [request.mainDocumentURL.relativePath isEqualToString:@"/click/false"] ) {
        NSLog( @"not clicked" );
        return false;
    }
    
    if ( [request.mainDocumentURL.relativePath isEqualToString:@"/click/true"] ) {        //the image is clicked, variable click is true
        NSLog( @"image clicked" );
        
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"JavaScript called"
													 message:@"You've called iPhone provided control from javascript!!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
        return false;
    }
    
    return true;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
	NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
	NSLog(@"title11=%@",title);
	
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
	NSLog(@"title=%@",title);
	[self.webView stringByEvaluatingJavaScriptFromString:@"var field = document.getElementById('field_2');"
	 "field.value='Multiple statements - OK';"];
	
	//[myWebView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
    //	 "script.type = 'text/javascript';"
    //	 "script.text = \"function myFunction() { "
    //	 "var field = document.getElementById('field_3');"
    //	 "field.value='Calling function - OK';"
    //	 "}\";"
    //	 "document.getElementsByTagName('head')[0].appendChild(script);"];
    //
    //	[myWebView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	
	
}
@end
