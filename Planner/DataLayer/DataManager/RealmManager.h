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

- (RLMResults *)getAllIncomes;
- (RLMResults *)getAllExpenses;
- (BankAccount *)getAccountInfo;

- (void)saveAccount:(BankAccount *)bankAccount;
@end
