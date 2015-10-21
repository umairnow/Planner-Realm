//
//  VCAccounts.h
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCAccounts : UIViewController {
    
    __weak IBOutlet UILabel *lblCurrency;
    __weak IBOutlet UILabel *lblBalance;
    __weak IBOutlet UILabel *lblAccountTitle;
    __weak IBOutlet UILabel *lblAccountNumber;
    __weak IBOutlet UILabel *lblBankName;
    __weak IBOutlet UILabel *lblBranchName;
    __weak IBOutlet UILabel *lblBranchCode;
    __weak IBOutlet UILabel *lblBranchAddress;
}

- (IBAction)cancelUpdateAccount:(UIStoryboardSegue *)sender;

@end
