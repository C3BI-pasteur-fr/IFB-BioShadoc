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
    apt-get install -y --no-install-recommends \
              ansible \
              unzip \
              wget \
              time \
              bc \
              gawk \
              libgcj16 && \
    apt-get install -y python-pip && \
    apt-get clean

WORKDIR /tmp

RUN wget https://github.com/C3BI-pasteur-fr/IFB-playbook/archive/coregenebuilder.zip \
    && unzip coregenebuilder.zip

WORKDIR /tmp/IFB-playbook-coregenebuilder/coregenebuilder

COPY inventory /tmp/IFB-playbook-coregenebuilder/coregenebuilder/Inventory/hosts

RUN ansible-playbook coregenebuilder.yml -i Inventory/ -c local \
    && mkdir -p /root/mydisk \
    && rm -r /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/local/share/coregenebuilder/data

ENTRYPOINT ["coregenebuilder"]

CMD ["-h"]
