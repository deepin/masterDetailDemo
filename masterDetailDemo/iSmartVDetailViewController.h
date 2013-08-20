//
//  iSmartVDetailViewController.h
//  masterDetailDemo
//
//  Created by LV on 13-8-20.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iSmartVDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
