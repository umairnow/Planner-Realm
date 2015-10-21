//
//  Transaction.m
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

+ (NSString *)primaryKey {
    return @"transId";
}

+ (NSArray *)requiredProperties {
    return @[@"name"];
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"transId": @([NSObject addAndGetForClass:[self class]]), @"transactionDate": [NSDate date], @"updatedDate": [NSDate date]};
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"Transaction description:%@\n transactionValue: %@\ntransactionDate: %@\nupdatedDate: %@\ntransactionCategory: %@",[super description], self.transactionValue, self.transactionDate, self.updatedDate, self.category];
}


@end
