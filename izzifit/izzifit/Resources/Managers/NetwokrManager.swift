
import Apollo
import Foundation
import Toast
import ApolloWebSocket

class Network {
    
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let url = URL(string: AppConfiguration.shared.hostName)!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }() 
    
    func mutation<T: GraphQLMutation, Model: Codable>(model type: Model.Type,
                                                      _ mutation: T,
                                                      controller: BaseController?,
                                                      successHandler: @escaping ((_ model :Model) -> Void),
                                                      failureHandler: @escaping ((_ error: Error) -> Void)) -> Cancellable {
        
        apollo.perform(mutation: mutation) { (result) in
            switch result {
            case .success(let queryResult):
                do {
                    let data = try JSONSerialization.data(withJSONObject: queryResult.data?.jsonObject ?? JSONObject(), options: .fragmentsAllowed)
                    let model = try JSONDecoder().decode(Model.self, from: data)
                    successHandler(model)
                } catch {
                    debugPrint("Failure! Error: \(error)")
                    if queryResult.errors?.first?.message == "Not authenticated" {
                        KeychainService.standard.removeAll()
                        RootRouter.sharedInstance.loadStart(toWindow: RootRouter.sharedInstance.window!)
                    }
                    if let message = queryResult.errors?.first?.message {
                        controller?.view?.makeToast(message)
                        failureHandler(error)
                    } else {
                        controller?.view?.makeToast(error.localizedDescription)
                        failureHandler(error)
                    }
                }
            case .failure(let error):
                debugPrint("Failure! Error: \(error)")
                controller?.view?.makeToast(error.localizedDescription)
                failureHandler(error)
            }
        }
    }
    
    func query<T: GraphQLQuery, Model: Codable>(model type: Model.Type,
                                                _ guery: T,
                                                controller: BaseController?,
                                                cash: CachePolicy = .fetchIgnoringCacheData,
                                                successHandler: @escaping ((_ model :Model) -> Void),
                                                failureHandler: @escaping ((_ error: Error) -> Void)) -> Cancellable {
        
        apollo.fetch(query: guery, cachePolicy: cash) { (result) in
            switch result {
            case .success(let queryResult):
                do {
                    let data = try JSONSerialization.data(withJSONObject: queryResult.data?.jsonObject ?? JSONObject(), options: .fragmentsAllowed)
                    let model = try JSONDecoder().decode(Model.self, from: data)
                    successHandler(model)
                } catch {
                    debugPrint("Failure! Error: \(error)")
                    if queryResult.errors?.first?.message == "Not authenticated" {
                        KeychainService.standard.removeAll()
                        RootRouter.sharedInstance.loadStart(toWindow: RootRouter.sharedInstance.window!)
                    }
                    if let message = queryResult.errors?.first?.message {
                        controller?.view?.makeToast(message)
                        failureHandler(error)
                    } else {
                        controller?.view?.makeToast(error.localizedDescription)
                        failureHandler(error)
                    }
                }
            case .failure(let error):
                debugPrint("Failure! Error: \(error)")
                controller?.view?.makeToast(error.localizedDescription)
                failureHandler(error)
            }
        }
    }
    
    func upload<T: GraphQLMutation, Model: Codable>(model type: Model.Type,
                                                    _ guery: T,
                                                    controller: BaseController?,
                                                    files: [GraphQLFile],
                                                    successHandler: @escaping ((_ model :Model) -> Void),
                                                    failureHandler: @escaping ((_ error: Error) -> Void)) -> Cancellable {
        
        apollo.upload(operation: guery, files: files, queue: DispatchQueue.main) { (result) in
            switch result {
            case .success(let queryResult):
                do {
                    let data = try JSONSerialization.data(withJSONObject: queryResult.data?.jsonObject ?? JSONObject(), options: .fragmentsAllowed)
                    let model = try JSONDecoder().decode(Model.self, from: data)
                    successHandler(model)
                } catch {
                    debugPrint("Failure! Error: \(error)")
                    if queryResult.errors?.first?.message == "Not authenticated" {
                        KeychainService.standard.removeAll()
                        RootRouter.sharedInstance.loadStart(toWindow: RootRouter.sharedInstance.window!)
                    }
                    if let message = queryResult.errors?.first?.message {
                        controller?.view?.makeToast(message)
                        failureHandler(error)
                    } else {
                        controller?.view?.makeToast(error.localizedDescription)
                        failureHandler(error)
                    }
                }
            case .failure(let error):
                debugPrint("Failure! Error: \(error)")
                controller?.view?.makeToast(error.localizedDescription)
                failureHandler(error)
            }
        }
    }
}

///Managments
extension Network {
    class ResponseLoggingInterceptor: ApolloInterceptor {
        
        enum ResponseLoggingError: Error {
            case notYetReceived
        }
        
        func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
                
                defer {
                    chain.proceedAsync(request: request,
                                       response: response,
                                       completion: completion)
                }
                
                guard let receivedResponse = response else {
                    chain.handleErrorAsync(ResponseLoggingError.notYetReceived,
                                           request: request,
                                           response: response,
                                           completion: completion)
                    return
                }
                
#if DEBUG
                debugPrint("==========================================================")
                printRequest(request: try? request.toURLRequest(),
                             data: receivedResponse.rawData,
                             params: request.operation.variables?.jsonObject)
                
                debugPrint("STATUS CODE:", receivedResponse.httpResponse.statusCode)
                debugPrint("==========================================================")
#endif
            }
        
