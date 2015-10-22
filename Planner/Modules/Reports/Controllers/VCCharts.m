//
//  VCCharts.m
//  Planner
//
//  Created by Umair Aamir on 10/22/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import "VCCharts.h"
#import "ActionSheetDatePicker.h"

@interface VCCharts ()

@property (nonatomic, strong) PNPieChart *pieChart;
@end

@implementation VCCharts

- (void)dealloc {
    self.pieChart = nil;
}

#pragma mark - Configure View

- (void)setupPieChartWithIncome:(double)income andExpenses:(double)expenses {
    if (self.pieChart) {
        [self.pieChart removeFromSuperview];
        self.pieChart = nil;
    }
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:expenses
                                                       color:PNRed description:@"Expenses"],
                       [PNPieChartDataItem dataItemWithValue:income
                                                       color:PNBlue description:@"Income"]
                       ];
    
    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(0, 0, pieChartContainer.bounds.size.width, pieChartContainer.bounds.size.height) items:items];
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:14.0];
    [self.pieChart strokeChart];
    [pieChartContainer addSubview:self.pieChart];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [ActionSheetDatePicker showPickerWithTitle:@"Select Date" datePickerMode:UIDatePickerModeDate selectedDate:[NSDate date] minimumDate:[NSDate date] maximumDate:nil doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {

        [self setValue:selectedDate toTextField:textField];
        [self calculateAmountForMonths:[self monthsFromDate:selectedDate]];
        
    } cancelBlock:^(ActionSheetDatePicker *picker) {
        
    } origin:self.view];
    
    return NO;
}

#pragma mark - Helping Methods

- (void)setValue:(NSDate *)selectedDate toTextField:(UITextField *)textField {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MM, YYYY"];
    textField.text = [dateFormatter stringFromDate:selectedDate];
}

- (NSInteger)monthsFromDate:(NSDate *)selectedDate {
    return [[[NSCalendar currentCalendar] components: NSCalendarUnitMonth
                                                       fromDate: [NSDate date]
                                                         toDate: selectedDate
                                                        options: 0] month] + 1;
}

- (void)calculateAmountForMonths:(NSInteger)months {
    RealmManager *realmManager = [RealmManager new];
    double totalIncome = [utility totalRecurring:YES forMonths:months fromResults:[realmManager recurringIncomes]] + [utility totalRecurring:NO forMonths:months fromResults:[realmManager nonRecurringIncomes]];
    double totalExpenses = [utility totalRecurring:YES forMonths:months fromResults:[realmManager recurringExpenses]] + [utility totalRecurring:NO forMonths:months fromResults:[realmManager nonRecurringExpenses]];
    [self setupPieChartWithIncome:totalIncome andExpenses:totalExpenses];
}

@end
