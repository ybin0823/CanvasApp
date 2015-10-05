//
//  LineWithTime.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 5..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "LineWithTime.h"

@implementation LineWithTime
{
    YBLine *line;
    NSDate *time;
}

@synthesize line = line;
@synthesize time = time;

+ (instancetype)LineWithTime:(YBLine *)line Time:(NSDate *)time {
    return [[[LineWithTime alloc] initWithLine:line Time:time] autorelease];
}
- (instancetype)initWithLine:(YBLine *)mLine Time:(NSDate *)mTime
{
    self = [super init];
    
    if (self) {
        line = [mLine retain];
        time = [mTime retain];
    }
    
    return self;
}
- (void)dealloc
{
    [line release];
    [time release];
    
    [super dealloc];
}
@end
