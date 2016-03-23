//
//  LookUpViewController.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/23/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "LookUpViewController.h"
#import "Reservation.h"
#import "Guest.h"
#import "Room.h"
#import "Hotel.h"
#import "ReservationService.h"

@interface LookUpViewController  ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property(strong, nonatomic)NSArray* datasource;
@property(strong, nonatomic)UITableView *tableview;

@end

@implementation LookUpViewController

-(void)setDatasource:(NSArray *)datasource{
    _datasource = datasource;
    
    [self.tableview reloadData];
}


-(void)loadView{
    [super loadView];
    [self setUpTableView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [self setUpLookUPViewcontroller];
}


-(void)setUpLookUPViewcontroller {
    
    [self.navigationItem setTitle:@"Search"];
}

-(void)setUpTableView{
    
    self.tableview = [[UITableView alloc]init];
    
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
    self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
    
 
    
    NSLayoutConstraint *tLeading = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tTrailing = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tTop = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tBotton = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    
    [self.view addSubview: self.tableview];
    
    
    tLeading.active = YES;
    tTrailing.active = YES;
    tTop.active = YES;
    tBotton.active = YES;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    
    Reservation *reservation = self.datasource[indexPath.row];
    
    cell.textLabel.text = reservation.guest.name;
    
    NSString *format = [NSString stringWithFormat:@"Hotel: %@, Room: %@", reservation.room.hotel.name, reservation.room.number];
    
    cell.detailTextLabel.text = format;
    
    cell.layer.borderWidth = 1.0;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.tableview.frame), 44.0);
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:frame];
    
    searchBar.delegate = self;
    return searchBar;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSLog(@"%@", searchBar.text);
    
    self.datasource = [ReservationService fetchReservationsWithGuestName:searchBar.text];
}



@end
