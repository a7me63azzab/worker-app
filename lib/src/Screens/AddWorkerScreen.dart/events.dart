class AddWorkerEvents {}

class AddWorkerStarted extends AddWorkerEvents {
  final String name;
  final String phone;
  final String address;

  AddWorkerStarted({
    this.phone,
    this.name,
    this.address,
  });
}

class AddWorkerCompleted extends AddWorkerEvents{}
class AddWorkerFailed extends AddWorkerEvents{}
