FROM julia:1.6.1 

RUN apt-get update && apt-get install -y git
RUN julia -e 'using Pkg; Pkg.add("CrystalInfoFramework#master"); Pkg.add("Lerche"); Pkg.add("FilePaths"); Pkg.add("ArgParse")'

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

