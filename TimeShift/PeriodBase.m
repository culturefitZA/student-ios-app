//
//  PeriodBase.m
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "PeriodBase.h"
#import "Classes.h"


NSString *const kPeriodBaseClasses = @"classes";


@interface PeriodBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PeriodBase

@synthesize classes = _classes;


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
    NSObject *receivedClasses = [dict objectForKey:kPeriodBaseClasses];
    NSMutableArray *parsedClasses = [NSMutableArray array];
    if ([receivedClasses isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedClasses) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedClasses addObject:[Classes modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedClasses isKindOfClass:[NSDictionary class]]) {
       [parsedClasses addObject:[Classes modelObjectWithDictionary:(NSDictionary *)receivedClasses]];
    }

    self.classes = [NSArray arrayWithArray:parsedClasses];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForClasses = [NSMutableArray array];
    for (NSObject *subArrayObject in self.classes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForClasses addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForClasses addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForClasses] forKey:kPeriodBaseClasses];

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

    self.classes = [aDecoder decodeObjectForKey:kPeriodBaseClasses];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_classes forKey:kPeriodBaseClasses];
}

- (id)copyWithZone:(NSZone *)zone
{
    PeriodBase *copy = [[PeriodBase alloc] init];
    
    if (copy) {

        copy.classes = [self.classes copyWithZone:zone];
    }
    
    return copy;
}


@end
