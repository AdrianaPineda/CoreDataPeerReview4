//
//  Student+CoreDataProperties.h
//  PeerReviewW4
//
//  Created by Adriana Pineda on 12/26/15.
//  Copyright © 2015 Adriana Pineda. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *grade;
@property (nullable, nonatomic, retain) NSString *course;

@end

NS_ASSUME_NONNULL_END
