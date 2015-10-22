//
//  VCUpdateAccount.m
//  Planner
//
//  Created by Umair Aamir on 10/21/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCUpdateAccount.h"

@interface VCUpdateAccount ()

@property (strong, nonatomic) RealmManager *realmManager;

@end

@implementation VCUpdateAccount

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeVariables];
    [self configureView];
}

#pragma mark - Load Data

- (void)initializeVariables {
    self.realmManager = [RealmManager new];
}

- (void)configureView {
    tfCurrency.text = self.bankAccount.currency;
    tfAccountBalance.text = [NSString stringWithFormat:@"%@", self.bankAccount.balance?:@""];
    tfAccountTitle.text = self.bankAccount.accountTitle;
    tfAccountNumber.text = self.bankAccount.accountNumber;
    tfBankName.text = self.bankAccount.bankName;
    tfBranchName.text = self.bankAccount.branchName;
    tfBranchCode.text = [NSString stringWithFormat:@"%@", self.bankAccount.branchCode?:@""];
    tfBranchAddress.text = self.bankAccount.branchAddress;
}

#pragma mark - Action Handlers

- (IBAction)saveActionHandler:(UIBarButtonItem *)sender {
    
    if (![self areFieldsValid]) {
        return;
    }
    
    self.bankAccount = [BankAccount new];
    self.bankAccount.currency = tfCurrency.text;
    self.bankAccount.balance = @(tfAccountBalance.text.doubleValue);
    self.bankAccount.accountTitle = tfAccountTitle.text;
    self.bankAccount.accountNumber = tfAccountNumber.text;
    self.bankAccount.bankName = tfBankName.text;
    self.bankAccount.branchName = tfBranchName.text;
    self.bankAccount.branchCode = @(tfBranchCode.text.integerValue);
    self.bankAccount.branchAddress = tfBranchAddress.text;
    
    [self.realmManager saveAccount:self.bankAccount];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Helping Methods

- (BOOL)areFieldsValid {
    if (!tfAccountBalance.isValid) {
        [utility showErrorMessageBarWithTitle:TITLE_VALIDATION_FAILED andMessage:MESSAGE_BALANCE_VALIDATION_FAILED];
        return NO;
    }
    if (!tfAccountNumber.isValid) {
        [utility showErrorMessageBarWithTitle:TITLE_VALIDATION_FAILED andMessage:MESSAGE_ACCOUNT_VALIDATION_FAILED];
        return NO;
    }
    if (!tfAccountTitle.isValid) {
        [utility showErrorMessageBarWithTitle:TITLE_VALIDATION_FAILED andMessage:MESSAGE_TITLE_VALIDATION_FAILED];
        return NO;
    }
    return YES;
}

@end