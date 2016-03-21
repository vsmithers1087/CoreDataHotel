//
//  RoomsViewController.h
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hotel.h"

@interface RoomsViewController : UIViewController

@property (strong, nonatomic) Hotel* selectedHotel;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end
