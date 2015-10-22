//
//  TransactionCategories.m
//  Planner
//
//  Created by Umair Aamir on 10/21/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "TransactionCategory.h"

@implementation TransactionCategory

+ (NSString *)primaryKey {
    return @"categoryId";
}

+ (NSArray *)requiredProperties {
    return @[@"name"];
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"categoryId": @([NSObject addAndGetForClass:[self class]]), @"transactionDate": [NSDate date], @"updatedDate": [NSDate date]};
}

@end
