//
//  LFServerConfigViewController.m
//  Mars
//
//  Created by Chris on 11/4/15.
//  Copyright (c) 2015 Mars. All rights reserved.
//

#import "LFServerConfigViewController.h"

@implementation LFServerConfigViewController
{
    TWScrollView *_scrollView;
    TWTextField *_serverField, *_portField, *_protocalField;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _scrollView.frame = self.view.bounds;
    _scrollView.contentSize = CGSizeMake(kDeviceWidth, MAX(_scrollView.contentSize.height, self.view.frame.size.height+1));
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.title = kStr(@"SERVER CONFIG");
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:kStr(@"Save") style:UIBarButtonItemStylePlain target:self action:@selector(handleSave:)];
    
    _scrollView = [[TWScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollView];
    
    TWView *v = [[TWView alloc] initWithFrame:CGRectMake(8, 16, kDeviceWidth-8*2, 44) andRadius:3.0f];
    v.backgroundColor = kWhiteColor;
    [_scrollView addSubview:v];
    _protocalField = [[TWTextField alloc] initWithFrame:CGRectInset(v.bounds, 8, 3)];
    _protocalField.placeholder = kStr(@"SERVER PROTOCAL");
    NSString *protocal = [[TWLocalSettings sharedSettings] getSettings:@"SVR_PROTOCAL"];
    if (![NSString isNullOrEmpty:protocal]) {
        _protocalField.text = protocal;
    }
    else {
        _protocalField.text = kAppHostProtocal;
    }
    [v addSubview:_protocalField];
    
    CGRect r =  v.frame;
    r.origin.y += r.size.height + 8;
    v = [[TWView alloc] initWithFrame:r andRadius:3.0f];
    v.backgroundColor = kWhiteColor;
    [_scrollView addSubview:v];
    _serverField = [[TWTextField alloc] initWithFrame:CGRectInset(v.bounds, 8, 3)];
    _serverField.keyboardType = UIKeyboardTypeDecimalPad;
    _serverField.placeholder = kStr(@"SERVER IP");
    NSString *ip = [[TWLocalSettings sharedSettings] getSettings:@"SVR_IP"];
    if (![NSString isNullOrEmpty:ip]) {
        _serverField.text = ip;
    }
    else {
        _serverField.text = kAppHost;
    }
    [v addSubview:_serverField];
    
    r.origin.y += r.size.height + 8;
    v = [[TWView alloc] initWithFrame:r];
    v.backgroundColor = kWhiteColor;
    [_scrollView addSubview:v];
    _portField = [[TWTextField alloc] initWithFrame:CGRectInset(v.bounds, 8, 3)];
    _portField.placeholder = kStr(@"SERVER IP");
    _portField.keyboardType = UIKeyboardTypeNumberPad;
    NSString *port = [[TWLocalSettings sharedSettings] getSettings:@"SVR_PORT"];
    if (![NSString isNullOrEmpty:port]) {
        _portField.text = port;
    }
    else {
        _portField.text = kAppHostPort;
    }
    [v addSubview:_portField];
}

- (void) handleSave:(id) sender {
    NSString *protocal = _protocalField.text;
    NSString *ip = _serverField.text;
    NSString *port = _portField.text;
    if (![NSString isNullOrEmpty:protocal]) {
        [[TWLocalSettings sharedSettings] setSettings:protocal forKey:@"SVR_PROTOCAL"];
    }
    if (![NSString isNullOrEmpty:ip]) {
        [[TWLocalSettings sharedSettings] setSettings:ip forKey:@"SVR_IP"];
    }
    if (![NSString isNullOrEmpty:port]) {
        [[TWLocalSettings sharedSettings] setSettings:port forKey:@"SVR_PORT"];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
