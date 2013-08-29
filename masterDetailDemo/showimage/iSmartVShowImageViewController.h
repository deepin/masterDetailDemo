//
//  iSmartVShowImageViewController.h
//  masterDetailDemo
//
//  Created by LV on 13-8-28.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iSmartVHTTPClient.h"
@interface iSmartVShowImageViewController : UIViewController

- (IBAction)back2split:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *theimageview;
@property (assign, nonatomic) CGRect *imageViewRect;
@property float masterWidth;
@end
