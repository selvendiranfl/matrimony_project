import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'registrationscreen2_event.dart';
part 'registrationscreen2_state.dart';

class Registrationscreen2Bloc extends Bloc<Registrationscreen2Event, Registrationscreen2State> {

  String selectedMarStatus="select";
  String selectedCaste="select";
  String selectedDhosham="select";
  TextEditingController subCaste = TextEditingController();
  TextEditingController countryValue = TextEditingController();
  TextEditingController stateValue = TextEditingController();
  TextEditingController cityValue = TextEditingController();


  String selectedMarrydiffComm = "";

  Registrationscreen2Bloc() : super(Registrationscreen2Initial()) {
    on<Registrationscreen2Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
