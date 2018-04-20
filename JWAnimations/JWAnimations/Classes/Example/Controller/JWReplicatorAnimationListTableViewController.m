//
//  JWReplicatorAnimationListTableViewController.m
//  JWAnimations
//
//  Created by sunjiawen on 2018/4/18.
//  Copyright © 2018年 sjw. All rights reserved.
//

#import "JWReplicatorAnimationListTableViewController.h"
#import "JWAnimationViewController.h"

@interface JWReplicatorAnimationListTableViewController ()
@property(nonatomic, strong)NSArray *dataSource;// Animations
@end

@implementation JWReplicatorAnimationListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"JWReplicatorListTableViewCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JWAnimationViewController *vc = [[JWAnimationViewController alloc]init];
    vc.replicatorLayerType = indexPath.row;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource =  @[@"波纹 animation", @"波浪 animation", @"三角形 animation", @"网格 animation", @"条形 animation", @"转圈 animation", @"心 animation", @"翻转 animation", @"箭头 animation"];
    }
    
    return _dataSource;
}

@end
