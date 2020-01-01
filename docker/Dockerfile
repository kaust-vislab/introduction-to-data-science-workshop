FROM continuumio/miniconda3:4.7.12

LABEL maintainer="pughdr <david.pugh@kaust.edu.sa>"

SHELL [ "/bin/bash", "-c" ]

# Update conda as root
RUN conda update --name base --channel defaults conda

# Create a non-root user
ARG username=al-khawarizmi
ARG uid=1000
ARG gid=100
ENV USER ${username}
ENV UID ${uid}
ENV GID ${gid}
ENV HOME /home/$USER

RUN adduser --disabled-password \
    --gecos "Non-root user" \
    --uid $UID \
    --gid $GID \
    --home $HOME \
    $USER

# Dockerhub not yet supporting COPY --chown $UID:$GID syntax
COPY environment.yml /usr/tmp/environment.yml
RUN chown $UID:$GID /usr/tmp/environment.yml

COPY docker/entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chown $UID:$GID /usr/local/bin/docker-entrypoint.sh && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

# want to create conda environment as non-root user 
USER ${USER}
RUN mkdir $HOME/app
WORKDIR $HOME/app

# build the specified conda environment from a file
RUN conda env create --prefix ./env --file /usr/tmp/environment.yml && \
    conda clean --all --force-pkgs-dir --yes && \
    conda init bash

# use an entrypoint script to insure conda environment is properly activated at runtime
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

# default command will be to launch JupyterLab server for development
EXPOSE 8888
CMD [ "jupyter", "lab", "--no-browser", "--ip", "0.0.0.0" ]
