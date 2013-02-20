//
//  PhoneFormatter.h
//  FuturaMamae
//
//  Created by Franco Carbonaro on 2/19/13.
//  Copyright (c) 2013 Bayer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneFormatter : NSFormatter

- (BOOL)stringIsValid:(NSString *)string;

@end
