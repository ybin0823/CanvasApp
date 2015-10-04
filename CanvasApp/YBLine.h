//
//  YBLine.h
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBPoint.h"

@interface YBLine : NSObject

@property (nonatomic, readonly) YBPoint *startPoint;
@property (nonatomic, readonly) YBPoint *endPoint;

+(instancetype) YBLineWithStartPoint:(YBPoint *)startPoint
                            endPoint:(YBPoint *)endPoint;

@end
