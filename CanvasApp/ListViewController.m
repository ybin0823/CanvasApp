//
//  ListViewController.m
//  CanvasApp
//
//  Created by Jang Young bin on 2015. 10. 5..
//  Copyright © 2015년 Jang Young bin. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@", segue.identifier);
    if ([segue.identifier isEqualToString:@"AddDrawing"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ViewController *drawViewController = [[navigationController viewControllers] objectAtIndex:0];
        drawViewController.delegate = self;
    }
}

- (void) drawViewControllerDidCancle:(ViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
