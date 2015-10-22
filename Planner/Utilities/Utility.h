//
//  SRUtility.h
//  StudentsRecord
//
//  Created by Umair Aamir on 25/05/2015.
//  Copyright (c) 2015 ExcelTech Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionCategory.h"

#define utility [Utility sharedInstance]

@interface Utility : NSObject

/**
 * singleton method
 **/
+ (instancetype)sharedInstance;

/**
 * show error message
 **/
- (void)showErrorMessageBarWithTitle:(NSString *)title andMessage:(NSString *)message;

/**
 * converts RLMResults to RLMArray
 **/
- (RLMArray<TransactionCategory *> *)convertToArray:(RLMResults<TransactionCategory *> *)results;

@end
