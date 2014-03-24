//
//  ViewController.m
//  JXDSegmentedControl
//
//  Created by JiangXiaodong on 3/24/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ViewController.h"

#import "JXDSegmentedControl.h"

#import "SegmentOneViewController.h"
#import "SegmentTwoViewController.h"

#define IS_IOS_7 ( [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0 ? YES : NO )


@interface ViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) SegmentOneViewController  *oneViewController;
@property (nonatomic, strong) SegmentTwoViewController  *twoViewController;

@property (nonatomic, assign) BOOL sort_isDown;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];

    NSArray * items = [[NSArray alloc] initWithObjects:@"销量",@"价格▽",nil];
    self.segmentedControl = [[JXDSegmentedControl alloc] initWithItems:items];
    self.segmentedControl.frame = CGRectMake(20.0, 6.0, 280.0, 28.0);
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(segmentedControlChange:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.tintColor = [UIColor colorWithRed:(115/255.0) green:(124/255.0) blue:(132/255.0) alpha:1.0];
    [self.view addSubview:self.segmentedControl];

    self.oneViewController = [[SegmentOneViewController alloc] init];
    UIViewController *viewController = [self viewControllerForSegmentIndex:self.segmentedControl.selectedSegmentIndex];
    if (IS_IOS_7) viewController.view.frame = CGRectMake(0.0, 40.0, 320.0, [[UIScreen mainScreen] bounds].size.height - 40.0);
    else viewController.view.frame = CGRectMake(0.0, 40.0, 320.0, [[UIScreen mainScreen] bounds].size.height );
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    self.currentViewController = viewController;


}

- (void)segmentedControlChange : (UISegmentedControl *)sender
{
    if (self.oneViewController.view.window) {
        if (sender.selectedSegmentIndex == 1) {
            [self switchViewController:sender];
        }
    }else if (self.twoViewController.view.window){
        if (sender.selectedSegmentIndex == 0) {
            [self switchViewController:sender];
        }else if (sender.selectedSegmentIndex == 1){
            if (self.sort_isDown) {
                [self.segmentedControl setTitle:@"价格△" forSegmentAtIndex:1];
            }else{
                [self.segmentedControl setTitle:@"价格▽" forSegmentAtIndex:1];
            }
            self.sort_isDown = !self.sort_isDown;
        }
    }
}

- (void)switchViewController : (UISegmentedControl *) sender
{
    UIViewController *viewController = [self viewControllerForSegmentIndex:sender.selectedSegmentIndex];
    [self addChildViewController:viewController];
    [self transitionFromViewController:self.currentViewController
                      toViewController:viewController
                              duration:0.0
                               options:UIViewAnimationOptionTransitionNone
                            animations:^{
                                [self.currentViewController.view removeFromSuperview];
                                viewController.view.frame = CGRectMake(0.0, 40.0, 320.0, [[UIScreen mainScreen] bounds].size.height - 40.0 - 64.0);
                                [self.view addSubview:viewController.view];
                            } completion:^(BOOL finished) {
                                [viewController didMoveToParentViewController:self];
                                [self.currentViewController removeFromParentViewController];
                                self.currentViewController = viewController;
                            }];
}

- (UIViewController *)viewControllerForSegmentIndex:(NSInteger)index
{
    UIViewController *viewController;
    switch (index) {
        case 0:
            if (!self.oneViewController){
                self.oneViewController = [[SegmentOneViewController alloc] init];
            }
            viewController = self.oneViewController;
            break;
        case 1:
            if (!self.twoViewController){
                self.twoViewController = [[SegmentTwoViewController alloc] init];
            }
            viewController = self.twoViewController;
            break;
    }

    return viewController;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
