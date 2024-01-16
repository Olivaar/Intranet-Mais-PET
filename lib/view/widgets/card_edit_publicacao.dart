import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/publicacao.dart';
import 'package:intranet_maispet/repositories/publicacao_repository.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/container_nova_publicacao.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';

class CardEditPulicacao extends StatelessWidget {

  Publicacao publicacao;
  bool adm = false;

  CardEditPulicacao({
    super.key,
    required this.publicacao,
    required this.adm
  });

  Widget _buildUpdatePublicacao(BuildContext context, Publicacao pub){
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 500,
        child: ContainerNovaPublicacao(updatePublicacao: publicacao,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    PublicacaoRepository publicacaoRepository = PublicacaoRepository();

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: BoxDecoration(
        color: adm == true ? azulClaro.withOpacity(0.8) : branco.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 210
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                publicacao.urlImage,
                width: 180,
                height: 180,
              ),
            ),
            const SizedBox(width: 10,),

            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    publicacao.titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: adm == true ? 130 : 165
                    ),
                    child: ListView(
                      children: [
                        Text(
                          publicacao.texto,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),

                  if(adm == true)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                _buildUpdatePublicacao(context, publicacao),
                            );
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('Editar'),
                          style: ThemeHelper().buttonStyle2(colorButton: branco),
                        ),
                        const SizedBox(width: 10,),

                        TextButton.icon(
                          onPressed: () {
                            publicacaoRepository.deletePublicaao(publicacao.id);
                          },
                          icon: const Icon(Icons.delete_forever_outlined),
                          label: const Text('Excluir'),
                          style: ThemeHelper().buttonStyle2(colorButton: branco),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
