//  Transaction.h
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <Realm/Realm.h>

RLM_ARRAY_TYPE(Transaction)

@class TransactionCategories;

@interface Transaction : RLMObject

@property (assign, nonatomic) NSNumber<RLMInt> *transId;
@property (strong, nonatomic) NSNumber<RLMDouble> *transactionValue;
@property (strong, nonatomic) NSDate *transactionDate;
@property (strong, nonatomic) NSDate *updatedDate;

@property (strong, nonatomic) TransactionCategories *category;

@end
