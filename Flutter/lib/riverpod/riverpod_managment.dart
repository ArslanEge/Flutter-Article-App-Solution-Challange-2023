import 'package:flutter_application_2/riverpod/login_riverpod.dart';
import 'package:flutter_application_2/riverpod/register_riverpod.dart';
import 'package:flutter_application_2/riverpod/word_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginRiverpod=ChangeNotifierProvider((_)=>LoginRiverpod());
final registerRiverpod=ChangeNotifierProvider((_)=>RegisterRiverpod());
final wordRiverpod=ChangeNotifierProvider((_)=>WordRiverpod());
