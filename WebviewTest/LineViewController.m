//
//  LineViewController.m
//  WebviewTest
//
//  Created by wzg on 13-5-10.
//  Copyright (c) 2013年 文正光. All rights reserved.
//

#import "LineViewController.h"

@interface LineViewController ()

@end

@implementation LineViewController

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
    self.currentOrientation = self.interfaceOrientation;
	[self createChartData:self.currentOrientation];
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


#pragma mark -
#pragma mark Chart Setup

- (void)displayDataError
{
	NSMutableString *displayErrorHTML = [NSMutableString stringWithString:@"<html><head>"];
	[displayErrorHTML appendString:@"<title>Chart Error</title>"];
	[displayErrorHTML appendString:@"</head><body>"];
	[displayErrorHTML appendString:@"<p>Unable to plot chart.<br/>Error receiving data from Twitter.</p>"];
	[displayErrorHTML appendString:@"</body></html>"];
	
	[self.webview loadHTMLString:displayErrorHTML baseURL:nil];
}

- (void)createChartData:(UIInterfaceOrientation)interfaceOrientation
{
	// Check whether we have valid data.
	if (self.twitterDataError) {
		[self displayDataError];
	} else {
		// Valid data.
		
		// Set chart width and height depending on the screen's orientation.
		if (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
			self.chartWidth = 300;
			self.chartHeight = 350;
		} else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
			self.chartWidth = 440;
			self.chartHeight = 280;
		}
		
        //		// Setup chart XML.
        //		NSDictionary *responseData = [self.twitterDataDictionary objectForKey:@"response"];
        //		NSArray *histogramData = [responseData objectForKey:@"histogram"];
        //		self.chartData = [NSMutableString string];
        //		[self.chartData appendFormat:@"<chart caption='Twitter mentions of HTML5' subCaption='In the last 7 days' showValues='0'>"];
        //		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //		[dateFormatter setDateStyle:NSDateFormatterShortStyle];
        //		for (int i = 0; i < [histogramData count]; i++) {
        //			[self.chartData appendFormat:@"<set label='%@' value='%@' />", [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:-(i+1)*86400]], [histogramData objectAtIndex:i]];
        //		}
        //		[self.chartData appendFormat:@"</chart>"];
        //		[dateFormatter release];
        self.chartData = [NSMutableString string];
        [self.chartData appendFormat:@"<chart caption=\"Site hits per hour\" subCaption=\"In Thousands\" numdivlines=\"9\" lineThickness=\"2\" showValues=\"0\" numVDivLines=\"22\" formatNumberScale=\"1\" labelDisplay=\"ROTATE\" slantLabels=\"1\" anchorRadius=\"2\" anchorBgAlpha=\"50\" showAlternateVGridColor=\"1\" anchorAlpha=\"100\" animation=\"1\" limitsDecimalPrecision=\"0\" divLineDecimalPrecision=\"1\">         <categories >         <category label=\"00:00\" />         <category label=\"01:00\" />         <category label=\"02:00\" />         <category label=\"03:00\" />         <category label=\"04:00\" />         <category label=\"05:00\" />         <category label=\"06:00\" />         <category label=\"07:00\" />         <category label=\"08:00\" />         <category label=\"09:00\" />         <category label=\"10:00\" />         <category label=\"11:00\" />         <category label=\"12:00\" />         <category label=\"13:00\" />         <category label=\"14:00\" />         <category label=\"15:00\" />         <category label=\"16:00\" />         <category label=\"17:00\" />         <category label=\"18:00\" />         <category label=\"19:00\" />         <category label=\"20:00\" />         <category label=\"21:00\" />         <category label=\"22:00\" />         <category label=\"23:00\" />         </categories>         <dataset seriesName=\"Sat\" color=\"0080C0\" anchorBorderColor=\"0080C0\" >         <set value=\"36\" />         <set value=\"71\" />         <set value=\"85\" />         <set value=\"92\" />         <set value=\"101\" />         <set value=\"116\" />         <set value=\"164\" />         <set value=\"180\" />         <set value=\"192\" />         <set value=\"262\" />         <set value=\"319\" />         <set value=\"489\" />         <set value=\"633\" />         <set value=\"904\" />         <set value=\"1215\" />         <set value=\"1358\" />         <set value=\"1482\" />         <set value=\"1666\" />         <set value=\"1811\" />         <set value=\"2051\" />         <set value=\"2138\" />         <set value=\"2209\" />         <set value=\"2247\" />         <set value=\"2301\" />         </dataset>         <dataset seriesName=\"Sun\" color=\"008040\" anchorBorderColor=\"008040\">         <set value=\"23\" />         <set value=\"40\" />         <set value=\"62\" />         <set value=\"118\" />         <set value=\"130\" />         <set value=\"139\" />         <set value=\"158\" />         <set value=\"233\" />         <set value=\"297\" />         <set value=\"379\" />         <set value=\"503\" />         <set value=\"687\" />         <set value=\"746\" />         <set value=\"857\" />         <set value=\"973\" />         <set value=\"1125\" />         <set value=\"1320\" />         <set value=\"1518\" />         <set value=\"1797\" />         <set value=\"1893\" />         <set value=\"2010\" />         <set value=\"2057\" />         <set value=\"2166\" />         <set value=\"2197\" />         </dataset>         <dataset seriesName=\"Mon\" color=\"808080\" anchorBorderColor=\"808080\">         <set value=\"37\" />         <set value=\"45\" />         <set value=\"70\" />         <set value=\"79\" />         <set value=\"168\" />         <set value=\"337\" />         <set value=\"374\" />         <set value=\"431\" />         <set value=\"543\" />         <set value=\"784\" />         <set value=\"1117\" />         <set value=\"1415\" />         <set value=\"2077\" />         <set value=\"2510\" />         <set value=\"3025\" />         <set value=\"3383\" />         <set value=\"3711\" />         <set value=\"4016\" />         <set value=\"4355\" />         <set value=\"4751\" />         <set value=\"5154\" />         <set value=\"5475\" />         <set value=\"5696\" />         <set value=\"5801\" />         </dataset>         <dataset seriesName=\"Tue\" color=\"800080\" anchorBorderColor=\"800080\">         <set value=\"54\" />         <set value=\"165\" />         <set value=\"175\" />         <set value=\"190\" />         <set value=\"212\" />         <set value=\"241\" />         <set value=\"308\" />         <set value=\"401\" />         <set value=\"481\" />         <set value=\"851\" />         <set value=\"1250\" />         <set value=\"2415\" />         <set value=\"2886\" />         <set value=\"3252\" />         <set value=\"3673\" />         <set value=\"4026\" />         <set value=\"4470\" />         <set value=\"4813\" />         <set value=\"4961\" />         <set value=\"5086\" />         <set value=\"5284\" />         <set value=\"5391\" />         <set value=\"5657\" />         <set value=\"5847\" />         </dataset>         <dataset seriesName=\"Wed\" color=\"FF8040\" anchorBorderColor=\"FF8040\">         <set value=\"111\" />         <set value=\"120\" />         <set value=\"128\" />         <set value=\"140\" />         <set value=\"146\" />         <set value=\"157\" />         <set value=\"190\" />         <set value=\"250\" />         <set value=\"399\" />         <set value=\"691\" />         <set value=\"952\" />         <set value=\"1448\" />         <set value=\"1771\" />         <set value=\"2316\" />         <set value=\"2763\" />         <set value=\"3149\" />         <set value=\"3637\" />         <set value=\"4015\" />         <set value=\"4262\" />         <set value=\"4541\" />         <set value=\"4837\" />         <set value=\"5016\" />         <set value=\"5133\" />         <set value=\"5278\" />         </dataset>         <dataset seriesName=\"Thu\" color=\"FFFF00\" anchorBorderColor=\"FFFF00\" >         <set value=\"115\" />         <set value=\"141\" />         <set value=\"175\" />         <set value=\"189\" />         <set value=\"208\" />         <set value=\"229\" />         <set value=\"252\" />         <set value=\"440\" />         <set value=\"608\" />         <set value=\"889\" />         <set value=\"1334\" />         <set value=\"1637\" />         <set value=\"2056\" />         <set value=\"2600\" />         <set value=\"3070\" />         <set value=\"3451\" />         <set value=\"3918\" />         <set value=\"4140\" />         <set value=\"4296\" />         <set value=\"4519\" />         <set value=\"4716\" />         <set value=\"4881\" />         <set value=\"5092\" />         <set value=\"5249\" />         </dataset>         <dataset seriesName=\"Fri\" color=\"FF0080\" anchorBorderColor=\"FF0080\" >         <set value=\"98\" />         <set value=\"1112\" />         <set value=\"1192\" />         <set value=\"1219\" />         <set value=\"1264\" />         <set value=\"1282\" />         <set value=\"1365\" />         <set value=\"1433\" />         <set value=\"1559\" />         <set value=\"1823\" />         <set value=\"1867\" />         <set value=\"2198\" />         <set value=\"1112\" />         <set value=\"1192\" />         <set value=\"1219\" />         <set value=\"2264\" />         <set value=\"2282\" />         <set value=\"2365\" />         <set value=\"2433\" />         <set value=\"2559\" />         <set value=\"2823\" />         <set value=\"2867\" />         <set value=\"2867\" />         <set value=\"2867\" />         </dataset>         </chart>"];
        
        NSString *datapath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSString *data = [[NSString alloc] initWithContentsOfFile:datapath];
		
		// Setup chart HTML.
		self.htmlContent = [NSMutableString stringWithFormat:@"%@", @"<html><head>"];
        [self.htmlContent appendString:@"<script type='text/javascript' src='MSLine4.js'></script>"];
		[self.htmlContent appendString:@"<script type='text/javascript' src='FusionCharts.js'></script>"];
		[self.htmlContent appendString:@"</head><body><div id='chart_container'>Chart will render here.</div>"];
		[self.htmlContent appendString:@"<script type='text/javascript'>"];
        [self.htmlContent appendString:@"FusionCharts.setCurrentRenderer(\"javascript\");"];
		[self.htmlContent appendFormat:@"var chart_object = new FusionCharts('MSLine.swf', 'ChartId', '%f', '%f', '0', '0');", self.chartWidth, self.chartHeight];
//		[self.htmlContent appendFormat:@"chart_object.setXMLData('%@');", self.chartData];
        //        eval("\(\"+json+\")\")
        [self.htmlContent appendFormat:@"chart_object.setJSONData(%@);",data];
		[self.htmlContent appendString:@"chart_object.render('chart_container');"];
		[self.htmlContent appendString:@"</script></body></html>"];
		
		// Draw the actual chart.
		[self plotChart];
	}
}

- (void)plotChart
{
	NSURL *baseURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@", [[NSBundle mainBundle] bundlePath]]];
	[self.webview loadHTMLString:self.htmlContent baseURL:baseURL];
}

- (void)removeChart
{
	NSString *emptyChartContainer = [NSString stringWithString:@"<script type='text/javascript'>document.getElementById('chart_container').innerHTML='';</script>"];
	[self.webview stringByEvaluatingJavaScriptFromString:emptyChartContainer]; 
}

@end
