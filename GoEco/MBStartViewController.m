//
//  MBStartViewController.m
//  GoEco
//
//  Created by Bart Jochems on 13-09-14.
//  Copyright (c) 2014 Moboa. All rights reserved.
//

#import "MBStartViewController.h"
#import "MBObjectManager.h"
#import "MBRestService.h"

@interface MBStartViewController ()

@end

@implementation MBStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [MBRestService sharedService];
    
    
    MBObjectManager *manager = [MBObjectManager sharedManager];
    [manager getObjectsAtPath:@"/restkit-crash.json" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"success");
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"failure with error %@", error.localizedDescription);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
