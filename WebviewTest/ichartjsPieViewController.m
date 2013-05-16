//
//  ichartjsPieViewController.m
//  WebviewTest
//
//  Created by 文正光 on 13-5-17.
//  Copyright (c) 2013年 文正光. All rights reserved.
//

#import "ichartjsPieViewController.h"

@interface ichartjsPieViewController ()

@end

@implementation ichartjsPieViewController

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
@end
