//
//  YBLine.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "YBLine.h"

@implementation YBLine
{
    YBPoint *startPoint;
    YBPoint *endPoint;
}

@synthesize startPoint = startPoint;
@synthesize endPoint = endPoint;

+ (instancetype) YBLineWithStartPoint:(YBPoint *)startPoint
                            endPoint:(YBPoint *)endPoint {
    return [[[YBLine alloc] initWithStartPoint:startPoint EndPoint:endPoint] autorelease];
}
- (instancetype) initWithStartPoint:(YBPoint *)aStartPoint EndPoint:(YBPoint *)aEndPoint {
    self = [super init];
    
    if (self) {
        startPoint = [aStartPoint retain];
        endPoint = [aEndPoint retain];
    }
    
    return self;
}
- (void)dealloc {
    [startPoint release];
    [endPoint release];
    
    [super dealloc];
}

@end
