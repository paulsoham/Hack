//
//  QuestionOption+CoreDataProperties.h
//  MyLan
//
//  Created by TSI on 16/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "QuestionOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionOption (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *option_detail;
@property (nullable, nonatomic, retain) NSNumber *order;
@property (nullable, nonatomic, retain) NSString *option_id;

@end

NS_ASSUME_NONNULL_END
