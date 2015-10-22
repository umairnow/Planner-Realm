//
//  VCIncomes.h
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSwipeTableCell.h"
#import "MGSwipeButton.h"

@interface VCIncomes : UITableViewController <MGSwipeTableCellDelegate> {
    
    __weak IBOutlet UILabel *lblIncomes;
    __weak IBOutlet UILabel *lblIncomesYearly;
}

@property (strong, nonatomic) RLMArray<TransactionCategory *> *transactionCategories;
@property (strong, nonatomic) RealmManager *realmManager;

- (void)loadTransactions;
- (void)updateSum;

@end
