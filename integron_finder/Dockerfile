FROM ubuntu:16.04

MAINTAINER Bertrand Neron <bneron@pasteur.fr>

LABEL ANNOT.Name="Integron_Finder" \
      ANNOT.Version="1.5.1" \
      ANNOT.Description="Integron Finder aims at detecting integrons in DNA sequences." \
      ANNOT.Vendor="Institut Pasteur" \
      ANNOT.EDAM_Operation="['operation_0361', 'operation_0362', 'operation_0239', 'operation_2423', 'operation_0253', 'operation_3087', 'operation_0415']" \
      ANNOT.EDAM_Topic="['topic_0160', 'topic_0160', 'topic_0080', 'topic_3073', 'topic_3053', 'topic_3053', 'topic_0114', 'topic_0798']" \
      ANNOT.Requires="['Prodigall 2.6.2', 'infernal 1.1.1', 'hmmer 3.1b2', 'numpy 1.11.0', 'matplotlib 1.5.1', 'biopython 1.66']" \
      ANNOT.Provides="['integron_finder']"
      
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends prodigal infernal hmmer && \
    apt-get install -y python-pip python-numpy python-matplotlib python-biopython && \
    apt-get clean

# It will install pandas too
# I don't use pandas package because the version is too old 0.17
RUN pip install integron_finder

RUN useradd -m -U if -G users

USER if

WORKDIR /home/if

ENTRYPOINT ["integron_finder"]

CMD ["-h"]
