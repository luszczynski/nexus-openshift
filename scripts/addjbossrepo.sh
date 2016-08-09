#!/bin/bash

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -f -X POST -v --data '{"data":{"repoType":"proxy","id":"jboss-enterprise-maven-repository","name":"jboss-enterprise-maven-repository","browseable":true,"indexable":true,"notFoundCacheTTL":1440,"artifactMaxAge":-1,"metadataMaxAge":1440,"itemMaxAge":1440,"repoPolicy":"RELEASE","provider":"maven2","providerRole":"org.sonatype.nexus.proxy.repository.Repository","downloadRemoteIndexes":true,"autoBlockActive":true,"fileTypeValidation":true,"exposed":true,"checksumPolicy":"WARN","remoteStorage":{"remoteStorageUrl":"http://maven.repository.redhat.com/techpreview/all/","authentication":null,"connectionSettings":null}}}' -u admin:admin123 http://$NEXUS_SERVICE:8081/service/local/repositories


curl -i -H "Accept: application/json" -H "Content-Type: application/json" -f -X PUT -v --data '{"data":{"id":"public","name":"Public Repositories","format":"maven2","exposed":true,"provider":"maven2","repositories":[{"id":"releases"},{"id":"snapshots"},{"id":"thirdparty"},{"id":"central"},{"id":"jboss-enterprise-maven-repository"}]}}' -u admin:admin123 http://$NEXUS_SERVICE:8081/service/local/repo_groups/public
