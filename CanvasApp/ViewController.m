//
//  ViewController.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 1..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "ViewController.h"
#import "YBCanvas.h"

@interface ViewController ()

@end

@implementation ViewController
{
    YBCanvas *canvas;
}

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        canvas = nil;
    }
    
    return self;
}
-(void)dealloc
{
    [canvas release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize screenSize = [[self view] bounds].size;
    canvas = [[YBCanvas alloc]
              initWithFrame:CGRectMake(0, 120, screenSize.width, screenSize.height-200)];
    [[self view] addSubview:canvas];
    [canvas setBackgroundColor:[UIColor yellowColor]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)record:(id)sender
{
    [canvas record];
}
- (IBAction)play:(id)sender
{
    [canvas play];
}
- (IBAction)stop:(id)sender
{
    [canvas stop];
}
- (IBAction)clear:(id)sender
{
    [canvas clear];
}

- (IBAction)cancel:(id)sender
{
    NSLog(@"cancel");
}
@end
