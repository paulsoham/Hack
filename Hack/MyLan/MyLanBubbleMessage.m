//
//  MyLanBubbleMessage.m
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanBubbleMessage.h"

@implementation MyLanBubbleMessage

+ (instancetype)messageWithString:(NSString *)message authorName:(NSString *)name
{
    return [MyLanBubbleMessage messageWithString:message image:nil authorName:name];
}

+ (instancetype)messageWithString:(NSString *)message image:(UIImage *)image authorName:(NSString *)name
{
    return [[MyLanBubbleMessage alloc] initWithString:message image:image authorName:name];
}

- (instancetype)initWithString:(NSString *)message authorName:(NSString *)name
{
    return [self initWithString:message image:nil authorName:name];
}

- (instancetype)initWithString:(NSString *)message image:(UIImage *)image authorName:(NSString *)name
{
    self = [super init];
    if(self)
    {
        _message = message;
        _avatar = image;
        _authorName = name;
    }
    return self;
}

@end
