//
//  UATextField.h
//  TrafficFriends
//
//  Created by Umair Aamir on 28/10/2014.
//  Copyright (c) 2014 Nextbridge Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UATextField : UITextField

@property (nonatomic, assign) BOOL required;
@property (nonatomic, strong) UIImage *leftImage;
@property (nonatomic, assign) NSUInteger leftPadding;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *placeHolderColor;

- (BOOL)isValid;

@end
