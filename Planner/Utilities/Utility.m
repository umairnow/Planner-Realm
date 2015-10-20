//
//  SRUtility.m
//  StudentsRecord
//
//  Created by Umair Aamir on 25/05/2015.
//  Copyright (c) 2015 ExcelTech Limited. All rights reserved.
//

#import "Utility.h"
#import "TWMessageBarManager.h"
#import "MessageBarStyleSheet.h"

@interface SRUtility ()
@property (nonatomic, strong) TWMessageBarManager *messageBarManager;
@end

@implementation SRUtility

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
    static SRUtility *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[SRUtility alloc] init];
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


#pragma mark - Getter




@end
