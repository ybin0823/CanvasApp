//
//  HomeViewController.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 5..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqualToString:@"AddDrawing"]) {
        UINavigationController *navigationController = [segue.destinationViewController retain];
        ViewController *drawViewController = [[[navigationController viewControllers] objectAtIndex:0] retain];
        drawViewController.delegate = self;
    }
}

- (void) drawViewControllerDidCancle:(ViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
