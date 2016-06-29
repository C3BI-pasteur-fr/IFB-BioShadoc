FROM ubuntu

MAINTAINER Bertrand Néron <bneron@pasteur.fr>

LABEL ANNOT.Name="CoreGenBuilder" \
      ANNOT.Version="1.0" \
      ANNOT.Description="TODO" \
      ANNOT.Vendor="Institut Pasteur" \
      ANNOT.EDAM_Operation="operation_XXXX operation_XXXX operation_XXXX" \
      ANNOT.EDAM_Topic="" \
      ANNOT.Requires="[]" \
      ANNOT.Provides="['run_cg_pipeline.sh']"
      
RUN apt-get -y update && \
    apt-get install -y ansible unzip python-pip wget time bc gawk openjdk-9-jre

WORKDIR /tmp/
RUN wget https://github.com/C3BI-pasteur-fr/IFB-playbook/archive/coregenbuilder.zip && \
    unzip coregenbuilder.zip

WORKDIR /tmp/IFB-playbook-coregenbuilder/coregenbuilder
COPY inventory /tmp/IFB-playbook-coregenbuilder/coregenbuilder/Inventory/hosts
COPY opscan /tmp/IFB-playbook-coregenbuilder/coregenbuilder/roles/coregenbuilder/files/opscan
COPY BLOSUM60 /tmp/IFB-playbook-coregenbuilder/coregenbuilder/roles/coregenbuilder/files/BLOSUM60
COPY coregenbuilder.tar.gz /tmp/IFB-playbook-coregenbuilder/coregenbuilder/roles/coregenbuilder/files/coregenbuilder.tar.gz

RUN ansible-playbook coregenbuilder.yml -i Inventory/ -c local

RUN mkdir -p /root/mydisk

ENTRYPOINT ["/usr/local/bin/run_cg_pipeline.sh"]

CMD ["-h"]
