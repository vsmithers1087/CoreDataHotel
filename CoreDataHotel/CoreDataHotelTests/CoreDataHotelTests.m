//
//  CoreDataHotelTests.m
//  CoreDataHotelTests
//
//  Created by Vincent Smithers on 3/23/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSManagedObjectContext+NSMangagedObjectCategory.h"
@interface CoreDataHotelTests : XCTestCase

@property(strong, nonatomic)NSManagedObjectContext *context;

@end

@implementation CoreDataHotelTests

- (void)setUp {
    
    [super setUp];
    
    self.context = [NSManagedObjectContext currentContext];
  
}

- (void)tearDown {
    
    [super tearDown];
    
    self.context = nil;
}

- (void)testDataBaseInfo{
    //make sure seeding data db sucessfully saves and has  data.
    
//    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    
    NSFetchRequest *request =  [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    
    request.resultType = NSCountResultType;
    
    NSArray *results = [self.context executeFetchRequest:request error:nil];
    
    NSNumber *count = results.firstObject;
    
    XCTAssert(count > 0, @"Database should not be empty");
    
}


@end
