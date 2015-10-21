//
//  UATextField.m
//  TrafficFriends
//
//  Created by Umair Aamir on 28/10/2014.
//  Copyright (c) 2014 Nextbridge Pvt. Ltd. All rights reserved.
//

#import "UATextField.h"

@implementation UATextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (BOOL)isValid
{
    if (self.required && self.text.length == 0) {
        return NO;
    }
    
    if (self.keyboardType == UIKeyboardTypeEmailAddress) {
        
        return [self isEmail:self.text];
    }
    return YES;
}

- (void)setLeftImage:(UIImage *)leftImage
{
    _leftImage = leftImage;
    
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:leftImage];
    leftImageView.frame = CGRectMake(0, 0, 37, 37);
    leftImageView.contentMode = UIViewContentModeScaleToFill;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftImageView;
    
}

- (void)setLeftPadding:(NSUInteger)leftPadding
{
    _leftPadding = leftPadding;
    
    UIView *leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(0, 0, leftPadding, 0);
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftView;
    
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;

    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 1.0;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor
{
    _placeHolderColor = placeHolderColor;

    if (self.placeholder.length > 0)
    {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeHolderColor}];
    }
}

#pragma mark - Text Validation

- (BOOL)isEmail:(NSString *)text
{
    NSString *emailRegex = @"^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:text];
}

@end
