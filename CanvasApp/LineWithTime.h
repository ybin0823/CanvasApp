//
//  LineWithTime.h
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 5..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBLine.h"

@interface LineWithTime : NSObject

@property (nonatomic, readonly) YBLine *line;
@property (nonatomic, readonly) NSDate *time;

+ (instancetype)LineWithTime:(YBLine *)line Time:(NSDate *)time;

@end
