FROM ubuntu

MAINTAINER Bertrand Néron <bneron@pasteur.fr>

LABEL ANNOT.Name="CoreGenBuilder" \
      ANNOT.Version="1.0" \
      ANNOT.Description="CoreGenBuilder is a pipeline for building a core genome from a set of bacterial genomes" \
      ANNOT.Vendor="Institut Pasteur" \
      ANNOT.EDAM_Operation="['operation_2995', 'operation_0289', 'operation_0362', 'operation_0291']" \
      ANNOT.EDAM_Topic="['topic_0623']" \
      ANNOT.Requires="[]" \
      ANNOT.Provides="['run_cg_pipeline.sh']"
      
RUN apt-get -y update && \
    apt-get install -y ansible unzip python-pip wget time bc gawk

WORKDIR /tmp/
RUN wget https://github.com/C3BI-pasteur-fr/IFB-playbook/archive/coregenbuilder.zip && \
    unzip coregenbuilder.zip

WORKDIR /tmp/IFB-playbook-coregenbuilder/coregenbuilder
COPY inventory /tmp/IFB-playbook-coregenbuilder/coregenbuilder/Inventory/hosts
COPY coregenbuilder.tar.gz /tmp/IFB-playbook-coregenbuilder/coregenbuilder/roles/coregenbuilder/files/coregenbuilder.tar.gz

RUN ansible-playbook coregenbuilder.yml -i Inventory/ -c local

RUN mkdir -p /root/mydisk

ENTRYPOINT ["/usr/local/bin/run_cg_pipeline.sh"]

CMD ["-h"]
