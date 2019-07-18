#!/bin/bash
gcloud beta compute ssl-certificates create cert-iorg-sat-prod-resolver --domains resolver.api.identifiers.org
gcloud beta compute ssl-certificates create cert-iorg-sat-prod-metadata --domains metadata.api.identifiers.org
gcloud beta compute ssl-certificates create cert-iorg-sat-prod-web --domains cloud.identifiers.org
