FROM pytorch/pytorch:latest

# The container already has conda installed
RUN apt-get update && apt-get install -y wget bzip2 curl git vim nano

# Install code-server and Jupyter Lab and other dependencies
RUN /opt/conda/bin/conda install jupyterlab jupyterlab-nvdashboard matplotlib pandas -c conda-forge --yes

# RUN curl -fsSL https://code-server.dev/install.sh | sh

# Expose port 8001
EXPOSE 8001

# Start code-server
# CMD ["code-server", "--bind-addr", "0.0.0.0:8001", "--auth", "none"]

# Start Jupyter Lab
CMD [ "jupyter", "lab" ,"--no-browser", "--port=8001", "--port-retries=0" , "--ip=0.0.0.0" ,"--allow-root" ] 