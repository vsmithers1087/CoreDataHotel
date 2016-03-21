//
//  Hotel+CoreDataProperties.h
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Hotel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Hotel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *stars;
@property (nullable, nonatomic, retain) NSSet <Room*> *rooms;

@end

NS_ASSUME_NONNULL_END
