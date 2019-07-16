import 'package:flutter_ornekler/anaEkran/anaSayfa.dart';
import 'package:flutter_ornekler/kisa_kisa_widgetler/expanded_flexible.dart';
import 'package:flutter_ornekler/kisa_kisa_widgetler/opacityDemo.dart';
import 'package:flutter_ornekler/kisa_kisa_widgetler/safeArea.dart';
import 'package:flutter_ornekler/kisa_kisa_widgetler/wrap_ve_chip.dart';
import 'package:flutter_ornekler/sayfalar/alertDialog.dart';
import 'package:flutter_ornekler/sayfalar/botton_navigation.dart';
import 'package:flutter_ornekler/sayfalar/butonlar.dart';
import 'package:flutter_ornekler/sayfalar/container.dart';
import 'package:flutter_ornekler/sayfalar/diger_form_elemanlari.dart';
import 'package:flutter_ornekler/sayfalar/formDemo.dart';
import 'package:flutter_ornekler/sayfalar/giris_uygulamasi.dart';
import 'package:flutter_ornekler/sayfalar/gridView.dart';
import 'package:flutter_ornekler/sayfalar/http_ile_json.dart';
import 'package:flutter_ornekler/sayfalar/json_parsing.dart';
import 'package:flutter_ornekler/sayfalar/listview_builder.dart';
import 'package:flutter_ornekler/sayfalar/local_json.dart';
import 'package:flutter_ornekler/sayfalar/navigation_drawer.dart';
import 'package:flutter_ornekler/sayfalar/pageView_demo.dart';
import 'package:flutter_ornekler/sayfalar/resim_ekleme.dart';
import 'package:flutter_ornekler/sayfalar/row_column.dart';
import 'package:flutter_ornekler/sayfalar/sayfalar_arasi_gecis.dart';
import 'package:flutter_ornekler/sayfalar/sharedPreferance.dart';
import 'package:flutter_ornekler/sayfalar/snackbar-flushbar.dart';
import 'package:flutter_ornekler/sayfalar/sqFliteDemo.dart';
import 'package:flutter_ornekler/sayfalar/stack_positioned.dart';
import 'package:flutter_ornekler/sayfalar/stateles_uygulama.dart';
import 'package:flutter_ornekler/sayfalar/statefull_widget.dart';
import 'package:flutter_ornekler/sayfalar/tabbar_demo.dart';
import 'package:flutter_ornekler/sayfalar/textField_demo.dart';
import 'package:flutter_ornekler/sayfalar/textWidget.dart';
import 'package:flutter_ornekler/yardimci_siniflar/sayfa_isimleri.dart';
import 'package:flutter_ornekler/sayfalar/yerel_depolama.dart';

/// Rota isimlerini tutucak
var rotalar = {
  "/": (context) => AnaSayfa(),
  SayfaIsimleri.GIRIS_UYGULAMASI: (context) => BasitUygulama(),
  SayfaIsimleri.STATELESS_WIDGET: (context) => StatelesUygulama(),
  SayfaIsimleri.STATEFUL_WIDGET: (context) => StatefullUygulama(),
  SayfaIsimleri.CONTAINER: (context) => ContainerDemo(),
  SayfaIsimleri.ROW_COLUMN: (context) => RowVeColumn(),
  SayfaIsimleri.TEXT: (context) => TextWidget(),
  SayfaIsimleri.TEXTFIELD: (context) => TextFieldOrnek(),
  SayfaIsimleri.RESIM_EKLEME: (context) => ResimEkleme(),
  SayfaIsimleri.BUTONLAR: (context) => Butonlar(),
  SayfaIsimleri.STACK_POSITIONED: (context) => StackVePositioned(),
  SayfaIsimleri.FORM: (context) => FormDemo(),
  SayfaIsimleri.FORM_ELEMANLARI: (context) => DigerFormElemanlari(),
  SayfaIsimleri.LISTELER: (context) => ListViewDemo(),
  SayfaIsimleri.GRIDVIEW: (context) => GridViewDemo(),
  SayfaIsimleri.PAGEVIEW: (context) => PageViewDemo(),
  SayfaIsimleri.BOTTOM_NAV: (context) => BottonBarDemo(),
  SayfaIsimleri.TAB_BAR: (context) => TabbarDemo(),
  SayfaIsimleri.NAVIGATION_DRAWER: (context) => NavigationDrawer(),
  SayfaIsimleri.SNACKBAR_FLUSBAR: (context) => SnackBarDemo(),
  SayfaIsimleri.ALERTDIALOG: (context) => AlertDialogDemo(),
  SayfaIsimleri.SAYFALARARASI: (context) => Asayfasi(),
  SayfaIsimleri.YEREL_JSON: (context) => YerelJson(),
  SayfaIsimleri.HTTP_JSON: (context) => OnlineJson(),
  SayfaIsimleri.JSON_PARSING: (context) => JsonParsing(),
  SayfaIsimleri.YEREL_DEPOLAMA: (context) => YerelDepolama(),
  SayfaIsimleri.SHAREDPREFERANCE: (context) => SharedPreferanceDemo(),
  SayfaIsimleri.SQFLITE: (context) => SQLiteDemo(),
  SayfaIsimleri.SAFEAREA: (context) => SafeAreaDemo(),
  SayfaIsimleri.EXPANDED_FLEXIBLE: (context) => ExpandedVeFlexible(),
  SayfaIsimleri.WRAP_CHIP: (context) => WrapVeChip(),
  SayfaIsimleri.OPACITY: (context) => OpacityDemo(),
};
