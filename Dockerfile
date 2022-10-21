FROM nvidia/cuda:11.0.3-base-ubuntu20.04 as base

RUN apt-get -qy update && apt-get -qy --no-install-recommends install \
    python3-pip \
    libaio1 \
    unzip

RUN pip3 -q install Pipenv

COPY Pipfile Pipfile.lock ./

RUN pipenv install

ARG LD_LIBRARY_PATH

ARG ORACLE_INSTANT_DRIVER_ZIP

ARG ORACLE_WALLET_ZIP

COPY ${ORACLE_INSTANT_DRIVER_ZIP} .

COPY ${ORACLE_WALLET_ZIP} .

COPY connect.py .

RUN unzip ${ORACLE_INSTANT_DRIVER_ZIP}

RUN cd ${LD_LIBRARY_PATH}/network/admin && unzip -o ../../../$ORACLE_WALLET_ZIP

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}

ENTRYPOINT [ "pipenv", "run" ]

CMD [ "python3", "./connect.py" ]