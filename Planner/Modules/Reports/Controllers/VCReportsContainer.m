//
//  VCReportsContainer.m
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCReportsContainer.h"
#import "VCAccountsPlan.h"
#import "VCCharts.h"

@interface VCReportsContainer ()
@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) VCAccountsPlan *vcAccountsPlan;
@property (strong, nonatomic) VCCharts *vcCharts;
@property (assign, nonatomic) BOOL transitionInProgress;
@end

@implementation VCReportsContainer

static NSString *const SEGUE_ACCOUNTS_PLAN  = @"SEGUEACCOUNTSPLAN";
static NSString *const SEGUE_CHARTS         = @"SEGUECHARTS";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.transitionInProgress = NO;
    self.currentSegueIdentifier = SEGUE_ACCOUNTS_PLAN;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)dealloc
{
    self.currentSegueIdentifier = nil;
    self.vcAccountsPlan = nil;
    self.vcCharts = nil;
}

#pragma mark - Segue Handlers

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if ([segue.identifier isEqualToString:SEGUE_ACCOUNTS_PLAN]) {
        self.vcAccountsPlan = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:SEGUE_CHARTS]) {
        self.vcCharts = segue.destinationViewController;
    }
    
    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:SEGUE_ACCOUNTS_PLAN]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.vcAccountsPlan];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    // By definition the second view controller will always be swapped with the
    // first one.
    else if ([segue.identifier isEqualToString:SEGUE_CHARTS]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.vcCharts];
    }
}

#pragma mark - Helping Methods

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if (self.transitionInProgress) {
        return;
    }
    
    self.transitionInProgress = YES;
    self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:SEGUE_ACCOUNTS_PLAN]) ? SEGUE_CHARTS : SEGUE_ACCOUNTS_PLAN;
    
    if (([self.currentSegueIdentifier isEqualToString:SEGUE_ACCOUNTS_PLAN]) && self.vcAccountsPlan) {
        [self swapFromViewController:self.vcCharts toViewController:self.vcAccountsPlan];
        return;
    }
    
    if (([self.currentSegueIdentifier isEqualToString:SEGUE_CHARTS]) && self.vcCharts) {
        [self swapFromViewController:self.vcAccountsPlan toViewController:self.vcCharts];
        return;
    }
    
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

@end
