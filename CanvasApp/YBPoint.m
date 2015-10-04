//
//  YBPoint.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "YBPoint.h"

@implementation YBPoint
{
    float x;
    float y;
}

@synthesize x = x;
@synthesize y = y;

+(instancetype)YBPointWithPoint:(CGPoint)point {
    return [[[YBPoint alloc] initWithPoint:point] autorelease];
}

-(instancetype)initWithPoint:(CGPoint)point {
    self = [super init];
    
    if (self) {
        x = point.x;
        y = point.y;
    }
    
    return self;
}

//-(void)dealloc {
//    [super dealloc];
//}

@end
