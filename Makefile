PACKAGE=dictav/mecab
MECAB_VERSION=0.996
IPA_VERSION=20070801
JUMAN_VERSION=20130310
IMAGE=$(PACKAGE):$(MECAB_VERSION)

all: mecab mecab-ipa mecab-juman

mecab:
	docker build -f Dockerfile -t $(IMAGE) .

mecab-ipa:
	docker build -f Dockerfile.ipa -t $(IMAGE)-ipa.$(IPA_VERSION) .

mecab-juman:
	docker build -f Dockerfile.juman -t $(IMAGE)-juman.$(JUMAN_VERSION) .
