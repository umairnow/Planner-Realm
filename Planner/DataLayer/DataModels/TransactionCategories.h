//  TransactionCategories.h
//  Planner
//
//  Created by Umair Aamir on 10/21/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <Realm/Realm.h>
#import "Transaction.h"

RLM_ARRAY_TYPE(TransactionCategories)

@interface TransactionCategories : RLMObject

@property (assign, nonatomic) NSNumber<RLMInt> *categoryId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber<RLMBool> *isIncome;
@property (strong, nonatomic) NSNumber<RLMBool> *isRecurring;

@property RLMArray<Transaction *><Transaction> *transactions;

@end

