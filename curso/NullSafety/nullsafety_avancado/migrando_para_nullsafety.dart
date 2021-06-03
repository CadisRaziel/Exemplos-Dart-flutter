//escolha a partir da versao 2.12 do dart (versão que introduzio o nullsafety)
//dart --version para verificar sua versão

//quando migrar ?
//aguarde a migração dos packages que seu codigo depende dele
//verifique se todas dependencias estao migrados
//dart pub outdated --model==null-safety
//esse comando acima vai mostrar uma lista de todas dependnecias do projeto e vai trazer as dependencias que suporta o nullsafety (se estiver em verde esta pronta para migração)
//atualize as versoes do packages: dart pub upgrade --null-safety
//e depois: dart pub get

//sound nullSafety = o projeto esta com o nullsafety habilitado e isso da mais segurança

//para fazer a migração temos duas opções
//1º usar a ferramenta de migração que o dar disponibiliza(ela faz a maioria das mudanças previsiveis, ou seja vai tentar ao maximo colocar o codigo no nullsafety, claro que nao e 100%)
//2º migrar manualmente, é mais trabalhosa porém é mais precisa que a ferramenta de migração

//usando a ferramenta de migração
//no terminal digite: dart pub upgrade --null-safety
//depois coloque: dart migrate
//quando chamar o dart migrate ele vai mostar uma url, clique nela a pagina ajuda na hora da migração
//depois de apply changes la na ulr

//LEMBRE-SE SEMPRE SALVE O CODIGO ANTES DE FAZER ISSO

//rever a aula quando fazer uma migração e utiizar os hint marker pois é exetramente uteis
//o hint marker não é apagado na url, voce precisa apagar ele no codigo caso precise
