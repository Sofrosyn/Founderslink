enum ViewState { Idle, Loading, Success, Failed }

enum RegisterValidateState {
  Idle,
  NameError,
  EmailError,
  PhoneError,
  CanRegister,
  LastNameError,
  CompanyNameError,
  CompanyAddressError,
  CompanyEmailError
}

enum LoginValidateState { Idle, EmailError, PasswordError, CanLogin }

enum WarehouseValidateState {
  Idle,
  NameError,
  DescriptionError,
  LocationError,
  CanAdd
}

enum TransactonState { InTransit, Pending, Delivered, Canceled }
enum RequestProgressState { Pending, Failed, Done }
