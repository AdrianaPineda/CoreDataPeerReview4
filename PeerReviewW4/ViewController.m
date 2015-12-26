//
//  ViewController.m
//  PeerReviewW4
//
//  Created by Adriana Pineda on 12/25/15.
//  Copyright © 2015 Adriana Pineda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentName;
@property (weak, nonatomic) IBOutlet UITextField *course;
@property (weak, nonatomic) IBOutlet UITextField *grade;
@property (weak, nonatomic) IBOutlet UILabel *studentsInfoLog;
@property (weak, nonatomic) IBOutlet UILabel *objectsCounter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addStudentInfo:(id)sender {
}

- (IBAction)deleteAllStudentInfo:(id)sender {
}

@end
