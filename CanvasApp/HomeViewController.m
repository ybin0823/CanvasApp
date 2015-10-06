//
//  HomeViewController.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 5..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *drawButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_create_white.png"] style:UIBarButtonItemStylePlain target:self action:@selector(drawButtonClicked)];
    [drawButton setTintColor:[UIColor colorWithRed:255 green:0 blue:255 alpha:0.5]];
    [[self navigationItem] setRightBarButtonItem:drawButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)drawButtonClicked
{
    ViewController *drawViewController = [[[ViewController alloc] init] autorelease];
    [[self navigationController] pushViewController:drawViewController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