        func printRequest(request: URLRequest?, data: Data?, params: [String: Any]?) {
            debugPrint("SEND TO SERVER:", request?.httpMethod ?? "", request?.url?.absoluteString ?? "<url is nil>")
            debugPrint("HEADERS:", request?.allHTTPHeaderFields ?? "<headers is empty>")
            debugPrint("BODY:", params ?? "<body is empty>")
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options : .allowFragments) {
                debugPrint("DATA:", json )
            } else if let data = data {
                let str = String(decoding: data, as: UTF8.self)
                debugPrint("DATA:", str )
            } else {
                debugPrint("DATA:", "<data is empty>" )
            }
        }
    }
    
    class RequestLoggingInterceptor: ApolloInterceptor {
        
        func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
                
#if DEBUG
                debugPrint("==========================================================")
                printRequest(request: try? request.toURLRequest(),
                             params: request.operation.variables?.jsonObject)
                debugPrint("==========================================================")
#endif
                
                chain.proceedAsync(request: request,
                                   response: response,
                                   completion: completion)
            }
        
        func printRequest(request: URLRequest?, params: [String: Any]?) {
            debugPrint("TRY SEND TO SERVER:", request?.httpMethod ?? "", request?.url?.absoluteString ?? "<url is nil>")
            debugPrint("HEADERS:", request?.allHTTPHeaderFields ?? "<headers is empty>")
            debugPrint("BODY:", params ?? "<body is empty>")
        }
    }
    
    class UserManagementInterceptor: ApolloInterceptor {
        
        enum UserError: Error {
            case noUserLoggedIn
        }
        
        private func addTokenAndProceed<Operation: GraphQLOperation>(
            _ token: AuthModel?,
            to request: HTTPRequest<Operation>,
            chain: RequestChain,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
                if let token = token?.token {
                    request.addHeader(name: "Authorization", value: "Bearer \(token)")
                }
                
                chain.proceedAsync(request: request,
                                   response: response,
                                   completion: completion)
            }
        
        func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
                
//                                guard let token = KeychainService.standard.newAuthToken else {
//                                    chain.handleErrorAsync(UserError.noUserLoggedIn,
//                                                           request: request,
//                                                           response: response,
//                                                           completion: completion)
//                                    return
//                                }
                
                // If we've gotten here, there is a token!
         //        if token.isExpired == true {
                // Call an async method to renew the token
                //                UserManager.shared.renewToken { [weak self] tokenRenewResult in
                //                    guard let self = self else {
                //                        return
                //                    }
                //
                //                    switch tokenRenewResult {
                //                    case .failure(let error):
                //                        // Pass the token renewal error up the chain, and do
                //                        // not proceed further. Note that you could also wrap this in a
                //                        // `UserError` if you want.
                //                        chain.handleErrorAsync(error,
                //                                               request: request,
                //                                               response: response,
                //                                               completion: completion)
                //                    case .success(let token):
                //                        // Renewing worked! Add the token and move on
                //                        self.addTokenAndProceed(token,
                //                                                to: request,
                //                                                chain: chain,
                //                                                response: response,
                //                                                completion: completion)
                //                    }
                //                }
               //    } else {
                self.addTokenAndProceed(KeychainService.standard.newAuthToken,
                                        to: request,
                                        chain: chain,
                                        response: response,
                                        completion: completion)
              //  }
            }
    }
    
    struct NetworkInterceptorProvider: InterceptorProvider {
        
        private let store: ApolloStore
        private let client: URLSessionClient
        
        init(store: ApolloStore,
             client: URLSessionClient) {
            self.store = store
            self.client = client
        }
        
        func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
            return [
                MaxRetryInterceptor(),
                CacheReadInterceptor(store: self.store),
                UserManagementInterceptor(),
                RequestLoggingInterceptor(),
                NetworkFetchInterceptor(client: self.client),
                ResponseLoggingInterceptor(),
                ResponseCodeInterceptor(),
                JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
                AutomaticPersistedQueryInterceptor(),
                CacheWriteInterceptor(store: self.store)
            ]
        }
    }
}

extension Network {
    class Apollo {
        static let shared = Apollo()
        
        /// A web socket transport to use for subscriptions
        // This web socket will have to provide the connecting payload which
        // initializes the connection as an authorized channel.
        private lazy var webSocketTransport: WebSocketTransport = {
            let url = URL(string: AppConfiguration.shared.wssName)!
            let request = URLRequest(url: url)
            let webSocketClient = WebSocket(request: request, protocol: .graphql_transport_ws)
            let authPayload = ["Authorization": "Bearer \(KeychainService.standard.newAuthToken?.token ?? "")"]
            return WebSocketTransport(websocket: webSocketClient, connectingPayload: authPayload)
        }()
        
        /// An HTTP transport to use for queries and mutations.
        private lazy var normalTransport: RequestChainNetworkTransport = {
            let url = URL(string: AppConfiguration.shared.hostName)!
            return RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(store: self.store), endpointURL: url)
        }()
        
        /// A split network transport to allow the use of both of the above
        /// transports through a single `NetworkTransport` instance.
        private lazy var splitNetworkTransport = SplitNetworkTransport(
            uploadingNetworkTransport: self.normalTransport,
            webSocketNetworkTransport: self.webSocketTransport
        )
        
        /// Create a client using the `SplitNetworkTransport`.
        private(set) lazy var client = ApolloClient(networkTransport: self.splitNetworkTransport, store: self.store)
        
        /// A common store to use for `normalTransport` and `client`.
        private lazy var store = ApolloStore()
    }
}
