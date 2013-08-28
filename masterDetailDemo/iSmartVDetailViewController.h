//
//  iSmartVDetailViewController.h
//  masterDetailDemo
//
//  Created by LV on 13-8-20.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef _test
#define _test
#endif
@interface iSmartVDetailViewController : UITableViewController <UISplitViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

#ifdef _test
@property (strong, nonatomic) NSArray *computers;
#endif

@end
