//
//  RealmManager.m
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "RealmManager.h"

@interface RealmManager ()

@property (strong, nonatomic) RLMRealm *realm;

@end

@implementation RealmManager

#pragma mark - Life Cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.realm = [RLMRealm defaultRealm];
    }
    return self;
}

- (void)dealloc {
    self.realm = nil;
}

#pragma mark - Get Data

- (RLMResults<TransactionCategory *> *)getAllIncomes {
    return [self getTransactionsWhere:@"isIncome = 1"];
}

- (RLMResults<TransactionCategory *> *)getAllExpenses {
    return [self getTransactionsWhere:@"isIncome = 0"];
}

- (RLMResults<TransactionCategory *> *)recurringIncomes {
    return [self getTransactionsWhere:@"isIncome = 1 AND isRecurring = 1"];
}

- (RLMResults<TransactionCategory *> *)nonRecurringIncomes {
    return [self getTransactionsWhere:@"isIncome = 1 AND isRecurring = 0"];
}

- (RLMResults<TransactionCategory *> *)recurringExpenses {
    return [self getTransactionsWhere:@"isIncome = 0 AND isRecurring = 1"];
}

- (RLMResults<TransactionCategory *> *)nonRecurringExpenses {
    return [self getTransactionsWhere:@"isIncome = 0 AND isRecurring = 0"];
}

- (RLMResults<TransactionCategory *> *)getTransactionsWhere:(NSString *)where {
    RLMResults<TransactionCategory *> *results = [[TransactionCategory objectsWhere:where] sortedResultsUsingProperty:@"name" ascending:NO];
    return results;
}

- (BankAccount *)getAccountInfo {
    BankAccount *bankAccount = [[BankAccount allObjects] lastObject];
    if (!bankAccount) {
        bankAccount = [BankAccount new];
        [self saveAccount:bankAccount withParameters:@{@"currency": @"USD",
                                                       @"accountTitle": @"Umair Aamir",
                                                       @"accountNumber": @"IPL23439992",
                                                       @"bankName": @"Standard Chartered Bank Ltd.",
                                                       @"branchName": @"Garden Town Branch",
                                                       @"branchAddress": @"Main Boulevard Garden Town Lahore",
                                                       @"balance": @(2000),
                                                       @"branchCode": @(3299)}];
    }
    return bankAccount;
}

#pragma mark - Write Data

- (void)saveAccount:(BankAccount *)bankAccount withParameters:(NSDictionary*)paramters {
    [self.realm beginWriteTransaction];
    bankAccount.currency = paramters[@"currency"];
    bankAccount.accountTitle = paramters[@"accountTitle"];
    bankAccount.accountNumber = paramters[@"accountNumber"];
    bankAccount.bankName = paramters[@"bankName"];
    bankAccount.branchName = paramters[@"branchName"];
    bankAccount.branchAddress = paramters[@"branchAddress"];
    bankAccount.balance = paramters[@"balance"];
    bankAccount.branchCode = paramters[@"branchCode"];
    [BankAccount createOrUpdateInRealm:self.realm withValue:bankAccount];
    [self.realm commitWriteTransaction];
}

- (void)saveTransaction:(TransactionCategory *)transactionCategory {
    [self.realm beginWriteTransaction];
    [TransactionCategory createInRealm:self.realm withValue:transactionCategory];
    [self.realm commitWriteTransaction];
}

- (void)updateTransaction:(TransactionCategory *)trans withValues:(NSDictionary *)parameters {
    [self.realm beginWriteTransaction];
    trans.name = parameters[@"name"];
    trans.transactionValue = parameters[@"value"];
    trans.isRecurring = parameters[@"recurring"];
    trans.updatedDate = [NSDate date];
    [TransactionCategory createOrUpdateInRealm:self.realm withValue:trans];
    [self.realm commitWriteTransaction];
}

- (void)deleteTransaction:(TransactionCategory *)transactionCategory {
    [self.realm beginWriteTransaction];
    [self.realm deleteObject:transactionCategory];
    [self.realm commitWriteTransaction];
}

@end
