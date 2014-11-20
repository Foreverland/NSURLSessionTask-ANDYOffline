#import "NSURLSessionTask+AFOffline.h"

#import <objc/runtime.h>

@implementation NSURLSessionTask (AFOffline)

@dynamic af_originalRequest;
@dynamic af_currentRequest;
@dynamic af_response;
@dynamic af_params;

#pragma mark - Getters

- (NSURLRequest *)af_originalRequest
{
    return objc_getAssociatedObject(self, @selector(af_originalRequest));
}

- (NSURLRequest *)af_currentRequest
{
    return objc_getAssociatedObject(self, @selector(af_currentRequest));
}

- (NSURLRequest *)af_response
{
    return objc_getAssociatedObject(self, @selector(af_response));
}

- (NSURLRequest *)af_params
{
    return objc_getAssociatedObject(self, @selector(af_params));
}

#pragma mark - Setters

- (void)setAf_originalRequest:(NSURLRequest *)object
{
    objc_setAssociatedObject(self, @selector(af_originalRequest), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAf_currentRequest:(NSURLRequest *)object
{
    objc_setAssociatedObject(self, @selector(af_currentRequest), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAf_response:(NSURLResponse *)object
{
    objc_setAssociatedObject(self, @selector(af_response), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAf_params:(NSDictionary *)object
{
    objc_setAssociatedObject(self, @selector(af_params), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (!self) return nil;

    self.af_originalRequest = [aDecoder decodeObjectForKey:@"af_originalRequest"];
    self.af_currentRequest = [aDecoder decodeObjectForKey:@"af_currentRequest"];
    self.af_response = [aDecoder decodeObjectForKey:@"af_response"];
    self.af_params = [aDecoder decodeObjectForKey:@"af_params"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.originalRequest forKey:@"af_originalRequest"];
    [aCoder encodeObject:self.currentRequest forKey:@"af_currentRequest"];
    [aCoder encodeObject:self.response forKey:@"af_response"];
    [aCoder encodeObject:self.af_params forKey:@"af_params"];
}

- (void)saveWithParams:(NSDictionary *)params
{
    self.af_params = params;

    NSData *requestsData = [[NSUserDefaults standardUserDefaults] objectForKey:@"offlineRequests"];
    NSMutableArray *requests = [[NSKeyedUnarchiver unarchiveObjectWithData:requestsData] mutableCopy];

    if (!requests) requests = [NSMutableArray array];

    [requests addObject:self];

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:requests];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"offlineRequests"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSArray *)offlineTasks
{
    NSData *requestsData = [[NSUserDefaults standardUserDefaults] objectForKey:@"offlineRequests"];
    NSArray *requests = [NSKeyedUnarchiver unarchiveObjectWithData:requestsData];

    return requests;
}

@end
