//
//  iSmartVShowImageViewController.m
//  masterDetailDemo
//
//  Created by LV on 13-8-28.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import "iSmartVShowImageViewController.h"

@interface iSmartVShowImageViewController ()

@end

@implementation iSmartVShowImageViewController
@synthesize theimageview;

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
    UIImage *animage = [UIImage imageNamed:@"f485b7df2b84d26895ee3779.jpg"];
    [theimageview initWithImage:animage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
