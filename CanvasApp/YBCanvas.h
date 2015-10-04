//
//  CanvasView.h
//  CanvasApp
//
//  When user touching screen, canvas view draw line following finger moving.
//
//  Created by Jang Young bin on 2015. 10. 4..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBCanvas : UIView

@property (nonatomic, readonly) NSMutableArray *lines;

- (void)clear;

@end
