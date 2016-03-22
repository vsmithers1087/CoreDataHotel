//
//  NSManagedObjectContext+NSMangagedObjectCategory.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "NSManagedObjectContext+NSMangagedObjectCategory.h"
#import "AppDelegate.h"

@implementation NSManagedObjectContext (NSMangagedObjectCategory)

+(NSManagedObjectContext*)currentContext{
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    return delegate.managedObjectContext;
    
}

@end
