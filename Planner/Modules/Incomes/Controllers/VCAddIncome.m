//
//  VCAddIncome.m
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCAddIncome.h"

@interface VCAddIncome ()

@property (strong, nonatomic) RealmManager *realmManager;
@end

@implementation VCAddIncome

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
    tfIncomeName.text = self.transactionCategory.name;
    tfIncomeValue.text = [NSString stringWithFormat:@"%@", self.transactionCategory.transactionValue];
    switchRecurring.on = self.transactionCategory.isRecurring.boolValue;
}

#pragma mark - Action Handlers

- (IBAction)saveActionHandler:(UIBarButtonItem *)sender {
    if (![self areFieldsValid]) {
        return;
    }
    if (self.transactionCategory) {
        [self.realmManager updateTransaction:self.transactionCategory
                                  withValues:@{@"name": tfIncomeName.text,
                                               @"value": @(tfIncomeValue.text.doubleValue),
                                               @"recurring": @(switchRecurring.on)}];
    } else {
        TransactionCategory *transCategory = [TransactionCategory new];
        transCategory.isIncome = @(1);
        transCategory.isRecurring = @(switchRecurring.on);
        transCategory.name = tfIncomeName.text;
        transCategory.transactionValue = @(tfIncomeValue.text.doubleValue);
        
        [self.realmManager saveTransaction:transCategory];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Helping Methods

- (BOOL)areFieldsValid {
    if (!tfIncomeName.isValid) {
        [utility showErrorMessageBarWithTitle:TITLE_VALIDATION_FAILED andMessage:MESSAGE_INCOME_VALIDATION_FAILED];
        return NO;
    }
    if (!tfIncomeValue.isValid) {
        [utility showErrorMessageBarWithTitle:TITLE_VALIDATION_FAILED andMessage:MESSAGE_INCOMEVALUE_VALIDATION_FAILED];
        return NO;
    }
    return YES;
}

@end
