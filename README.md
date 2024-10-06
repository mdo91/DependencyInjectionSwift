**An example of implementing Dependency Injection**

The Source code Demonstrates implementing `@Injected` **Property Wrapper** with **Dependency Injection** design pattern.
>[!IMPORTANT]
> Consider generating your APIKey from [OpenWeatherMap](https://openweathermap.org/) then replace with `ADD_YOUR_API_KEY` inside WeatherService.swift file.

```swift
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

**How the `@Injected` Property Wrapper Works:**
**Injected Dependencies:** The `@Injected` property wrapper automatically fetches the required dependency from the DependencyInjectionContainer when needed, eliminating the need for manual dependency passing or initializer injection.
**Use Case:** In the **ViewModel (WeatherViewModel)**, we use `@Injected` to automatically inject the FetchWeatherUseCase without needing to manually pass it through the initializer.
**Repository & Service:** The repository (WeatherRepositoryImpl) and use case (FetchWeatherUseCaseImpl) also use `@Injected` to inject their respective dependencies like WeatherService and WeatherRepository.


