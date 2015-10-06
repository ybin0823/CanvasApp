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
    [canvas setBackgroundColor:[UIColor whiteColor]];

    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:255 green:0 blue:255 alpha:0.5]];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
//    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    // Set toolbar items;
    [self configureToolbarItems];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.toolbarHidden = YES;
}

- (void)configureToolbarItems
{
    UIBarButtonItem *flexibleSpaceButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
    
    UIBarButtonItem *recordButton = [[[UIBarButtonItem alloc] initWithTitle:@"Record" style:UIBarButtonItemStylePlain target:self action:@selector(record)] autorelease];
    [recordButton setTintColor:[UIColor colorWithRed:125 green:0 blue:125 alpha:0.5]];
    
    UIBarButtonItem *playButton = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_play_arrow_white.png"] style:UIBarButtonItemStylePlain target:self action:@selector(play)] autorelease];
    [playButton setTintColor:[UIColor colorWithRed:125 green:0 blue:125 alpha:0.5]];
    
    UIBarButtonItem *stopButton = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_stop_white.png"] style:UIBarButtonItemStylePlain target:self action:@selector(stop)] autorelease];
    [stopButton setTintColor:[UIColor colorWithRed:125 green:0 blue:125 alpha:0.5]];
    
    UIBarButtonItem *clearButton = [[[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStylePlain target:self action:@selector(clear)] autorelease];
    [clearButton setTintColor:[UIColor colorWithRed:125 green:0 blue:125 alpha:0.5]];
    
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    self.toolbarItems = [NSArray arrayWithObjects:recordButton,
                         flexibleSpaceButtonItem, playButton, flexibleSpaceButtonItem,
                         stopButton, flexibleSpaceButtonItem, clearButton, nil];
}

- (void)record
{
    [canvas record];
}
- (void)play
{
    [canvas play];
}
- (void)stop
{
    [canvas stop];
}
- (void)clear
{
    [canvas clear];
}
@end
