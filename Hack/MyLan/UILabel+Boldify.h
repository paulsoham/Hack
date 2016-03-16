//
//  UILabel+Boldify.h
//  MyLan
//
//  Created by TSI on 16/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Boldify)

- (void) boldSubstring: (NSString*) substring;
- (void) boldRange: (NSRange) range;

@end
