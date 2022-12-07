Subtasks:
  1. Create Custom Config folder, which contains custom dio file
  2. Create list of all endpoints in remote data source class
  3. Create entities(sign in, sign up entities)
  4. Create models(sign in, sign up models)
  5. Make usecases for both endpoint, also their body params
  6. Create bloc: make 2 event(SignInEvent, SignUpEvent) and same 2 states(SignInState, SignUpState)
  7. Create service locator, which register bloc, usecases, repositories, datasources
  8. In home app just call SignInEvent
