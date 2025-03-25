FROM quay.io/jupyter/base-notebook

RUN apt-get update && apt-get install -y \
    fonts-noto-cjk \
    language-pack-zh-hans \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LANGUAGE zh_CN:zh:en
ENV LC_ALL zh_CN.UTF-8

RUN pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --user && \
    jupyter nbextension enable code_prettify/code_prettify && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable collapsible_headings/main && \
    jupyter nbextension enable hide_input/main && \
    jupyter nbextension enable varInspector/main && \
    jupyter nbextension enable toc2/main

EXPOSE 8888

WORKDIR /home/wangcw/work

CMD ["start-notebook.sh", "--NotebookApp.token='Mm19890425'","--NotebookApp.notebook_dir='/home/wangcw/work'"]