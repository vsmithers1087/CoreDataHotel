//
//  AvialibilityViewController.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "AvialibilityViewController.h"
#import "ReservationService.h"
#import "Room.h"
#import "Hotel.h"
#import "BookViewController.h"

@interface AvialibilityViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic)NSArray *dataSource;
@property(strong, nonatomic)UITableView *tableview;

@end

@implementation AvialibilityViewController

-(NSArray*)dataSource {
    
    if (!_dataSource) {
        _dataSource = [ReservationService fetchAvailableRoomsForStartDate:self.startDate endDate:self.endDate];
    }
    return _dataSource;
}

-(void)loadView{
    [super loadView];
    
    [self setUpCustomLayout];
    [self setUpTableView];
    [self setUpAvailablityVC];
}
-(void)viewDidLoad{
    [super viewDidLoad];
}


-(void)setUpCustomLayout{
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)setUpAvailablityVC {
    [self.navigationItem setTitle:@"AVailibility"];
}
-(void)setUpTableView{
    
    self.tableview = [[UITableView alloc]init];
    
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
    [self.view addSubview:self.tableview];
    
    self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSLayoutConstraint *tLeading = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tTrailing = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tTop = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tBotton = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    
    
    tLeading.active = YES;
    tTrailing.active = YES;
    tTop.active = YES;
    tBotton.active = YES;
    
    //set contraints
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Room *room = [self.dataSource objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@: beds: %@ $%0.2f per night.", room.hotel.name, room.number, room.beds, room.rate.floatValue];
    
    cell.layer.borderWidth = 1.0;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Room *room = self.dataSource[indexPath.row];
    BookViewController *bookViewController = [[BookViewController alloc]init];
    
    bookViewController.room = room;
    bookViewController.startDate = self.startDate;
    bookViewController.endDate = self.endDate;
    
    [self.navigationController pushViewController:bookViewController animated:YES];
    
}




@end
