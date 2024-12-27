/*
Encapsulation is the bundling of data and methods that operate on the data within a single unit, known as a class. 
It hides the internal state of an object from the outside world, only exposing the necessary functionalities through well-defined interfaces.
*/

class BankAccount {
  double _Balance = 0;

  void Deposit(double amount) {
    _Balance += amount;
    print("you deoposited ($amount) successfully");
  }

  void Withdraw(double amount) {
    if (amount <= _Balance) {
      print("you withdrawn ($amount) successfully");
      _Balance -= amount;
    } else {
      print("Insufficient balance");
    }
  }

  void showBalance() {
    print("Your balance is ${_Balance}");
  }

}

void main() {
  var Account1 = BankAccount();
  Account1.Deposit(4442.50);
  Account1.showBalance();
  Account1.Withdraw(4440);
  Account1.showBalance();
}
