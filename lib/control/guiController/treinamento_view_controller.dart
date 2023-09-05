import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/Treinamento.dart';
import 'package:intranet_maispet/view/widgets/widget_treinamento.dart';

//TODO Ajustar List listaDeTreinamentos
//TODO Refazer metodo atualizarWidgetTreinamento para carregar treinamentos de forma dinamica via DB

class TreinamentosViewController{
  List<String> listaDeTreinamentos = [
    'IMPRESSÃO DE CARTEIRINHAS',
    'SISTEMA DE SENHAS'
  ];
  List<Treinamento> treinamentos = [];
  late Widget widgetTreinamento;

  Widget atualizarWidgetTreinamento(String treinamento){
    if (treinamento == 'IMPRESSÃO DE CARTEIRINHAS') {
      widgetTreinamento = WidgetTreinamento(
        nomeDoTreinamento: 'Impressão de Carteirinhas',
        resumoDoTreinamento: 'Esse treinamento tem como objetivo orientar e'
            'esclarecer as dúvidas referente a impressão de carteirinhas dos'
            'pets que o tutor desejar ter a versão física da mesma.',
        linkDoTreinameto: 'https://screenpal.com/watch/c0jDFLVpXyI',
        caminhoDoPdf: 'assets/files/tutorial_impressao_de_carteirinhas.pdf',
        nomeDoPdf: 'Treinamento Impressão de Carteirinhas',
        caminhoDaImagem: 'images/Logo_Nova-removebg-preview.png',
      );
    }else if (treinamento == 'SISTEMA DE SENHAS') {
      widgetTreinamento = WidgetTreinamento(
        nomeDoTreinamento: 'Atendimento Inteligente',
        resumoDoTreinamento: 'Esse treinamento tem como objetivo orientar e '
            'esclarecer as dúvidas referente ao uso do sistema de senhas.',
        linkDoTreinameto: 'https://screenpal.com/watch/c0jUYcVpmz2',
        caminhoDaImagem: 'images/logo_senhas.png',
      );
    }
    return widgetTreinamento;
  }

  List<String> linksVideosPreenchidos = [];

  void salvarDadosTreinamento({
    required String titulo,
    required String descricao,
    required String link1,
    required String link2,
    required String link3,
    required String link4,
    required String link5,
  }){

    if(link1 != ''){
      linksVideosPreenchidos.add(link1);
    }
    if(link2 != ''){
      linksVideosPreenchidos.add(link2);
    }
    if(link3 != ''){
      linksVideosPreenchidos.add(link3);
    }
    if(link4 != ''){
      linksVideosPreenchidos.add(link4);
    }
    if(link5 != ''){
      linksVideosPreenchidos.add(link5);
    }

    Treinamento treinamento = Treinamento(
      titulo: titulo,
      descricao: descricao,
      linksVideos: linksVideosPreenchidos
    );
    listaDeTreinamentos.add(treinamento.titulo);
    treinamentos.add(treinamento);
    print(treinamentos);
  }

}