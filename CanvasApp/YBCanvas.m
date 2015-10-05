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
#import "LineWithTime.h"

@implementation YBCanvas
{
    NSMutableArray *lines;
    NSMutableArray *recordedLines;
    NSTimer *timer;
    int index;
    BOOL recordMode;
}

@synthesize lines = lines;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        lines = [[NSMutableArray alloc] init];
        recordedLines = [[NSMutableArray alloc] init];
        recordMode = NO;
    }
    
    return self;
}
- (void)dealloc
{
    [lines release];
    [recordedLines release];
    [timer release];
    
    [super dealloc];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 2.0f);
    
    for (YBLine *line in lines) {
        CGContextMoveToPoint(context, [line startPoint].x, [line startPoint].y);
        CGContextAddLineToPoint(context, [line endPoint].x, [line endPoint].y);
        CGContextStrokePath(context);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    // touchesBegan 에서는 시작 점을 첫 line으로 add한다
    YBPoint *startPoint = [YBPoint YBPointWithPoint:point];
    YBPoint *endPoint = [YBPoint YBPointWithPoint:point];
    
    YBLine *line = [YBLine YBLineWithStartPoint:startPoint endPoint:endPoint];

    [lines addObject:line];
    
    if (recordMode) {
        NSDate *time = [NSDate date];
        LineWithTime *lineWithTime = [LineWithTime LineWithTime:line Time:time];
        [recordedLines addObject:lineWithTime];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 이전 line의 마지막 포인트를 start point로 하고 움직인 포인트를 end point로 한다
    UITouch *touch = [touches anyObject];
    YBPoint *point = [YBPoint YBPointWithPoint:[touch locationInView:self]];
    YBLine *previousLine = [lines lastObject];
    YBLine *line = [YBLine YBLineWithStartPoint:[previousLine endPoint] endPoint:point];
    
    [lines addObject:line];
    
    if (recordMode) {
        NSDate *time = [NSDate date];
        LineWithTime *lineWithTime = [LineWithTime LineWithTime:line Time:time];
        [recordedLines addObject:lineWithTime];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
}

- (void)record
{
    recordedLines = nil;
    recordedLines = [[NSMutableArray alloc] init];
    recordMode = YES;
}
- (void)clear
{
    lines = nil;
    lines = [[NSMutableArray alloc] init];
    [self setNeedsDisplay];
}

//TODO 현재 line 별 time interval을 사용하지 않고 정해진 시간(0.1)마다 tiemr 발동
- (void)play
{
    // record mode 이거나 recode 된 line이 없다면 play하지 않는다
    if (recordMode || ![recordedLines count]) {
        return;
    }
    
    [self clear];
    
    index = 0;
    
    // 0.1 초마다 timer가 동작하면서 line을 그린다
    timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(handleTimer) userInfo:nil repeats:YES];
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)handleTimer
{
    [lines addObject:[[recordedLines objectAtIndex:index++] line]];
    [self setNeedsDisplay];
    
    if ([recordedLines count] == index) {
        [timer invalidate];
        timer = nil;
    }
}

- (void) stop
{
    recordMode = NO;
}
@end
