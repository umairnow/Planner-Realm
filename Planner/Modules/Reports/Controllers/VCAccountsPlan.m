//
//  VCAccountsPlan.m
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCAccountsPlan.h"

@interface VCAccountsPlan ()

@property (strong, nonatomic) RealmManager *realmManager;
@property (strong, nonatomic) BankAccount *bankAccount;
@property (assign, nonatomic) NSInteger monthNumber;
@end

@implementation VCAccountsPlan

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeVariables];
    [self loadAccountInfo];
}

- (void)dealloc {
    self.realmManager = nil;
}

#pragma mark - Helping Methods

- (void)initializeVariables {
    self.realmManager = [RealmManager new];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:[NSDate date]];
    self.monthNumber = components.month;
}

- (void)loadAccountInfo {
    self.bankAccount = [self.realmManager getAccountInfo];
}

- (NSString *)monthNameFor:(NSInteger)mNumber {
    mNumber = self.monthNumber + mNumber;
    if (mNumber > 11) {
        mNumber = mNumber - 12;
    }
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSString *monthName = [dateFormatter standaloneMonthSymbols][mNumber];
    return monthName;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountCell" forIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.bankAccount.balance];
    cell.detailTextLabel.text = [self monthNameFor:indexPath.row];
    
    return cell;
}


@end
