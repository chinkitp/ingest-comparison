FROM openjdk

RUN git clone -b 'feature/zen-68-tune-elastic' https://github.com/data61/stellar-search.git
RUN apt-get update
RUN apt-get install --yes maven 
WORKDIR /stellar-search 
RUN mvn package
ENTRYPOINT [ "java", "-jar ./search/target/stellar-search-0.1.3-SNAPSHOT-exec.jar --spring.profiles.active=develop" ]