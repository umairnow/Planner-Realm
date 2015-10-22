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
    RLMResults *results = [self.realmManager getAllIncomes];
    self.transactionCategories = [utility convertToArray:results];
    [self.tableView reloadData];
    [self updateSum];
}

- (void)updateSum {
    lblIncomes.text = [NSString stringWithFormat:@"%@", [[self.realmManager getAllIncomes] sumOfProperty:@"transactionValue"]];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.transactionCategories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MGSwipeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IncomesCellIdentifier" forIndexPath:indexPath];
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"Delete" backgroundColor:[UIColor redColor]],
                          [MGSwipeButton buttonWithTitle:@"Update" backgroundColor:[UIColor blueColor]]];
    cell.rightSwipeSettings.transition = MGSwipeTransition3D;
    cell.delegate = self;
    TransactionCategory *transactionCategory = self.transactionCategories[indexPath.row];
    cell.textLabel.text = transactionCategory.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", transactionCategory.transactionValue];
    return cell;
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
