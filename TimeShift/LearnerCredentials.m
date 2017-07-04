//
//  LearnerCredentials.m
//
//  Created by Vision Mkhabela on 6/10/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LearnerCredentials.h"


NSString *const kLearnerCredentialsUserId = @"userId";
NSString *const kLearnerCredentialsPassword = @"password";
NSString *const kLearnerCredentialsEmail = @"email";


@interface LearnerCredentials ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LearnerCredentials

@synthesize userId = _userId;
@synthesize password = _password;
@synthesize email = _email;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
			self.userId = [self objectOrNilForKey:kLearnerCredentialsUserId fromDictionary:dict];
			self.password = [self objectOrNilForKey:kLearnerCredentialsPassword fromDictionary:dict];
			self.email = [self objectOrNilForKey:kLearnerCredentialsEmail fromDictionary:dict];
			
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userId forKey:kLearnerCredentialsUserId];
    [mutableDict setValue:self.password forKey:kLearnerCredentialsPassword];
	[mutableDict setValue:self.email forKey:kLearnerCredentialsEmail];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.userId = [aDecoder decodeObjectForKey:kLearnerCredentialsUserId];
    self.password = [aDecoder decodeObjectForKey:kLearnerCredentialsPassword];
	  self.email = [aDecoder decodeObjectForKey:kLearnerCredentialsEmail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userId forKey:kLearnerCredentialsUserId];
    [aCoder encodeObject:_password forKey:kLearnerCredentialsPassword];
	  [aCoder encodeObject:_email forKey:kLearnerCredentialsEmail];
}

- (id)copyWithZone:(NSZone *)zone
{
    LearnerCredentials *copy = [[LearnerCredentials alloc] init];
    
    if (copy) {

        copy.userId = [self.userId copyWithZone:zone];
        copy.password = [self.password copyWithZone:zone];
			  copy.email = [self.email copyWithZone:zone];
    }
    
    return copy;
}


@end
