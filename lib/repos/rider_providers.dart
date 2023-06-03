import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:uuid/uuid.dart';

class RiderNotifier extends StateNotifier<List<Rider>> {
  RiderNotifier()
      : super([
          Rider(
            uuid: const Uuid().v4(),
            name: "Purvesh Dongarwar",
            phoneNumber: 9146477923,
            localities: ["Sadar", "Burdi", "Lokmanya Nagar"],
            address:
                "CRPF Gate No.3, Hingna Road, Digdoh Hills Nagpur ( Maharashtra)",
            pinCode: 440010,
            bankAccountNumber: 39238765008,
            ifsc: "SBIN0001169",
            riderDocs: RiderDocs(
              aadharPath: '',
              bankCheque: '',
              dl: '',
              panCardPath: '',
              photo: '',
            ),
          ),
          Rider(
            uuid: const Uuid().v4(),
            name: "Aman Gupta",
            phoneNumber: 8329032167,
            localities: ["Sadar", "Burdi", "Lokmanya Nagar"],
            address:
                "CRPF Gate No.3, Hingna Road, Digdoh Hills Nagpur ( Maharashtra)",
            pinCode: 440010,
            bankAccountNumber: 39238765008,
            ifsc: "SBIN0001169",
            riderDocs: RiderDocs(
              aadharPath: 'android/path/work',
              bankCheque: 'android/path/work',
              dl: 'android/path/work',
              panCardPath: 'android/path/work',
              photo: 'android/path/work',
            ),
          )
        ]);
  void addRiderInfo(Rider rider) {
    state = [...state, rider];
  }

  void addRiderDocs(String uuid, RiderDocs riderDocs) {
    state = [
      for (final rider in state)
        if (rider.uuid == uuid)
          rider.copyWith(
              riderDocs: RiderDocs(
                  aadharPath: riderDocs.aadharPath,
                  bankCheque: riderDocs.bankCheque,
                  dl: riderDocs.dl,
                  panCardPath: riderDocs.panCardPath,
                  photo: riderDocs.photo))
    ];
  }
}

final riderProvider =
    StateNotifierProvider<RiderNotifier, List<Rider>>((ref) => RiderNotifier());
final isAadharAdded = StateProvider((ref) => false);
final isBankChequeAdded = StateProvider((ref) => false);
final isDLAdded = StateProvider((ref) => false);
final isPanCardAdded = StateProvider((ref) => false);
final isPhotoAdded = StateProvider((ref) => false);

final docProvider = Provider((ref) {
  List<StateProvider> proWider = [
    isAadharAdded,
    isBankChequeAdded,
    isDLAdded,
    isPanCardAdded,
    isPhotoAdded,
  ];
  return proWider;
});
