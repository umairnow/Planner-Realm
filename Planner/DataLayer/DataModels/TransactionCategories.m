//
//  TransactionCategories.m
//  Planner
//
//  Created by Umair Aamir on 10/21/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "TransactionCategories.h"

@implementation TransactionCategories

+ (NSString *)primaryKey {
    return @"categoryId";
}

+ (NSArray *)requiredProperties {
    return @[@"name"];
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"categoryId": @([NSObject addAndGetForClass:[self class]])};
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"TransactionCategories description:%@\n categoryId: %@\nname: %@\nisIncome: %@\nisRecurring: %@\ntransactions: %@\n",[super description], self.categoryId, self.name, self.isIncome, self.isRecurring, self.transactions];
}

@end
