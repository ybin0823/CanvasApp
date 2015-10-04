//
//  CanvasView.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 4..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "YBCanvas.h"
#import "YBPoint.h"
#import "YBLine.h"

@implementation YBCanvas
{
    NSMutableArray *path;
}

@synthesize path = path;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        path = [[NSMutableArray alloc] init];
    }
    
    return self;
}
- (void)dealloc
{
    [path release];
    
    [super dealloc];
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 2.0f);
    
    for (YBLine *line in path) {
        CGContextMoveToPoint(context, [line startPoint].x, [line startPoint].y);
        CGContextAddLineToPoint(context, [line endPoint].x, [line endPoint].y);
        CGContextStrokePath(context);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    // touchesBegan 에서는 시작 점을 첫 line으로 add한다
    YBPoint *startPoint = [YBPoint YBPointWithPoint:point];
    YBPoint *endPoint = [YBPoint YBPointWithPoint:point];
    
    YBLine *line = [YBLine YBLineWithStartPoint:startPoint endPoint:endPoint];
    
    [path addObject:line];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");

    // 이전 line의 마지막 포인트를 start point로 하고 움직인 포인트를 end point로 한다
    UITouch *touch = [touches anyObject];
    YBPoint *point = [YBPoint YBPointWithPoint:[touch locationInView:self]];
    YBLine *previousLine = [path lastObject];
    YBLine *line = [YBLine YBLineWithStartPoint:[previousLine endPoint] endPoint:point];
    
    [path addObject:line];
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
}


@end
