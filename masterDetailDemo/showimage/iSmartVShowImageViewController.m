//
//  iSmartVShowImageViewController.m
//  masterDetailDemo
//
//  Created by LV on 13-8-28.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import "iSmartVShowImageViewController.h"
#import "iSmartVHTTPClient.h"
#import "Report.h"
#import "AFImageRequestOperation.h"

@interface iSmartVShowImageViewController ()

@end 

@implementation iSmartVShowImageViewController
@synthesize theimageview;
@synthesize imageViewRect;
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
/*    UIImage *animage = [UIImage imageNamed:@"f485b7df2b84d26895ee3779.jpg"];
    [theimageview setImage:animage];//]initWithImage:animage];
    //imageViewRect = [theimageview];
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(doPinch:)];
    [self.view addGestureRecognizer:pinch];*/
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://172.19.18.184:8000/ReportIosServer/2013/07/22/ChenDeGao_10002_150212/page/1"]];
    AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:request imageProcessingBlock:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        self.theimageview.image=image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"EROOR%@",error);
    }];
    [operation start];
}

- (void)doPinch:(UIPinchGestureRecognizer *)pinch
{
    if (pinch.state == UIGestureRecognizerStateBegan) {
        ;//initialFontSize = label.font.pointSize;
    } else {
        
        [theimageview setImage:[UIImage imageNamed:@"f485b7df2b84d26895ee3779.jpg"]];//label.font = [label.font fontWithSize:initialFontSize * pinch.scale];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //messageLabel.text = @"Touches Began";
    //[self updateLabelsFromTouches:touches];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    //messageLabel.text = @"Touches Cancelled";
    //[self updateLabelsFromTouches:touches];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //messageLabel.text = @"Touches Ended.";
    //[self updateLabelsFromTouches:touches];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //messageLabel.text = @"Drag Detected";
    //[self updateLabelsFromTouches:touches];
}

- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognizer {
    //label.text = @"Horizontal swipe detected";
    //[self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}
- (void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer {
    //label.text = @"Vertical swipe detected";
    //[self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

@end
