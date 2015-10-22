//
//  VCAddIncome.h
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UATextField.h"

@interface VCAddIncome : UITableViewController {
    
    __weak IBOutlet UATextField *tfIncomeName;
    __weak IBOutlet UATextField *tfIncomeValue;
    __weak IBOutlet UISwitch *switchRecurring;
}

@property (strong, nonatomic) TransactionCategory *transactionCategory;

@end
