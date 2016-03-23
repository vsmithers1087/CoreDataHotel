//
//  ReservationService.h
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guest.h"
#import "Room.h"

@interface ReservationService : NSObject

+(NSArray*)fetchAvailableRoomsForStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;
+(void)bookReservationWithGuest: (Guest*)guest room:(Room*)room startDate:(NSDate*)start endDate:(NSDate*)end;

+(NSArray*)fetchReservationsWithGuestName:(NSString*)name;


@end
