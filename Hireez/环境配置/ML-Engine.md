# 配置环境
<!-- bash -->
apt-get update
apt install git
apt install git-lfs
apt install sudo


# conda install

conda info -e
conda create -n ml-engine python=2.7.18


# python
apt-get install libpoppler-cpp-dev
pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_md-2.0.0/en_core_web_md-2.0.0.tar.gz
python -m spacy download en_core_web_lg
python -m spacy download en_core_web_sm
pip install git+https://www.github.com/keras-team/keras-contrib.git

python -c '
import nltk
nltk.download("stopwords")
nltk.download("omw-1.4")
'


