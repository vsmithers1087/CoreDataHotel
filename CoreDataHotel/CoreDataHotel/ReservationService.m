//
//  ReservationService.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "ReservationService.h"
#import "NSManagedObjectContext+NSMangagedObjectCategory.h"
#import "Reservation.h"

@implementation ReservationService


+(NSArray*)fetchAvailableRoomsForStartDate:(NSDate*)startDate endDate:(NSDate*)endDate{
    
    
    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    
    NSError *fetchError;
    
    NSFetchRequest *reservationRequest = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    reservationRequest.predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate >= %@", endDate, startDate];
    
    
    NSMutableArray *unavailableRooms = [[NSMutableArray alloc]init];
    
    NSArray *reservations = [context executeFetchRequest:reservationRequest error:&fetchError];
    
    for (Reservation *reservation in reservations) {
        
        [unavailableRooms addObject:reservation.room];
    }
    
    if (fetchError) {
        NSLog(@"%@", fetchError.localizedDescription);
    }
    
    
    NSFetchRequest *roomRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
    roomRequest.predicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", unavailableRooms];
    roomRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES], [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES]];
    
    
    NSArray *result = [context executeFetchRequest:roomRequest error:&fetchError];
    
    if (fetchError) {
        NSLog(@"error %@", fetchError.localizedDescription);
    }
    
    
    return result;
}

+(void)bookReservationWithGuest: (Guest*)guest room:(Room*)room startDate:(NSDate*)start endDate:(NSDate*)end;{
    
    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:context];
    
   
    reservation.room = room;
    reservation.startDate = start;
    reservation.endDate = end;
    reservation.guest = guest;
    
    room.reservation = reservation;
    
    guest.reservation = reservation;
    
    NSError *saveError;
    
    [context save:&saveError];
    
    if (saveError) {
        NSLog(@"save error %@", saveError);
        
    }
    
}

+(NSArray*)fetchReservationsWithGuestName:(NSString*)name {
    
    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    
    request.predicate = [NSPredicate predicateWithFormat:@"guest.name CONTAINS %@ OR guest.lastName CONTAINS %@ OR guest.email CONTAINS %@", name, name, name];
    
    NSError *error;
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if (error) {
        
        NSLog(@"error %@", error.localizedDescription);
    }
    return results;
}



@end
