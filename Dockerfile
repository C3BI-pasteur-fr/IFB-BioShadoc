FROM ubuntu

MAINTAINER Bertrand Néron <bneron@pasteur.fr>

LABEL ANNOT.Name="CoreGeneBuilder" \
      ANNOT.Version="1.0" \
      ANNOT.Description="CoreGeneBuilder is a pipeline for building a core genome from a set of bacterial genomes" \
      ANNOT.Vendor="Institut Pasteur" \
      ANNOT.EDAM_Operation="['operation_2995', 'operation_0289', 'operation_0362', 'operation_0291']" \
      ANNOT.EDAM_Topic="['topic_0623']" \
      ANNOT.Requires="[]" \
      ANNOT.Provides="['coregenebuilder']"
      
RUN apt-get -y update && \
    apt-get install -y ansible unzip python-pip wget time bc gawk openjdk-9-jre libgcj16

WORKDIR /tmp/
RUN wget https://github.com/C3BI-pasteur-fr/IFB-playbook/archive/coregenbuilder.zip && \
    unzip coregenbuilder.zip

WORKDIR /tmp/IFB-playbook-coregenbuilder/coregenebuilder
COPY inventory /tmp/IFB-playbook-coregenbuilder/coregenebuilder/Inventory/hosts
COPY coregenebuilder.tar.gz /tmp/IFB-playbook-coregenbuilder/coregenebuilder/roles/coregenebuilder/files/coregenebuilder.tar.gz

RUN ansible-playbook coregenebuilder.yml -i Inventory/ -c local

RUN mkdir -p /root/mydisk

ENTRYPOINT ["/usr/local/bin/coregenebuilder"]

CMD ["-h"]
