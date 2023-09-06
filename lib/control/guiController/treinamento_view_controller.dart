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
        caminhoDoPdf: 'assets/files/tutorial_impressao_de_carteirinhas.pdf',
        nomeDoPdf: 'Treinamento Impressão de Carteirinhas',
        caminhoDaImagem: 'images/Logo_Nova-removebg-preview.png',
        links: ['https://screenpal.com/watch/c0jDFLVpXyI',],
      );
    }else if (treinamento == 'SISTEMA DE SENHAS') {
      widgetTreinamento = WidgetTreinamento(
        nomeDoTreinamento: 'Atendimento Inteligente',
        resumoDoTreinamento: 'Esse treinamento tem como objetivo orientar e '
            'esclarecer as dúvidas referente ao uso do sistema de senhas.',
        caminhoDaImagem: 'images/logo_senhas.png',
        links: ['https://screenpal.com/watch/c0jUYcVpmz2'],
      );
    }
    return widgetTreinamento;
  }

  List<String> linksVideosPreenchidos = [];

  Treinamento salvarDadosTreinamento({
    required String titulo,
    required String descricao,
    required String link1,
    required String link2,
  }){
    if(link1 != ''){
      linksVideosPreenchidos.add(link1);
    }
    if(link2 != ''){
      linksVideosPreenchidos.add(link2);
    }

    Treinamento treinamento = Treinamento(
      titulo: titulo,
      descricao: descricao,
      linksVideos: linksVideosPreenchidos
    );
    listaDeTreinamentos.add(treinamento.titulo);
    treinamentos.add(treinamento);
    print(treinamentos);
    return treinamento;
  }

}