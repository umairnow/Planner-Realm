//  TransactionCategories.h
//  Planner
//
//  Created by Umair Aamir on 10/21/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <Realm/Realm.h>

RLM_ARRAY_TYPE(TransactionCategory)

@interface TransactionCategory : RLMObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *updatedDate;
@property (strong, nonatomic) NSDate *transactionDate;
@property (strong, nonatomic) NSNumber<RLMBool> *isIncome;
@property (assign, nonatomic) NSNumber<RLMInt> *categoryId;
@property (strong, nonatomic) NSNumber<RLMBool> *isRecurring;
@property (strong, nonatomic) NSNumber<RLMDouble> *transactionValue;

@end

