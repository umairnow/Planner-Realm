//
//  VCCharts.m
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCReports.h"
#import "VCReportsContainer.h"

@interface VCReports ()

@property (strong, nonatomic) VCReportsContainer *vcReportsContainer;
@end

@implementation VCReports

- (void)dealloc {
    self.vcReportsContainer = nil;
}

#pragma mark - Action Handler

- (IBAction)segmentedControlValueChanged:(id)sender {
    [self.vcReportsContainer swapViewControllers];
}

#pragma mark - Segue Action Handler

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.vcReportsContainer = segue.destinationViewController;
}

@end
