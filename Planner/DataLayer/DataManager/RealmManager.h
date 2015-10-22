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

- (RLMResults<TransactionCategory *> *)getAllIncomes;
- (RLMResults<TransactionCategory *> *)getAllExpenses;
- (BankAccount *)getAccountInfo;

/**
 * Save or update bank account
 **/
- (void)saveAccount:(BankAccount *)bankAccount;

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
