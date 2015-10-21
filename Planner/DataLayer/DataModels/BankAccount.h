//  BankAccount.h
//  Planner
//
//  Created by Umair Aamir on 10/20/15.
//  Copyright © 2015 Umair Aamir. All rights reserved.
//

#import <Realm/Realm.h>

@interface BankAccount : RLMObject

@property (assign, nonatomic) NSNumber<RLMInt> *accountId;
@property (strong, nonatomic) NSString *accountTitle;
@property (strong, nonatomic) NSString *accountNumber;
@property (strong, nonatomic) NSString *bankName;
@property (strong, nonatomic) NSString *branchName;
@property (strong, nonatomic) NSNumber<RLMInt> *branchCode;
@property (strong, nonatomic) NSString *branchAddress;
@property (strong, nonatomic) NSNumber<RLMDouble> *balance;
@property (strong, nonatomic) NSString *currency;

@end
