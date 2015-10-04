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
              initWithFrame:CGRectMake(0, 20, screenSize.width, screenSize.height)];
    [[self view] addSubview:canvas];
    [canvas setBackgroundColor:[UIColor yellowColor]];
    
    // Set toolbar items;
    [self configureToolbarItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)configureToolbarItems
{
    UIBarButtonItem *recordButton = [[UIBarButtonItem alloc] initWithTitle:@"Record" style:UIBarButtonItemStylePlain target:self action:@selector(record)];
    UIBarButtonItem *playButton = [[UIBarButtonItem alloc] initWithTitle:@"Play" style:UIBarButtonItemStylePlain target:self action:@selector(play)];
    UIBarButtonItem *stopButton = [[UIBarButtonItem alloc] initWithTitle:@"Stop" style:UIBarButtonItemStylePlain target:self action:@selector(stop)];
    UIBarButtonItem *clearButton = [[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStylePlain target:self action:@selector(clear)];
    
    self.navigationController.toolbarHidden = NO;
    self.toolbarItems = [NSArray arrayWithObjects:recordButton, playButton, stopButton, clearButton, nil];
}

- (void)record
{
    NSLog(@"Record");
}
- (void)play
{
    NSLog(@"Play");
}
- (void)stop
{
    NSLog(@"Stop");
}
- (void)clear
{
    [canvas clear];
    NSLog(@"Clear");
}
@end
