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
    self.transactionCategories = [utility convertToArray:[self.realmManager getAllExpenses]];
    [self.tableView reloadData];
    [self updateSum];
}

- (void)updateSum {
    double totalMonthly = [utility totalMonthlyRecurring:YES fromResults:[self.realmManager recurringExpenses]] + [utility totalMonthlyRecurring:NO fromResults:[self.realmManager nonRecurringExpenses]];
    lblExpenses.text = [NSString stringWithFormat:@"%.1f", totalMonthly];
    double totalYearly = [utility totalYearlyRecurring:YES fromResults:[self.realmManager recurringExpenses]] + [utility totalYearlyRecurring:NO fromResults:[self.realmManager nonRecurringExpenses]];
    lblExpensesYearly.text = [NSString stringWithFormat:@"%.1f", totalYearly];
}

#pragma mark - Action Handlers

- (IBAction)cancelAddExpense:(UIStoryboardSegue *)sender {
    
}

@end
