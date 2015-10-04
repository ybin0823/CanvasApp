//
//  YBPoint.h
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YBPoint : NSObject

@property (nonatomic, readonly) float x;
@property (nonatomic, readonly) float y;

+(instancetype)YBPointWithPoint:(CGPoint)point;

@end
