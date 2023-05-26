import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_practice_the_app/blocs/other/bloc_modules/ExpensesVoucher/expenses_voucher_bloc.dart';
import 'package:for_practice_the_app/ui/res/color_resources.dart';
import 'package:for_practice_the_app/ui/res/image_resources.dart';
import 'package:for_practice_the_app/ui/screens/DashBoard/home_screen.dart';
import 'package:for_practice_the_app/ui/screens/base/base_screen.dart';
import 'package:for_practice_the_app/ui/widgets/common_widgets.dart';
import 'package:for_practice_the_app/utils/general_utils.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class ExpenseVoucherAddEditScreen extends BaseStatefulWidget {
  static const routeName = "/ExpenseVoucherAddEditScreen";

  @override
  _ExpenseVoucherAddEditScreenState createState() =>
      _ExpenseVoucherAddEditScreenState();
}

class _ExpenseVoucherAddEditScreenState
    extends BaseState<ExpenseVoucherAddEditScreen>
    with BasicScreen, WidgetsBindingObserver {
  ExpensesVoucherBloc _expensesBloc;

  /***************************************TextEditing Controllers***************************************/

  //Basic Information
  TextEditingController _voucher_date = TextEditingController();
  TextEditingController _voucher_date_ID = TextEditingController();
  TextEditingController _voucher_no = TextEditingController();
  TextEditingController _voucher_no_ID = TextEditingController();

  // Cash Information
  TextEditingController _voucher_account = TextEditingController();
  TextEditingController _voucher_account_ID = TextEditingController();
  TextEditingController _expn_ac = TextEditingController();
  TextEditingController _expn_ac_ID = TextEditingController();
  TextEditingController _voucher_amount = TextEditingController();
  TextEditingController _voucher_amount_ID = TextEditingController();

  //Transaction Notes
  TextEditingController _transaction_note = TextEditingController();
  TextEditingController _transaction_note_ID = TextEditingController();

  @override
  void initState() {
    _expensesBloc = ExpensesVoucherBloc(baseBloc);
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _expensesBloc,
      child: BlocConsumer<ExpensesVoucherBloc, ExpensesVoucherStates>(
        builder: (BuildContext context, ExpensesVoucherStates state) {
          return super.build(context);
        },
        buildWhen: (oldState, currentState) {
          return false;
        },
        listener: (BuildContext context, ExpensesVoucherStates state) {
          return super.build(context);
        },
        listenWhen: (oldState, currentState) {
          return false;
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: NewGradientAppBar(
          gradient: LinearGradient(colors: [
            Color(0xff108dcf),
            Color(0xff0066b3),
            Color(0xff62bb47),
          ]),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.water_damage_sharp,
                  color: colorWhite,
                  size: 20,
                ),
                onPressed: () {
                  //_onTapOfLogOut();
                  navigateTo(context, HomeScreen.routeName,
                      clearAllStack: true);
                })
          ],
          title: Text(
            "Manage Expenses",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                space(10, 0),
                basicDetails(),
                space(10, 0),
                transactionNotes(),
                space(10, 0),
                uploadDocument(),
                space(10, 0),
                save(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    navigateTo(context, HomeScreen.routeName, clearAllStack: true);
  }

  Widget basicDetails() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  child:
                      customTextLabel("Voucher No.", leftPad: 9, bottomPad: 2)),
              Flexible(
                  child:
                      customTextLabel("Voucher Date", leftPad: 9, bottomPad: 2))
            ],
          ),
          Row(
            children: [
              Flexible(
                  child: EditText(context,
                      inputTextStyle: TextStyle(fontSize: 14),
                      hint: "Voucher No.",
                      radius: 15,
                      controller: _voucher_no,
                      boxheight: 40,
                      keyboardType: TextInputType.number,
                      readOnly: true)),
              Flexible(
                child: EditText(context,
                    inputTextStyle: TextStyle(fontSize: 14),
                    hint: "DD-MM-YYYY",
                    radius: 15,
                    controller: _voucher_date,
                    boxheight: 40,
                    keyboardType: TextInputType.number,
                    readOnly: true,
                    suffixIcon: Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.calendar_today,
                          size: 15,
                          color: colorGrayVeryDark,
                        ))),
              ),
            ],
          ),
          space(15, 0),
          customTextLabel("Voucher Account *", leftPad: 9, bottomPad: 2),
          EditText(
            context,
            inputTextStyle: TextStyle(fontSize: 13),
            hint: "Voucher Account",
            radius: 15,
            controller: _voucher_account,
            boxheight: 40,
          ),
          space(15, 0),
          customTextLabel("Expn. A/c *", leftPad: 9, bottomPad: 2),
          EditText(
            context,
            inputTextStyle: TextStyle(fontSize: 13),
            hint: "Tap to Search Expn. A/c",
            radius: 15,
            controller: _expn_ac,
            boxheight: 40,
          ),
          space(15, 0),
          customTextLabel("Voucher Amount", leftPad: 9, bottomPad: 2),
          EditText(context,
              inputTextStyle: TextStyle(fontSize: 13),
              title: "Bill No.",
              hint: "Tap to Select Voucher Amount",
              controller: _voucher_amount,
              radius: 15,
              boxheight: 40),
        ],
      ),
    );
  }

  Widget transactionNotes() {
    return customExpansionTileType1(
        "Transaction Notes *",
        Column(children: [
          customTextLabel("Transaction Notes", leftPad: 9, bottomPad: 2),
          EditText(
            context,
            inputTextStyle: TextStyle(fontSize: 13),
            hint: "Transaction Notes",
            radius: 15,
            maxLines: 3,
            controller: _transaction_note,
            boxheight: 70,
          ),
        ]),
        Icon(Icons.note_alt),
        image: CREDIT_INFORMATION);
  }

  Widget uploadDocument() {
    return customExpansionTileType1(
        "Upload Document",
        Column(
          children: [
            space(10.0, 0.0),
            customTextLabel("Upload Document Here"),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 10, left: 20),
                width: 130,
                height: 25,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  child: getCommonButton(baseTheme, () {}, "Choose File",
                      backGroundColor: colorPrimary, textSize: 12),
                ),
              ),
            ),
            space(10.0, 0.0),
          ],
        ),
        Icon(Icons.upload));
  }

  Widget save() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: getCommonButton(baseTheme, () {}, "Save"));
  }
}
