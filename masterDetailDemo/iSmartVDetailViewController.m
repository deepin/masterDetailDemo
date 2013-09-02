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
- (void)configureView;

@end

@implementation iSmartVDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UISplitViewController *splitviewctrl = self.splitViewController;
    UIViewController *masterController = [splitviewctrl.viewControllers objectAtIndex:0];
    self.masterWidth = masterController.view.frame.size.width;
    
    self.title = @"the detail view";
#ifdef _test
    NSDictionary *row1 = [[NSDictionary alloc] initWithObjectsAndKeys: @"front", @"viewDirection", @"2013-08-01-10:20:34", @"date", nil];
    NSDictionary *row2 = [[NSDictionary alloc] initWithObjectsAndKeys: @"left", @"viewDirection", @"2013-08-01-10:20:36", @"date", nil];
    NSDictionary *row3 = [[NSDictionary alloc] initWithObjectsAndKeys: @"right", @"viewDirection", @"2013-08-01-10:20:38", @"date", nil];
    NSDictionary *row4 = [[NSDictionary alloc] initWithObjectsAndKeys: @"3d", @"viewDirection", @"2013-08-01-10:20:39", @"date", nil];
    self.computers = [[NSArray alloc] initWithObjects:row1, row2, row3, row4, nil];
#endif
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	// Do any additional setup after loading the view, typically from a nib.
#ifdef _test
    self.computers = nil;
#endif
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
#ifdef _test
    return [self.computers count];
#endif
}

- (void)viewWillAppear:(BOOL)animated
{
    [super  viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#ifdef _test
    static NSString *CellTableIdentifier = @"CellTableIdentifier";
    iSmartVDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                        CellTableIdentifier];
    if (cell == nil) {
        cell = [[iSmartVDetailTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
    }
    NSUInteger row = [indexPath row];
    NSDictionary *rowData = [self.computers objectAtIndex:row];
    cell.title = [rowData objectForKey:@"viewDirection"];
    cell.date = [rowData objectForKey:@"date"];
    return cell;
#endif
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
