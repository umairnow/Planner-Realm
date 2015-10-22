//
//  VCAccounts.m
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCAccounts.h"
#import "VCUpdateAccount.h"

@interface VCAccounts ()

@property (strong, nonatomic) RealmManager *realmManager;
@property (strong, nonatomic) BankAccount *bankAccount;

@end

@implementation VCAccounts

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeVariables];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadAccountInfo];
}

#pragma mark - Load Data

- (void)initializeVariables {
    self.realmManager = [RealmManager new];
}

- (void)configureView {
    lblCurrency.text = self.bankAccount.currency;
    lblBalance.text = [NSString stringWithFormat:@"%@", self.bankAccount.balance?:@""];
    lblAccountTitle.text = self.bankAccount.accountTitle;
    lblAccountNumber.text = self.bankAccount.accountNumber;
    lblBankName.text = self.bankAccount.bankName;
    lblBranchName.text = self.bankAccount.branchName;
    lblBranchCode.text = [NSString stringWithFormat:@"%@", self.bankAccount.branchCode?:@""];
    lblBranchAddress.text = self.bankAccount.branchAddress;
}

- (void)loadAccountInfo {
    self.bankAccount = [self.realmManager getAccountInfo];
    [self configureView];
}

#pragma mark - Storyboard Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VCUpdateAccount *vcUpdateAccount = segue.destinationViewController;
    vcUpdateAccount.bankAccount = self.bankAccount;
}

#pragma mark - Action Handlers

- (IBAction)cancelUpdateAccount:(UIStoryboardSegue *)sender {
    
}

@end
