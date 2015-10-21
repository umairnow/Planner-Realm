//
//  VCUpdateAccount.h
//  Planner
//
//  Created by Umair Aamir on 10/21/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UATextField.h"

@interface VCUpdateAccount : UIViewController {
    
    __weak IBOutlet UATextField *tfAccountBalance;
    __weak IBOutlet UATextField *tfCurrency;
    __weak IBOutlet UATextField *tfAccountTitle;
    __weak IBOutlet UATextField *tfAccountNumber;
    __weak IBOutlet UATextField *tfBankName;
    __weak IBOutlet UATextField *tfBranchName;
    __weak IBOutlet UATextField *tfBranchCode;
    __weak IBOutlet UATextField *tfBranchAddress;
}

@property (strong, nonatomic) BankAccount *bankAccount;

@end
