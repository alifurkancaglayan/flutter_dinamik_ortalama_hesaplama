import 'package:flutter/material.dart';

import '../constants/app_constant.dart';
import '../helper/data_helper.dart';

class KredilerDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  KredilerDropdownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<KredilerDropdownWidget> createState() => _KredilerDropdownWidget();
}

class _KredilerDropdownWidget extends State<KredilerDropdownWidget> {
  double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            widget.onKrediSecildi(secilenKrediDegeri);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
