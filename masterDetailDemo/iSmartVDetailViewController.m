//
//  iSmartVDetailViewController.m
//  masterDetailDemo
//
//  Created by LV on 13-8-20.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import "iSmartVDetailViewController.h"
#import "iSmartVDetailTableViewCell.h" 
#import "iSmartVShowImageViewController.h"
#import "iSmartVAppDelegate.h"  
#ifndef _test
#define _test
#endif


@interface iSmartVDetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@end

@implementation iSmartVDetailViewController
@synthesize selectedPatient;
@synthesize reports;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //UISplitViewController *splitviewctrl = self.splitViewController;
    //UIViewController *masterController = [splitviewctrl.viewControllers objectAtIndex:0];
    
    self.title = @"the detail view";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return [self.reports count];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super  viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //fill customed cell with reports
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (iSmartVShowImageViewController*) getContentView
{
    static iSmartVShowImageViewController *contentViewController;
    if(!contentViewController){
        contentViewController = [[iSmartVShowImageViewController alloc] initWithNibName:@"contentView" bundle:nil];
       // CGRect thescreen = [[UIScreen mainScreen] bounds];
       // [contentViewController.view setFrame:thescreen];
    }

    
    return contentViewController;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        
    }
    iSmartVAppDelegate *myDelegate = (((iSmartVAppDelegate*) [UIApplication sharedApplication].delegate));
    //UIImageView *theimgview = (UIImageView *)[myDelegate.window viewWithTag:2];
    ////prepare data and give content view
    //UIView *destview = [myDelegate.window viewWithTag:1];
    iSmartVShowImageViewController *contentViewController = [self getContentView];
    if ([contentViewController respondsToSelector:@selector(setTheimage:)]) {
        //set image according to indexPath
        [contentViewController setValue:[UIImage imageNamed:@"f485b7df2b84d26895ee3779.jpg"] forKey:@"theimage"];
    }
    [UIView beginAnimations:@"showUIImageView" context:nil];
    [UIView setAnimationDuration:1];
    [myDelegate.window addSubview:contentViewController.view];
   // [myDelegate.window bringSubviewToFront:contentViewController.view];
	[UIView commitAnimations];

}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = [[_objectsArray objectAtIndex: indexPath.section] objectAtIndex:indexPath.row ];
        //[[segue destinationViewController] setDetailItem:object];
    }

/*    iSmartVShowImageViewController *dest = segue.destinationViewController;
    dest.masterWidth = self.masterWidth;//[dest setValue: self.masterWidth forKey:@"masterWidth" ];
    
    iSmartVAppDelegate *myDelegate = (((iSmartVAppDelegate*) [UIApplication sharedApplication].delegate));
    
    
    CGRect newframe =  myDelegate.window.frame;
    float tmp = newframe.size.width;
    newframe.size.width = newframe.size.height;
    newframe.size.height = tmp;
    CGRect newframe2 = CGRectMake(newframe.origin.x, newframe.origin.y, newframe.size.width, newframe.size.height);
    CGRect newframe3 = CGRectMake(newframe.origin.x, newframe.origin.y, newframe.size.width, newframe.size.height);
    CGRect newframe4 = CGRectMake(newframe.origin.x, newframe.origin.y, newframe.size.width, newframe.size.height);
    self.view.frame = newframe2;
    dest.view.frame = newframe3;
    dest.theimageview.frame = newframe4;
    [myDelegate.window bringSubviewToFront:self.view];*/
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
