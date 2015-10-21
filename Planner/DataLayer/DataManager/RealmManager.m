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

- (void)dealloc
{
    self.realm = nil;
}

#pragma mark - Get Data

- (RLMResults *)getAllIncomes {
    RLMResults *results = [[TransactionCategories objectsWhere:@"isIncome = 1"] sortedResultsUsingProperty:@"name" ascending:NO];
    return results;
}

- (RLMResults *)getAllExpenses {
    RLMResults *results = [[TransactionCategories objectsWhere:@"isIncome = 0"] sortedResultsUsingProperty:@"name" ascending:NO];
    return results;
}

- (BankAccount *)getAccountInfo {
    BankAccount *bankAccount = [BankAccount objectForPrimaryKey:@(1)];
    if (!bankAccount) {
        bankAccount = [BankAccount new];
        bankAccount.currency = @"USD";
        bankAccount.accountTitle = @"Umair Aamir";
        bankAccount.accountNumber = @"IPL23439992";
        bankAccount.bankName = @"Standard Chartered Bank Ltd.";
        bankAccount.branchName = @"Garden Town Branch";
        bankAccount.branchAddress = @"Main Boulevard Garden Town Lahore";
        bankAccount.balance = @(2000);
        bankAccount.branchCode = @(3299);
        [self saveAccount:bankAccount];
    }
    return bankAccount;
}

#pragma mark - Write Data

- (void)saveAccount:(BankAccount *)bankAccount {
    [self.realm beginWriteTransaction];
    [BankAccount createOrUpdateInRealm:self.realm withValue:bankAccount];
    [self.realm commitWriteTransaction];
}

@end
