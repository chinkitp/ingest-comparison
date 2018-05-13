FROM openjdk

RUN git clone -b 'feature/zen-68-tune-elastic' https://github.com/data61/stellar-search.git
RUN apt-get update
RUN apt-get install --yes maven 
WORKDIR /stellar-search 
# the ignoring of the docker is required as we are not going to be running integration tests
RUN  mvn package -DskipTests=true -Dmaven.javadoc.skip=true -Ddockerfile.skip=true -B -V
ENTRYPOINT [ "java", "-jar ./search/target/stellar-search-0.1.3-SNAPSHOT-exec.jar --spring.profiles.active=cloud" ]