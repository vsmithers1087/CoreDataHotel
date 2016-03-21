//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "RoomsViewController.h"
#import "HotelsViewController.h"
#import "AppDelegate.h"
#import "Room.h"

@interface RoomsViewController()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView* tableView;

@end

@implementation RoomsViewController

-(void)viewDidLoad{

    [super viewDidLoad];
    
    [self setUpHotelsViewController];

    [self setUpTableView];
}

-(void)setUpHotelsViewController {
    self.view.backgroundColor = [UIColor whiteColor];
}


-(void)setUpTableView{
    
    self.tableView = [[UITableView alloc]init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSLayoutConstraint *tLeading = [NSLayoutConstraint constraintWithItem: self.tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tTrailing = [NSLayoutConstraint constraintWithItem: self.tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tTop = [NSLayoutConstraint constraintWithItem: self.tableView attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *tBotton = [NSLayoutConstraint constraintWithItem: self.tableView attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    
    tLeading.active = YES;
    tTrailing.active = YES;
    tTop.active = YES;
    tBotton.active = YES;
    
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
    
    NSString *formattedNumber = [NSString stringWithFormat:@"Room %@", room.number];
    
    cell.textLabel.text = formattedNumber;
    cell.layer.borderWidth = 1.0;
    
    return cell;
}




@end
