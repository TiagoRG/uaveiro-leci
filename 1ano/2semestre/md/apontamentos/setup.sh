# Confirma que o script está a ser executado no diretório correto
# shellcheck disable=SC2164
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

if [ $# != 1 ]
then
  # Isto executa se o comando tiver mais do que 1 argumento
  echo "Correct usage: md [class name (may not include spaces!)]"

else
  if [ "$1" == "reset" ]
  then
    # Reinicializa o template usando o git restore
    git checkout 657720aba1fa3bde17d30f2021e001a972c18795 -- 1ano/2semestre/md/apontamentos/template/

    # Termina o script
    exit 0
  fi

  # Cria o diretório da determinada aula
  mkdir "classes/$1"

  # Copia o conteúdo da aula para o diretório respetivo
  cp -a "template/out" "classes/$1"
  cp -a "template/src" "classes/$1"

  # Reinicializa o template usando o git restore
  git restore template

  # Copia o pdf da aula para a pasta que contém todos os pdf
  cp "classes/$1/out/main.pdf" "pdf"
  mv "pdf/main.pdf" "pdf/$1.pdf"
fi
