//
//  JWAnimationsListTableViewController.m
//  JWAnimations
//
//  Created by sunjiawen on 2018/4/18.
//  Copyright © 2018年 sjw. All rights reserved.
//

#import "JWAnimationsListTableViewController.h"
#import "JWReplicatorAnimationListTableViewController.h"
#import "JWAnimationViewController.h"
@interface JWAnimationsListTableViewController ()
@property(nonatomic, strong)NSArray *dataSource;// Animations
@end

@implementation JWAnimationsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"JWAnimationTableViewCellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        JWReplicatorAnimationListTableViewController *vc = [[JWReplicatorAnimationListTableViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        JWAnimationViewController *vc = [[JWAnimationViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"复制层 CAReplicatorLayer", @"CAEmitterLayer 粒子动画", @"CAGradientLayer 渐变动画"];
    }
    
    return _dataSource;
}
@end
