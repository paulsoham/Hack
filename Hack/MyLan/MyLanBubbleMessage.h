//
//  MyLanBubbleMessage.h
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyLanBubbleMessage : NSObject

+ (instancetype)messageWithString:(NSString *)message authorName:(NSString *)name;
+ (instancetype)messageWithString:(NSString *)message image:(UIImage *)image authorName:(NSString *)name;

- (instancetype)initWithString:(NSString *)message authorName:(NSString *)name;
- (instancetype)initWithString:(NSString *)message image:(UIImage *)image authorName:(NSString *)name;

@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) UIImage *avatar;
@property (nonatomic, strong) NSString *authorName;

@end
