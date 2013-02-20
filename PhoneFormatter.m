//
//  PhoneFormatter.m
//  FuturaMamae
//
//  Created by Franco Carbonaro on 2/19/13.
//  Copyright (c) 2013 Bayer. All rights reserved.
//

#import "PhoneFormatter.h"

#define kPhoneNumberCharacters  @"1234567890"

@implementation PhoneFormatter

- (NSString *)stringForObjectValue:(id)obj {
    NSString *formattedString = @"";

    NSString *string = (NSString *)obj;
    string = [string stringByReplacingOccurrencesOfString:@"(" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@")" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSRange dddRange = NSMakeRange(0, 2);;
    NSRange block1Range;
    NSRange block2Range;
    
    if (string.length <= 4 || string.length > 11) {
        formattedString = string;
    }
    else if (string.length >= 5 && string.length <= 9) {
        NSInteger block1RangeEnd = (string.length < 9) ? 4 : 5;
        
        block1Range = NSMakeRange(0, block1RangeEnd);
        block2Range = NSMakeRange(block1RangeEnd, string.length - block1RangeEnd);
        
        formattedString = [formattedString stringByAppendingFormat:@"%@-%@", [string substringWithRange:block1Range], [string substringWithRange:block2Range]];
    }
    else if (string.length == 10) {
        block1Range = NSMakeRange(2, 4);
        block2Range = NSMakeRange(6, 4);
        
        formattedString = [formattedString stringByAppendingFormat:@"(%@) %@-%@", [string substringWithRange:dddRange], [string substringWithRange:block1Range], [string substringWithRange:block2Range]];

    }
    else if (string.length == 11) {
        block1Range = NSMakeRange(2, 5);
        block2Range = NSMakeRange(7, 4);
        
        formattedString = [formattedString stringByAppendingFormat:@"(%@) %@-%@", [string substringWithRange:dddRange], [string substringWithRange:block1Range], [string substringWithRange:block2Range]];
    }
    
    return formattedString;
}

- (BOOL)stringIsValid:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@"(" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@")" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:kPhoneNumberCharacters] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL isValid = (([string isEqualToString:filtered]));
    
    return isValid;
}

- (BOOL)getObjectValue:(out __autoreleasing id *)obj forString:(NSString *)string errorDescription:(out NSString *__autoreleasing *)error {
    return YES;
}

@end
