import 'package:flutter/material.dart';


class RamaisViewController{

  List<Map<String, dynamic>> goiania = [
    {'local': 'Recepção HOSPITAL', 'ramal': '8849',},
    {'local': 'Recepção HOSPITAL', 'ramal': '8850',},
    {'local': 'Recepção HOSPITAL', 'ramal': '8851',},
    {'local': 'Recepção HOSPITAL', 'ramal': '8852',},
    {'local': 'Recepção PETSHOP', 'ramal': '8854',},
    {'local': 'Recepção PETSHOP', 'ramal': '8872',},
    {'local': 'Consultório 1', 'ramal': '8859',},
    {'local': 'Consultório 2', 'ramal': '8860',},
    {'local': 'Consultório 3', 'ramal': '8861',},
    {'local': 'Consultório 4', 'ramal': '8862',},
    {'local': 'Administração - Livyane', 'ramal': '8864',},
    {'local': 'Administração - Jheyne', 'ramal': '8874',},
    {'local': 'Internação', 'ramal': '8865',},
    {'local': 'Estoque', 'ramal': '8866',},
    {'local': 'Plantão', 'ramal': '8873',},
  ];


  List<Map<String, dynamic>> holding = [
    {'local': 'Cobrança', 'ramal': '8867',},
    {'local': 'Financeiro', 'ramal': '8868',},
    {'local': 'Tecnologia - Suporte', 'ramal': '8870',},
    {'local': 'Tecnologia - Diogo', 'ramal': '8875',},
    {'local': 'Recursos Humanos', 'ramal': '8871',},
  ];

  List<Map<String, dynamic>> aparecida = [
    {'local': 'Recepção', 'ramal': '8869',},
    {'local': 'Agendamento 1', 'ramal': '8855',},
    {'local': 'Agendamento 2', 'ramal': '8856',},
    {'local': 'Agendamento 3', 'ramal': '8857',},
    {'local': 'Agendamento 4', 'ramal': '8858',},
    {'local': 'Agendamento 5', 'ramal': '8878',},
    {'local': 'Agendamento 6', 'ramal': '8879',},
    {'local': 'Agendamento 7', 'ramal': '8876',},
    {'local': 'Agendamento 8', 'ramal': '8872',},
    {'local': 'Agendamento 9', 'ramal': '8859',},
    {'local': 'Comercial - Isadora', 'ramal': '8877',},
    {'local': 'Comercial - Beatriz', 'ramal': '2376',},
    {'local': 'Comercial - Amanda', 'ramal': '2375',},
    {'local': 'Comercial - Milla', 'ramal': '2374',},
  ];

  List<Map<String, dynamic>> brasilia = [
    {'local': 'Recepção HOSPITAL', 'ramal': '2356',},
    {'local': 'Recepção HOSPITAL', 'ramal': '2357',},
    {'local': 'Recepção HOSPITAL', 'ramal': '2358',},
    {'local': 'Recepção HOSPITAL', 'ramal': '2359',},
    {'local': 'Recepção PETSHOP', 'ramal': '2360',},
    {'local': 'Consultório 1', 'ramal': '2361',},
    {'local': 'Consultório 2', 'ramal': '2362',},
    {'local': 'Consultório 3', 'ramal': '2363',},
    {'local': 'Consultório 4', 'ramal': '2364',},
    {'local': 'Consultório 5', 'ramal': '2365',},
    {'local': 'Consultório 6', 'ramal': '2366',},
    {'local': 'Administração - Barbara', 'ramal': '2367',},
    {'local': 'Internação', 'ramal': '2368',},
    {'local': 'Estoque', 'ramal': '2369',},
    {'local': 'Comercial - Cauan', 'ramal': '2370',},
    {'local': 'Tomografia', 'ramal': '2371',},
  ];


  List<Map<String, dynamic>> campinas = [
    {'local': 'Recepção HOSPITAL', 'ramal': '2377',},
    {'local': 'Recepção HOSPITAL', 'ramal': '711,'},
    {'local': 'Recepção HOSPITAL', 'ramal': '712',},
    {'local': 'Recepção PETSHOP', 'ramal': '2378',},
    {'local': 'Recepção PETSHOP', 'ramal': '713',},
    {'local': 'Recepção PETSHOP', 'ramal': '714',},
    {'local': 'Consultório 1', 'ramal': '2379',},
    {'local': 'Consultório 2', 'ramal': '2380',},
    {'local': 'Consultório 3', 'ramal': '2381',},
    {'local': 'Consultório 4', 'ramal': '2382',},
    {'local': 'Consultório 5', 'ramal': '2383',},
    {'local': 'Consultório 6', 'ramal': '2384',},
    {'local': 'Administração - Elaine', 'ramal': '2385',},
    {'local': 'Tomografia', 'ramal': '2386',},
    {'local': 'Sala de Laudos', 'ramal': '2387',},
    {'local': 'Laboratório', 'ramal': '2388',},
    {'local': 'Internação', 'ramal': '2389',},
    {'local': 'Exame e Diagnóstico', 'ramal': '2390',},
    {'local': 'Plantão', 'ramal': '2391',},
    {'local': 'Estoque', 'ramal': '2392',},
    {'local': 'Comercial Isabela', 'ramal': '2373',},
  ];

  List<DataColumn> myColumns = [
    DataColumn(label: Text('LOCAL')),
    DataColumn(label: Text('RAMAL')),
  ];
}