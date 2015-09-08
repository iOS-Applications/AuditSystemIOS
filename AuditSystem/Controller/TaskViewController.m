//
//  ListTableViewController.m
//  QQList
//
//  Created by CarolWang on 14/11/22.
//  Copyright (c) 2014年 CarolWang. All rights reserved.
//

#import "TaskViewController.h"
#import "JKGroupModel.h"
#import "JKTasksModel.h"
#import "TaskView.h"
#import "TaskTrafficViewController.h"

@interface TaskViewController ()<TaskViewDelegate>
    @property (nonatomic, strong) NSArray *dataArray;
@end

@implementation TaskViewController
//懒加载
- (NSArray *)dataArray{
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            JKGroupModel *groupModel = [JKGroupModel GroupWithDict:dict];
            [muArray addObject:groupModel];
        }
        _dataArray = [muArray copy];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 40;
    [self clipExtraCellLine:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - 数据源方法
#pragma mark 返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

#pragma mark 返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JKGroupModel *groupModel = self.dataArray[section];
    NSInteger count = groupModel.isOpen ? groupModel.tasks.count : 0;
    return count;
}


#pragma mark - UITableView delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TaskView *task = [TaskView headerView:tableView];
    task.delegate = self;
    task.groupModel = self.dataArray[section];
    return task;
}

#pragma mark返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"friendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSLog(@"cell is not empty");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    JKGroupModel *groupModel = self.dataArray[indexPath.section];
    JKTasksModel *taskModel = groupModel.tasks[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:taskModel.icon]; 
    cell.textLabel.text = taskModel.name;
    cell.detailTextLabel.text = taskModel.intro;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TaskTrafficViewController *viewCtrl = [[TaskTrafficViewController alloc] init];
    [self.navigationController pushViewController:viewCtrl animated:YES];
}

#pragma mark - item 进行点击
- (void)clickView{
    [self.tableView reloadData];
}

#pragma mark - 去掉多余的线
- (void)clipExtraCellLine:(UITableView *)tableView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}

@end
