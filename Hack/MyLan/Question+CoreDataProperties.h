//
//  Question+CoreDataProperties.h
//  MyLan
//
//  Created by TSI on 16/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface Question (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *answer_id;
@property (nullable, nonatomic, retain) NSString *question_description;
@property (nullable, nonatomic, retain) NSString *question_id;
@property (nullable, nonatomic, retain) NSString *question_image;
@property (nullable, nonatomic, retain) NSString *question_title;
@property (nullable, nonatomic, retain) NSSet<QuestionOption *> *quesOptions;

@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addQuesOptionsObject:(QuestionOption *)value;
- (void)removeQuesOptionsObject:(QuestionOption *)value;
- (void)addQuesOptions:(NSSet<QuestionOption *> *)values;
- (void)removeQuesOptions:(NSSet<QuestionOption *> *)values;

@end

NS_ASSUME_NONNULL_END
