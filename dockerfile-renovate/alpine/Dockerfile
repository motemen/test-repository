FROM google/cloud-sdk:315.0.0-alpine@sha256:d97c009ab5862fae179c1230d128ed9c67e0770656d5409be9024d4324e045a3

# use with -e CLOUDSDK_CORE_PROJECT=...,

RUN apk --no-cache add openjdk8-jre && \
    gcloud components install cloud-datastore-emulator beta --quiet

EXPOSE 8081

HEALTHCHECK --interval=3s --timeout=1s --retries=10 \
    CMD curl --fail http://localhost:8081

CMD ["gcloud", "beta", "emulators", "datastore", "start", "--host-port=0.0.0.0:8081"]
