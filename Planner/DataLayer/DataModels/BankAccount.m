//
//  BankAccount.m
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount

- (NSString *)description
{
    return [NSString stringWithFormat:@"BankAccount description:%@\n accountTitle: %@\naccountNumber: %@\nbankName: %@\nbranchName: %@\nbranchCode: %@\nbranchAddress: %@\namount: %@\n",[super description], self.accountTitle, self.accountNumber, self.bankName, self.branchName, self.branchCode, self.branchAddress, self.amount];
}

- (void)dealloc
{
    self.accountTitle = nil;
    self.accountNumber = nil;
    self.bankName = nil;
    self.branchName = nil;
    self.branchCode = nil;
    self.branchAddress = nil;
    self.amount = nil;
}

@end
