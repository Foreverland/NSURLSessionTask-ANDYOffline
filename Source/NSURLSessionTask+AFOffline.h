@import Foundation;

@interface NSURLSessionTask (AFOffline) <NSCoding>

@property (nonatomic, strong) NSURLRequest *af_originalRequest;
@property (nonatomic, strong) NSURLRequest *af_currentRequest;
@property (nonatomic, strong) NSURLResponse *af_response;
@property (nonatomic, strong) NSDictionary *af_params;

- (void)saveWithParams:(NSDictionary *)params;

+ (NSArray *)offlineTasks;

@end
