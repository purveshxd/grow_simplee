import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:uuid/uuid.dart';

class RiderNotifier extends StateNotifier<List<Rider>> {
  // added some default values
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
            isVerified: true,
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
            isVerified: true,
            riderDocs: RiderDocs(
              aadharPath: 'android/path/work',
              bankCheque: 'android/path/work',
              dl: 'android/path/work',
              panCardPath: 'android/path/work',
              photo: 'android/path/work',
            ),
          ),
          Rider(
            isVerified: false,
            uuid: const Uuid().v4(),
            name: "purveshd",
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
        ]);
  void addRiderInfo(Rider rider) {
    state = [...state, rider];
  }

  void verifyRider(String uuid) {
    state = [
      for (final rider in state)
        if (rider.uuid == uuid) rider.copyWith(isVerified: true) else rider,
    ];
  }

  void rejectRider(String uuid) {
    state = [
      for (final rider in state)
        if (rider.uuid == uuid) rider.copyWith(isVerified: false) else rider,
    ];
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
                photo: riderDocs.photo),
          )
        else
          rider
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

final rejectedRiderProvider = Provider<List<Rider>>((ref) {
  final riders = ref.watch(riderProvider);
  return riders.where((rider) => rider.isVerified == false).toList();
});
final verifiedRiderProvider = Provider<List<Rider>>((ref) {
  return ref
      .watch(riderProvider)
      .where((rider) => rider.isVerified == true)
      .toList();
});

final currentPageProvider = StateProvider((ref) => 0);

final localitiesProvider = Provider<List<String>>((ref) => [
      "Mumbai",
      "Delhi",
      "Nagpur",
      "Jaipur",
      "Jodhpur",
      "Hyderabad",
      "Chennai",
      "Bangalore",
      "Kolkata",
      "Pune",
      "Lucknow",
    ]);
final selectedLocalitiesProvider = StateProvider<List<String>>((ref) => []);
