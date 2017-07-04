//
//  CredentialsBase.m
//
//  Created by Vision Mkhabela on 6/10/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CredentialsBase.h"
#import "LearnerCredentials.h"


NSString *const kCredentialsBaseLearnerCredentials = @"learnerCredentials";


@interface CredentialsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CredentialsBase

@synthesize learnerCredentials = _learnerCredentials;


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
    NSObject *receivedLearnerCredentials = [dict objectForKey:kCredentialsBaseLearnerCredentials];
    NSMutableArray *parsedLearnerCredentials = [NSMutableArray array];
    if ([receivedLearnerCredentials isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLearnerCredentials) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLearnerCredentials addObject:[LearnerCredentials modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLearnerCredentials isKindOfClass:[NSDictionary class]]) {
       [parsedLearnerCredentials addObject:[LearnerCredentials modelObjectWithDictionary:(NSDictionary *)receivedLearnerCredentials]];
    }

    self.learnerCredentials = [NSArray arrayWithArray:parsedLearnerCredentials];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLearnerCredentials = [NSMutableArray array];
    for (NSObject *subArrayObject in self.learnerCredentials) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLearnerCredentials addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLearnerCredentials addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLearnerCredentials] forKey:kCredentialsBaseLearnerCredentials];

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

    self.learnerCredentials = [aDecoder decodeObjectForKey:kCredentialsBaseLearnerCredentials];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_learnerCredentials forKey:kCredentialsBaseLearnerCredentials];
}

- (id)copyWithZone:(NSZone *)zone
{
    CredentialsBase *copy = [[CredentialsBase alloc] init];
    
    if (copy) {

        copy.learnerCredentials = [self.learnerCredentials copyWithZone:zone];
    }
    
    return copy;
}


@end
