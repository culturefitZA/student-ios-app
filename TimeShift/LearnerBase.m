//
//  LearnerBase.m
//
//  Created by Vision Mkhabela on 6/10/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LearnerBase.h"
#import "Learner.h"


NSString *const kLearnerBaseLearners = @"learners";


@interface LearnerBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LearnerBase

@synthesize learners = _learners;


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
    NSObject *receivedLearners = [dict objectForKey:kLearnerBaseLearners];
    NSMutableArray *parsedLearners = [NSMutableArray array];
    if ([receivedLearners isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLearners) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLearners addObject:[Learner modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLearners isKindOfClass:[NSDictionary class]]) {
       [parsedLearners addObject:[Learner modelObjectWithDictionary:(NSDictionary *)receivedLearners]];
    }

    self.learners = [NSArray arrayWithArray:parsedLearners];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLearners = [NSMutableArray array];
    for (NSObject *subArrayObject in self.learners) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLearners addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLearners addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLearners] forKey:kLearnerBaseLearners];

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

    self.learners = [aDecoder decodeObjectForKey:kLearnerBaseLearners];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_learners forKey:kLearnerBaseLearners];
}

- (id)copyWithZone:(NSZone *)zone
{
    LearnerBase *copy = [[LearnerBase alloc] init];
    
    if (copy) {

        copy.learners = [self.learners copyWithZone:zone];
    }
    
    return copy;
}


@end
