//
//  ScanResultViewController.h
//  The Listener
//
//  Created by Kanta'MacPro on 6/5/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanResultViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *scanResultView;
@property (nonatomic, copy) NSString *TemptText;
- (IBAction)backButton:(UIButton *)sender;

@end
