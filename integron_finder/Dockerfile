FROM ubuntu

MAINTAINER Bertrand Néron <bneron@pasteur.fr>

LABEL ANNOT.Name="Integron_Finder" \
      ANNOT.Version="1.5.1" \
      ANNOT.Description="Integron Finder aims at detecting integrons in DNA sequences." \
      ANNOT.Vendor="Institut Pasteur" \
      ANNOT.EDAM_Operation="['operation_0361', 'operation_0362', 'operation_0239', 'operation_2423', 'operation_0253', 'operation_3087', 'operation_0415']" \
      ANNOT.EDAM_Topic="['topic_0160', 'topic_0160', 'topic_0080', 'topic_3073', 'topic_3053', 'topic_3053', 'topic_0114', 'topic_0798']" \
      ANNOT.Requires="['Prodigal'l', 'infernal', 'hmmer', 'numpy', 'matplotlib', 'pandas' 'biopython']" \
      ANNOT.Provides="['integron_finder']"
      
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends prodigal infernal hmmer && \
    apt-get install -y python-pip && \
    apt-get clean

RUN pip install integron_finder==1.5.1

RUN useradd -m -U if -G users && \
    chmod 755 /root

WORKDIR /root/mydisk

USER if

ENTRYPOINT ["integron_finder"]

CMD ["-h"]
