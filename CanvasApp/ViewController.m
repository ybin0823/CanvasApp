//
//  ViewController.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:[self view]];
    NSLog(@"x : %f, y : %f", point.x, point.y);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");
    
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:[self view]];
    NSLog(@"x : %f, y : %f", point.x, point.y);
    
    UIView *rect = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 5, 5)];
    [rect setBackgroundColor:[UIColor redColor]];
    
    [[self view] addSubview:rect];
    
    [[self view] setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
}

@end
