//
//  ScanResultViewController.m
//  The Listener
//
//  Created by Kanta'MacPro on 6/5/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

#import "ScanResultViewController.h"

@interface ScanResultViewController ()
@end

@implementation ScanResultViewController
{
    UITextView              *scanResultView;
    NSString                *TempedText;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"passedTextValue: %@", self.TemptText);
    self.scanResultView.text = self.TemptText;
    NSLog(@"scanResultText: %@", self.scanResultView.text);
    
    
}

- (IBAction)backButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
