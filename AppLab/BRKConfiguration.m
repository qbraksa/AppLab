//
//  BRKConfiguration.m
//  Ripcord
//
//  Created by Zakaria Braksa on 4/18/14.
//  Copyright (c) 2014 Zakaria Braksa. All rights reserved.
//

#import "BRKConfiguration.h"

#define BRKConfigurationBaseAPI @"kBaseAPI"
#define BRKConfigurationBaseURL @"kBaseURL"

@interface BRKConfiguration ()
@property (copy, nonatomic) NSString *configuration;
@property (nonatomic, strong) NSDictionary *variables;
@end

@implementation BRKConfiguration

#pragma mark -
#pragma mark Shared Configuration
+ (BRKConfiguration *)sharedConfiguration {
    static BRKConfiguration *_sharedConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfiguration = [[self alloc] init];
    });
    
    return _sharedConfiguration;
}

#pragma mark -
#pragma mark Private Initialization

- (id)init {
    self = [super init];
    
    if (self) {
        // Fetch Current Configuration
        NSBundle *mainBundle = [NSBundle mainBundle];
        self.configuration = [[mainBundle infoDictionary] objectForKey:@"Configuration"];
        
        NSLog(@"Current Configuration %@", self.configuration);
        
        // Load Configurations
        NSString *path = [mainBundle pathForResource:@"Configurations" ofType:@"plist"];
        NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfFile:path];
        
        NSLog(@"All Configurations : %@", configurations);
        
        // Load Variables for Current Configuration
        self.variables = [configurations objectForKey:self.configuration];
        
        NSLog(@"Variables %@", self.variables);
    }
    
    return self;
}

#pragma mark -
+ (NSString *)configuration {
    return [[BRKConfiguration sharedConfiguration] configuration];
}

#pragma mark -
+ (NSString *)BaseAPI {
    BRKConfiguration *sharedConfiguration = [BRKConfiguration sharedConfiguration];
    
        
    if (sharedConfiguration.variables) {
        NSLog(@"sharedConfiguration %@", sharedConfiguration.variables);
        return [sharedConfiguration.variables objectForKey:BRKConfigurationBaseAPI];
    }
    
    return nil;
}

+ (NSString *)BaseURL {
    BRKConfiguration *sharedConfiguration = [BRKConfiguration sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:BRKConfigurationBaseURL];
    }
    
    return nil;
}

@end