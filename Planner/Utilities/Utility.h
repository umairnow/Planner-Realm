//
//  SRUtility.h
//  StudentsRecord
//
//  Created by Umair Aamir on 25/05/2015.
//  Copyright (c) 2015 ExcelTech Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionCategory.h"

#define utility [Utility sharedInstance]

@interface Utility : NSObject

/**
 * singleton method
 **/
+ (instancetype)sharedInstance;

/**
 * show error message
 **/
- (void)showErrorMessageBarWithTitle:(NSString *)title andMessage:(NSString *)message;

/**
 * converts RLMResults to RLMArray
 **/
- (RLMArray<TransactionCategory *> *)convertToArray:(RLMResults<TransactionCategory *> *)results;

/**
 * Calculate and return the monthly and yearly amount on recurring and non recurring basis
 **/
- (double)calculateAmountMonthly:(BOOL)isMonthly from:(TransactionCategory *)transactionCategory;

/**
 * Return total yearly amount on basis of recurring and non recurring
 **/
- (double)totalYearlyRecurring:(BOOL)isRecurring fromResults:(RLMResults *)results;

/**
 * Return total amount for given on basis of recurring and non recurring
 **/
- (double)totalRecurring:(BOOL)isRecurring forMonths:(NSInteger)months fromResults:(RLMResults *)results;

/**
 * Return total monthly amount on basis of recurring and non recurring
 **/
- (double)totalMonthlyRecurring:(BOOL)isRecurring fromResults:(RLMResults *)results;

@end
