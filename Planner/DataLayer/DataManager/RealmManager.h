//
//  RealmManager.h
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <Realm/Realm.h>
#import "TransactionCategories.h"
#import "BankAccount.h"

@interface RealmManager : NSObject

@property (strong, nonatomic) RLMArray<TransactionCategories *> *transactionsCategories;

- (RLMResults *)getAllIncomes;
- (RLMResults *)getAllExpenses;
- (BankAccount *)getAccountInfo;

- (void)saveAccount:(BankAccount *)bankAccount;
@end
