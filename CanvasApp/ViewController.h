//
//  ViewController.h
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBCanvas.h"

@class ViewController;

@protocol DrawViewControllerDelegate
- (void)drawViewControllerDidCancle:(ViewController *)controller;
@end

@interface ViewController : UIViewController

@property (nonatomic, weak) id <DrawViewControllerDelegate> delegate;
//- (IBAction)record:(id)sender;
//- (IBAction)play:(id)sender;
//- (IBAction)stop:(id)sender;
//- (IBAction)clear:(id)sender;
//- (IBAction)cancel:(id)sender;

@end

