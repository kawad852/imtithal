import 'dart:io';

import 'package:shared/shared.dart';

class UserInputScreen extends StatefulWidget {
  final UserModel? user;

  const UserInputScreen({super.key, this.user});

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final _formKey = GlobalKey<FormState>();
  late PhoneController _phoneController;
  late UserModel _user;
  final _storageService = StorageService();
  XFile? _file;

  Future<void> _pickImage(BuildContext context) async {
    AppOverlayLoader.fakeLoading();
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _file = file;
      });
    }
  }

  Future<void> _submit(BuildContext context) async {
    try {
      String? errorMsg;
      if (_user.profilePhoto == null && _file == null) {
        errorMsg = context.appLocalization.personalPhotoRequired;
      }
      if (errorMsg != null) {
        Fluttertoast.showToast(msg: errorMsg);
      } else {
        if (_formKey.currentState!.validate()) {
          AppOverlayLoader.show();
          context.unFocusKeyboard();
          if (widget.user == null) {
            final id = await context.userProvider.createAuthUser(_user.email!, _user.password);
            _user.id = id;
            _user.createdAt = kNowDate;
          }
          final userDocRef = kFirebaseInstant.users.doc(_user.id);
          if (context.mounted) {
            _user.languageCode = context.languageCode;
            _user.phoneNum = _phoneController.getPhoneNumber;
            _user.phoneCountryCode = _phoneController.countryCode;
            _user.rowId = await RowIdHelper().getUserId();
            if (_file != null) {
              _user.profilePhoto = await _storageService.uploadFile(
                collection: "personalPhotos",
                file: _file!,
              );
            }
            await userDocRef.set(_user);
          }
          if (context.mounted) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: context.appLocalization.savedSuccessfully);
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'weak-password') {
          context.showSnackBar("passwordWeakError");
        } else if (e.code == 'email-already-in-use') {
          context.showSnackBar("emailAlreadyInUse");
        } else {
          context.showSnackBar(context.appLocalization.generalError);
        }
      }
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar(context.appLocalization.generalError);
      }
    } finally {
      AppOverlayLoader.hide();
    }
  }

  @override
  void initState() {
    super.initState();
    _user = UserModel.fromJson(
      widget.user?.copyWith(companyId: kCompanyId, createdById: kUserId).toJson() ??
          UserModel(companyId: kCompanyId, createdById: kUserId).toJson(),
    );
    _phoneController = PhoneController(
      context,
      countryCode: _user.phoneCountryCode,
      phoneNum: _user.phoneNum,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.appLocalization.addEmployee)),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.add,
        onPressed: () {
          _submit(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Builder(
                    builder: (context) {
                      if (_file != null) {
                        return GestureDetector(
                          onTap: () {
                            _pickImage(context);
                          },
                          child: Image.file(
                            File(_file!.path),
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else if (_user.profilePhoto != null) {
                        return BaseNetworkImage(
                          _user.profilePhoto!,
                          height: 90,
                          width: 90,
                          onTap: () {
                            _pickImage(context);
                          },
                        );
                      }
                      return MaterialButton(
                        color: context.colorPalette.greyF2F,
                        elevation: 0,
                        onPressed: () {
                          _pickImage(context);
                        },
                        height: 90,
                        minWidth: 90,
                        child: const Icon(Icons.add),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TitledTextField(
                        title: context.appLocalization.fullName,
                        child: TextEditor(
                          initialValue: _user.displayName,
                          onChanged: (value) => _user.displayName = value!,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TitledTextField(
                        title: context.appLocalization.jobTitle,
                        child: TextEditor(
                          initialValue: _user.jobTitle,
                          onChanged: (value) => _user.jobTitle = value!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Expanded(
                    child: TitledTextField(
                      title: context.appLocalization.role,
                      child: DropDownEditor(
                        value: _user.role,
                        onChanged: (value) {
                          setState(() {
                            _user.role = value;
                          });
                        },
                        title: "",
                        items:
                            RoleEnum.values.map((e) {
                              return DropdownMenuItem(
                                value: e.value,
                                child: Text(RoleEnum.getRoleLabel(context, e)),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  if (_user.role != RoleEnum.admin.value)
                    Expanded(
                      child: TitledTextField(
                        title: context.appLocalization.department,
                        child: DepartmentsSelector(
                          builder: (context, departments) {
                            return DropDownEditor(
                              value: _user.departmentId,
                              onChanged: (value) {
                                setState(() {
                                  _user.departmentId = value!;
                                });
                              },
                              title: "",
                              items:
                                  departments.map((e) {
                                    return DropdownMenuItem(value: e.id, child: Text(e.name));
                                  }).toList(),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TitledTextField(
                        title: context.appLocalization.nationalIDNumber,
                        child: TextEditor(
                          initialValue: _user.nationalNumber,
                          onChanged: (value) => _user.nationalNumber = value!,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TitledTextField(
                        title: context.appLocalization.phoneNumber,
                        child: PhoneEditor(controller: _phoneController, required: true),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TitledTextField(
                      title: context.appLocalization.salary,
                      child: DecimalsEditor(
                        initialValue: _user.salary == 0 ? null : _user.salary,
                        onChanged: (value) => _user.salary = value!,
                        textAlign: TextAlign.center,
                        suffixIcon: const IconButton(
                          onPressed: null,
                          icon: CustomSvg(MyIcons.currency),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TitledTextField(
                      title: context.appLocalization.startDate,
                      child: DatePickerEditor(
                        value: _user.workStartDate ?? kNowDate,
                        onChanged: (value) {
                          _user.workStartDate = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TitledTextField(
                  title: context.appLocalization.address,
                  child: TextEditor(
                    initialValue: _user.address,
                    onChanged: (value) => _user.address = value!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TitledTextField(
                        title: context.appLocalization.email,
                        child: EmailEditor(
                          initialValue: _user.email,
                          readonly: widget.user != null,
                          onChanged: (value) => _user.email = value!,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TitledTextField(
                        title: context.appLocalization.password,
                        child: PasswordEditor(
                          initialValue: _user.password,
                          onChanged: (value) => _user.password = value!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
