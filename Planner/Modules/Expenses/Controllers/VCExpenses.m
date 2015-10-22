//
//  VCExpenses.m
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCExpenses.h"

@interface VCExpenses ()

@end

@implementation VCExpenses

#pragma mark - Helping Methods

- (void)loadTransactions {
    RLMResults *results = [self.realmManager getAllExpenses];
    self.transactionCategories = [utility convertToArray:results];
    [self.tableView reloadData];
    [self updateSum];
}

- (void)updateSum {
    lblExpenses.text = [NSString stringWithFormat:@"%@", [[self.realmManager getAllExpenses] sumOfProperty:@"transactionValue"]];
}

#pragma mark - Action Handlers

- (IBAction)cancelAddExpense:(UIStoryboardSegue *)sender {
    
}

@end
