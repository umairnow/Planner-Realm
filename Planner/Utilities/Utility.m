//
//  Utility.m
//  Planner
//
//  Created by Umair Aamir on 25/05/2015.
//  Copyright (c) 2015 ExcelTech Limited. All rights reserved.
//

#import "Utility.h"
#import "TWMessageBarManager.h"
#import "MessageBarStyleSheet.h"

@interface Utility ()
@property (nonatomic, strong) TWMessageBarManager *messageBarManager;
@end

@implementation Utility

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.messageBarManager  = [TWMessageBarManager sharedInstance];
    }
    return self;
}

- (void)dealloc
{
    self.messageBarManager = nil;
}

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static Utility *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[Utility alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Other Methods

- (void)showSuccessMessageBarWithTitle:(NSString *)title andMessage:(NSString *)message
{
    [self showMessageBarWithTitle:title andMessage:message andType:TWMessageBarMessageTypeSuccess];
}

- (void)showErrorMessageBarWithTitle:(NSString *)title andMessage:(NSString *)message
{
    [self showMessageBarWithTitle:title andMessage:message andType:TWMessageBarMessageTypeError];
}

- (void)showMessageBarWithTitle:(NSString *)title andMessage:(NSString *)message andType:(TWMessageBarMessageType )messageType
{
    [self.messageBarManager showMessageWithTitle:title description:message type:messageType];
}

#pragma mark - Helping Methods

- (NSString *)directoryPath
{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:@"AppImages"];
}

- (NSURL *)directoryURL
{
    return [NSURL fileURLWithPath:[self directoryPath] isDirectory:YES];
}

#pragma mark - Database Related Methods

- (RLMArray<TransactionCategory *> *)convertToArray:(RLMResults<TransactionCategory *> *)results {
    RLMArray<TransactionCategory *> *resultArray = [[RLMArray alloc] initWithObjectClassName:@"TransactionCategory"];
    [resultArray addObjects:results];
    return resultArray;
}

- (double)calculateAmountMonthly:(BOOL)isMonthly from:(TransactionCategory *)transactionCategory {
    if (!transactionCategory.isRecurring.boolValue) {
        return isMonthly?(transactionCategory.transactionValue.doubleValue/12):(transactionCategory.transactionValue.doubleValue);
    } else {
        return isMonthly?(transactionCategory.transactionValue.doubleValue):(transactionCategory.transactionValue.doubleValue*12);
    }
}

- (double)totalYearlyRecurring:(BOOL)isRecurring fromResults:(RLMResults *)results {
    return [self totalRecurring:isRecurring forMonths:12 fromResults:results];
}

- (double)totalRecurring:(BOOL)isRecurring forMonths:(NSInteger)months fromResults:(RLMResults *)results {
    if (isRecurring) {
        return [results sumOfProperty:@"transactionValue"].doubleValue * months;
    }
    return [results sumOfProperty:@"transactionValue"].doubleValue;
}

- (double)totalMonthlyRecurring:(BOOL)isRecurring fromResults:(RLMResults *)results {
    if (isRecurring) {
        return [results sumOfProperty:@"transactionValue"].doubleValue;
    }
    return [results sumOfProperty:@"transactionValue"].doubleValue / 12;
}

@end
