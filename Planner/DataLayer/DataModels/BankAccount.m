//
//  BankAccount.m
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount

+ (NSString *)primaryKey {
    return @"accountId";
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"accountId": @(1)};
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"BankAccount description:%@\n accountTitle: %@\naccountNumber: %@\nbankName: %@\nbranchName: %@\nbranchCode: %@\nbranchAddress: %@\nbalance: %@\n",[super description], self.accountTitle, self.accountNumber, self.bankName, self.branchName, self.branchCode, self.branchAddress, self.balance];
}

@end
