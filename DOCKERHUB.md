# Docker container for MKV Muxing Batch GUI
[![Release](https://img.shields.io/github/release/jlesage/docker-mkv-muxing-batch-gui.svg?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-mkv-muxing-batch-gui/releases/latest)
[![Docker Image Size](https://img.shields.io/docker/image-size/jlesage/mkv-muxing-batch-gui/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/mkv-muxing-batch-gui/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/jlesage/mkv-muxing-batch-gui?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/mkv-muxing-batch-gui)
[![Docker Stars](https://img.shields.io/docker/stars/jlesage/mkv-muxing-batch-gui?label=Stars&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/mkv-muxing-batch-gui)
[![Build Status](https://img.shields.io/github/actions/workflow/status/jlesage/docker-mkv-muxing-batch-gui/build-image.yml?logo=github&branch=master&style=for-the-badge)](https://github.com/jlesage/docker-mkv-muxing-batch-gui/actions/workflows/build-image.yml)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-mkv-muxing-batch-gui)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg?style=for-the-badge)](https://paypal.me/JocelynLeSage)

This is a Docker container for [MKV Muxing Batch GUI](https://github.com/yaser01/mkv-muxing-batch-gui).

The graphical user interface (GUI) of the application can be accessed through a
modern web browser, requiring no installation or configuration on the client

> This Docker container is entirely unofficial and not made by the creators of MKV Muxing Batch GUI.

---

[![MKV Muxing Batch GUI logo](https://images.weserv.nl/?url=raw.githubusercontent.com/jlesage/docker-templates/master/jlesage/images/mkv-muxing-batch-gui-icon.png&w=110)](https://github.com/yaser01/mkv-muxing-batch-gui)[![MKV Muxing Batch GUI](https://images.placeholders.dev/?width=640&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=MKV%20Muxing%20Batch%20GUI&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://github.com/yaser01/mkv-muxing-batch-gui)

App for muxing (merging) videos with subtitles, audios, chapters and
attachments with many options.

---

## Quick Start

**NOTE**:
    The Docker command provided in this quick start is an example, and parameters
    should be adjusted to suit your needs.

Launch the MKV Muxing Batch GUI docker container with the following command:
```shell
docker run -d \
    --name=mkv-muxing-batch-gui \
    -p 5800:5800 \
    -v /docker/appdata/mkv-muxing-batch-gui:/config:rw \
    -v /home/user:/storage:rw \
    jlesage/mkv-muxing-batch-gui
```

Where:

  - `/docker/appdata/mkv-muxing-batch-gui`: Stores the application's configuration, state, logs, and any files requiring persistency.
  - `/home/user`: Contains files from the host that need to be accessible to the application.

Access the MKV Muxing Batch GUI GUI by browsing to `http://your-host-ip:5800`.
Files from the host appear under the `/storage` folder in the container.

## Documentation

Full documentation is available at https://github.com/jlesage/docker-mkv-muxing-batch-gui.

## Support or Contact

Having troubles with the container or have questions? Please
[create a new issue](https://github.com/jlesage/docker-mkv-muxing-batch-gui/issues).

For other Dockerized applications, visit https://jlesage.github.io/docker-apps.
