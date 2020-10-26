FROM google/cloud-sdk:315.0.0@sha256:eaa417664fba2330da0d704761d2c8bda691d31dd13d650d1e25356e40d2e9b0

# use with -e CLOUDSDK_CORE_PROJECT=...,

EXPOSE 8081

HEALTHCHECK --interval=3s --timeout=1s --retries=10 \
    CMD curl --fail http://localhost:8081

CMD ["gcloud", "beta", "emulators", "datastore", "start", "--host-port=0.0.0.0:8081"]
