# App Startup Handling in Flutter

We will handle startup functions.

## Getting Started

When app launched we usually call some methods like ``` Firebase.initializeApp() ```. We usually call these methods before runApp function.

```
Future<void> main() async {
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}
```
But what happens if these functions throw error? App will crash. So what can we do to prevent this? We can wrap our functions with try catch. 
```
Future<void> main() async {
  try {
    await Firebase.initializeApp();
    runApp(const MyApp());
  } catch {
    runApp(const StartupFailureView());
  }
}
```
This approach is good but we can't "retry". Users can close and open the app to restart but I think users should have an option to retry app startup. So how do we implement this feature? We will create a Cubit and call these startup functions in this Cubit. Then we will show users the correct view(loading, completed, failure).

## Inspired from codewithandrea.com
[codewithandrea article](https://codewithandrea.com/articles/robust-app-initialization-riverpod/)