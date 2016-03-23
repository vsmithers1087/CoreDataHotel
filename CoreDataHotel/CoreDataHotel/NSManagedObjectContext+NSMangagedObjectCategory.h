//
//  NSManagedObjectContext+NSMangagedObjectCategory.h
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (NSMangagedObjectCategory)

+(NSManagedObjectContext*)currentContext;


@end
