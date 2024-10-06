**An example of implementing Dependency Injection**

The Source code Demonstrates implementing `@Injected` **Property Wrapper** with **Dependency Injection** design pattern.
>[!IMPORTANT]
> Consider generating your APIKey from [OpenWeatherMap](https://openweathermap.org/) then replace with `ADD_YOUR_API_KEY` inside WeatherService.swift file.

```
// MARK: - Dependency Injection Container

class DependencyInjectionContainer {
    
    static let shared = DependencyInjectionContainer()
    
    private var dependencies: [String: AnyObject] = [:]
    
    func register<T>(_ dependency: T, for type: T.Type) {
        let key = String(describing: type)
        dependencies[key] = dependency as AnyObject
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        return dependencies[key] as? T
    }
}

// MARK: - Injected Property Wrapper

@propertyWrapper
struct Injected<T> {
    private var dependency: T?
    
    init() {
        self.dependency = DependencyInjectionContainer.shared.resolve(T.self)
    }
    
    var wrappedValue: T {
        guard let dependency = dependency else {
            fatalError("Dependency not registered")
        }
        return dependency
    }
}
```
