//
//  RealmManager.m
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "RealmManager.h"

@implementation RealmManager

- (RLMResults *)getAllIncomes {
    RLMResults *results = [[TransactionCategories objectsWhere:@"isIncome = 1"] sortedResultsUsingProperty:@"name" ascending:NO];
    return results;
}

- (RLMResults *)getAllExpenses {
    RLMResults *results = [[TransactionCategories objectsWhere:@"isIncome = 0"] sortedResultsUsingProperty:@"name" ascending:NO];
    return results;
}



@end
