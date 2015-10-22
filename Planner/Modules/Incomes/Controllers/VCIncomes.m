//
//  VCIncomes.m
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCIncomes.h"
#import "VCAddIncome.h"

@interface VCIncomes ()

@property (assign, nonatomic) NSInteger selectedCatIndex;

@end

@implementation VCIncomes

static NSString *const CellIdentifier = @"TransactionCell";

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeVariables];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.selectedCatIndex = -1;
    [self loadTransactions];
}

#pragma mark - Helping Methods

- (void)initializeVariables {
    self.realmManager = [RealmManager new];
}

- (void)loadTransactions {
    self.transactionCategories = [utility convertToArray:[self.realmManager getAllIncomes]];
    [self.tableView reloadData];
    [self updateSum];
}

- (void)updateSum {
    double totalMonthly = [utility totalMonthlyRecurring:YES fromResults:[self.realmManager recurringIncomes]] + [utility totalMonthlyRecurring:NO fromResults:[self.realmManager nonRecurringIncomes]];
    lblIncomes.text = [NSString stringWithFormat:@"%.1f", totalMonthly];
    double totalYearly = [utility totalYearlyRecurring:YES fromResults:[self.realmManager recurringIncomes]] + [utility totalYearlyRecurring:NO fromResults:[self.realmManager nonRecurringIncomes]];
    lblIncomesYearly.text = [NSString stringWithFormat:@"%.1f", totalYearly];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.transactionCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MGSwipeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"Delete" backgroundColor:[UIColor redColor]],
                          [MGSwipeButton buttonWithTitle:@"Update" backgroundColor:[UIColor blueColor]]];
    cell.rightSwipeSettings.transition = MGSwipeTransition3D;
    cell.delegate = self;
    TransactionCategory *transactionCategory = self.transactionCategories[indexPath.row];
    cell.textLabel.text = transactionCategory.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Monthly: %.1f\n Yearly: %.1f", [utility calculateAmountMonthly:YES from:transactionCategory], [utility calculateAmountMonthly:NO from:transactionCategory]];
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    static MGSwipeTableCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    });
    TransactionCategory *transactionCategory = self.transactionCategories[indexPath.row];
    sizingCell.textLabel.text = transactionCategory.name;
    sizingCell.detailTextLabel.text = [NSString stringWithFormat:@"Monthly: %.1f\n Yearly: %.1f", [utility calculateAmountMonthly:YES from:transactionCategory], [utility calculateAmountMonthly:NO from:transactionCategory]];
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    CGFloat height = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}

#pragma mark - MGSwipeTableCell Delegate

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion {
    NSInteger selectedIndex = [self.tableView indexPathForCell:cell].row;
    if (index == 0) {
        TransactionCategory *transCat = self.transactionCategories[selectedIndex];
        [self.realmManager deleteTransaction:transCat];
        [self.transactionCategories removeObjectAtIndex:selectedIndex];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:selectedIndex inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
        [self updateSum];
    } else {
        self.selectedCatIndex = selectedIndex;
        [self performSegueWithIdentifier:@"updateSegue" sender:nil];
    }
    return YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (self.selectedCatIndex >= 0) {
        if ([segue.destinationViewController respondsToSelector:@selector(transactionCategory)]) {            
            [segue.destinationViewController setValue:self.transactionCategories[self.selectedCatIndex] forKey:@"transactionCategory"];
        }
    }
}

#pragma mark - Action Handlers

- (IBAction)cancelAddIncome:(UIStoryboardSegue *)sender {
    
}

@end
