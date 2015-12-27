//
//  ViewController.m
//  PeerReviewW4
//
//  Created by Adriana Pineda on 12/25/15.
//  Copyright © 2015 Adriana Pineda. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentName;
@property (weak, nonatomic) IBOutlet UITextField *course;
@property (weak, nonatomic) IBOutlet UITextField *grade;
@property (weak, nonatomic) IBOutlet UILabel *studentsInfoLog;
@property (weak, nonatomic) IBOutlet UILabel *objectsCounter;

@property (nonatomic) AppDelegate *delegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = [[UIApplication sharedApplication] delegate];
    [self updateStudentsInfoInUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addStudentInfo:(id)sender {
    
    Student *student = [self.delegate createStudentMO];
    student.name = self.studentName.text;
    student.grade = [NSNumber numberWithInt:self.grade.text.doubleValue];
    student.course = self.course.text;
    
    [self.delegate saveContext];
    [self updateStudentsInfoInUI];
    
}

- (IBAction)deleteAllStudentInfo:(id)sender {
    
    NSManagedObjectContext *moct = self.delegate.managedObjectContext;
    NSArray *students = [self fetchStudents];
    
    for (Student *student in students) {
        [moct deleteObject:student];
    }
    
    [self.delegate saveContext];
    [self updateStudentsInfoInUI];
}

- (void)updateStudentsInfoInUI {

    NSArray *results = [self fetchStudents];
    
    NSMutableString *buffer = [NSMutableString stringWithString:@""];
    for (Student *student in results) {
        [buffer appendFormat:@"%@ got %@ in %@\n", student.name, student.grade, student.course];
    }
    
    self.studentsInfoLog.text = buffer;
    self.objectsCounter.text = [NSString stringWithFormat:@"%lu object(s) in persistent storage", (unsigned long)results.count];
    
    self.studentName.text = @"";
    self.course.text = @"";
    self.grade.text = @"";
    
}

- (NSArray *)fetchStudents {
    
    NSManagedObjectContext *moct = self.delegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    NSError *error = nil;
    NSArray *results = [moct executeFetchRequest:request error:&error];
    
    if (!results) {
        NSLog(@"Error getting students");
        return nil;
    }
    
    return results;
}

@end
