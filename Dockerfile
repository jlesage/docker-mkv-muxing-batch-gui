#
# mkv-muxing-batch-gui Dockerfile
#
# https://github.com/jlesage/docker-mkv-muxing-batch-gui
#

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=

# Define software versions.
ARG MKV_MUXING_BATCH_GUI_VERSION=2.4.2

# Define software download URLs.
ARG MKV_MUXING_BATCH_GUI_URL=https://github.com/yaser01/mkv-muxing-batch-gui/archive/refs/tags/${MKV_MUXING_BATCH_GUI_VERSION}.tar.gz

# Build MKV Muxing Batch GUI.
FROM --platform=$BUILDPLATFORM alpine:3.19 AS mkv-muxing-batch-gui
ARG MKV_MUXING_BATCH_GUI_URL
RUN \
    # Download.
    apk --no-cache add curl && \
    mkdir /opt/mkv-muxing-batch-gui && \
    curl -L -# ${MKV_MUXING_BATCH_GUI_URL} | tar xz --strip 1 -C /opt/mkv-muxing-batch-gui && \
    # Do not use packaged tools.
    rm /opt/mkv-muxing-batch-gui/Resources/Tools/Linux/* && \
    ln -s /usr/bin/mkvmerge /opt/mkv-muxing-batch-gui/Resources/Tools/Linux/mkvmerge && \
    ln -s /usr/bin/mkvpropedit /opt/mkv-muxing-batch-gui/Resources/Tools/Linux/mkvpropedit && \
    # Remove the theme button.
    sed -i '/theme_button/d' /opt/mkv-muxing-batch-gui/packages/Tabs/TabsManager.py

# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.19-v4.6.3

ARG MKV_MUXING_BATCH_GUI_VERSION
ARG DOCKER_IMAGE_VERSION

# Define working directory.
WORKDIR /tmp

# Install dependencies.
RUN \
    add-pkg \
        py3-qt5 \
        py3-psutil \
        py3-pyside6 \
        mesa-dri-gallium \
        mkvtoolnix \
        # Needed for dark mode support.
        adwaita-qt \
        # Needed for config file handling.
        jq \
        moreutils \
    && \
    # Save some space by removing unused DRI drivers.
    find /usr/lib/xorg/modules/dri/ -type f ! -name swrast_dri.so -exec echo "Removing {}..." ';' -delete

# Generate and install favicons.
RUN \
    APP_ICON_URL=https://github.com/jlesage/docker-templates/raw/master/jlesage/images/mkv-muxing-batch-gui-icon.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Add files.
COPY rootfs/ /
COPY --from=mkv-muxing-batch-gui /opt/mkv-muxing-batch-gui /opt/mkv-muxing-batch-gui

# Set internal environment variables.
RUN \
    set-cont-env APP_NAME "MKV Muxing Batch GUI" && \
    set-cont-env APP_VERSION "$MKV_MUXING_BATCH_GUI_VERSION" && \
    set-cont-env DOCKER_IMAGE_VERSION "$DOCKER_IMAGE_VERSION" && \
    true

# Define mountable directories.
VOLUME ["/storage"]

# Metadata.
LABEL \
    org.label-schema.name="mkv-muxing-batch-gui" \
    org.label-schema.description="Docker container for MKV Muxing Batch GUI" \
    org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
    org.label-schema.vcs-url="https://github.com/jlesage/docker-mkv-muxing-batch-gui" \
    org.label-schema.schema-version="1.0"
