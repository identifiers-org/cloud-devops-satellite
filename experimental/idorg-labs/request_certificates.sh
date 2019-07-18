#!/bin/bash
gcloud beta compute ssl-certificates create idorg-labs-satellite-api-resolver --domains resolver.api.labs.identifiers.org
gcloud beta compute ssl-certificates create idorg-labs-satellite-api-metadata --domains metadata.api.labs.identifiers.org
gcloud beta compute ssl-certificates create idorg-labs-satellite-web --domains labs.identifiers.org
