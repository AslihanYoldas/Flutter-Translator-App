abstract class BaseStates{}

class InitialState extends BaseStates{

}

class LoadingState extends BaseStates{

}

class ErrorState extends BaseStates{
String message;
ErrorState(this.message);
}