//
//  VCAddExpense.m
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCAddExpense.h"

@interface VCAddExpense ()

@property (strong, nonatomic) RealmManager *realmManager;

@end

@implementation VCAddExpense

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeVariables];
    [self configureView];
}

#pragma mark - Load Data

- (void)initializeVariables {
    self.realmManager = [RealmManager new];
}

- (void)configureView {
    if (!self.transactionCategory) {
        return;
    }
    tfExpenseName.text = self.transactionCategory.name;
    tfExpenseValue.text = [NSString stringWithFormat:@"%@", self.transactionCategory.transactionValue];
    switchRecurring.on = self.transactionCategory.isRecurring.boolValue;
}

#pragma mark - Action Handlers

- (IBAction)saveActionHandler:(UIBarButtonItem *)sender {
    if (![self areFieldsValid]) {
        return;
    }
    
    if (self.transactionCategory) {
        [self.realmManager updateTransaction:self.transactionCategory
                                  withValues:@{@"name": tfExpenseName.text,
                                               @"value": @(tfExpenseValue.text.doubleValue),
                                               @"recurring": @(switchRecurring.on)}];
    } else {
        TransactionCategory *transCategory = [TransactionCategory new];
        transCategory.isIncome = @(0);
        transCategory.isRecurring = @(switchRecurring.on);
        transCategory.name = tfExpenseName.text;
        transCategory.transactionValue = @(tfExpenseValue.text.doubleValue);
        
        [self.realmManager saveTransaction:transCategory];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Helping Methods

- (BOOL)areFieldsValid {
    if (!tfExpenseName.isValid) {
        [utility showErrorMessageBarWithTitle:TITLE_VALIDATION_FAILED andMessage:MESSAGE_EXPENSE_VALIDATION_FAILED];
        return NO;
    }
    if (!tfExpenseValue.isValid) {
        [utility showErrorMessageBarWithTitle:TITLE_VALIDATION_FAILED andMessage:MESSAGE_EXPENSEVALUE_VALIDATION_FAILED];
        return NO;
    }
    return YES;
}

@end
