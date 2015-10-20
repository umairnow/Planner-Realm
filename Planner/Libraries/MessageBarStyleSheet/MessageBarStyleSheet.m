//
//  MessageBarStyleSheet.m
//  StudentsRecord
//
//  Created by Umair Aamir on 23/05/2015.
//  Copyright (c) 2015 Umair Aamir. All rights reserved.
//

#import "MessageBarStyleSheet.h"

@implementation MessageBarStyleSheet

#pragma mark - TWMessageBarStyleSheet Methods

- (UIColor *)backgroundColorForMessageType:(TWMessageBarMessageType)type
{
    UIColor *backgroundColor = nil;
    switch (type) {
        case TWMessageBarMessageTypeSuccess:
            backgroundColor = [UIColor greenColor];
            break;
            
        case TWMessageBarMessageTypeError:
            backgroundColor = [UIColor redColor];
            break;
            
        case TWMessageBarMessageTypeInfo:
            backgroundColor = [UIColor blueColor];
            break;
            
        default:
            backgroundColor = [UIColor clearColor];
            break;
    }
    
    return backgroundColor;
}

- (UIColor *)strokeColorForMessageType:(TWMessageBarMessageType)type
{
    return [UIColor clearColor];
}

- (UIImage *)iconImageForMessageType:(TWMessageBarMessageType)type
{
    NSString *iconName = nil;
    
    switch (type)
    {
        case TWMessageBarMessageTypeSuccess:
            iconName = @"icon-success.png";
            break;
        case TWMessageBarMessageTypeError:
            iconName = @"icon-error.png";
            break;
        case TWMessageBarMessageTypeInfo:
            iconName = @"icon-info.png";
            break;
        default:
            break;
    }
    return [UIImage imageNamed:iconName];
}

@end
