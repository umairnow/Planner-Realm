//
//  RealmManager.h
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <Realm/Realm.h>
#import "TransactionCategory.h"
#import "BankAccount.h"

@interface RealmManager : NSObject

/**
 * Get All Incomes
 **/
- (RLMResults<TransactionCategory *> *)getAllIncomes;

/**
 * Get All Expenses
 **/
- (RLMResults<TransactionCategory *> *)getAllExpenses;

/**
 * Get All Recurring Incomes
 **/
- (RLMResults<TransactionCategory *> *)recurringIncomes;

/**
 * Get All Non Recurring Incomes
 **/
- (RLMResults<TransactionCategory *> *)nonRecurringIncomes;

/**
 * Get All Recurring Expenses
 **/
- (RLMResults<TransactionCategory *> *)recurringExpenses;

/**
 * Get All Non Recurring Expenses
 **/
- (RLMResults<TransactionCategory *> *)nonRecurringExpenses;

/**
 * Get Account Information
 **/
- (BankAccount *)getAccountInfo;

/**
 * Save or update bank account
 **/
- (void)saveAccount:(BankAccount *)bankAccount withParameters:(NSDictionary*)paramters;

/**
 * Create new transaction
 **/
- (void)saveTransaction:(TransactionCategory *)transactionCategory;

/**
 * Update transaction
 **/
- (void)updateTransaction:(TransactionCategory *)trans withValues:(NSDictionary *)parameters;

/**
 * Delete transaction from database
 **/
- (void)deleteTransaction:(TransactionCategory *)transactionCategory;

@end
