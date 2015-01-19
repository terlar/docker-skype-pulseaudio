FROM debian:wheezy
MAINTAINER Terje Larsen

ENV DEBIAN_FRONTEND noninteractive

# Install Skype and PulseAudio.
WORKDIR /usr/src
RUN dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		libpulse0:i386 \
		pulseaudio:i386 \
		curl \
		libqt4-dbus:i386 \
		libqt4-network:i386 \
		libqt4-xml:i386 \
		libqtcore4:i386 \
		libqtgui4:i386 \
		libqtwebkit4:i386 \
		libxss1:i386 \
		libxv1:i386 \
		libssl1.0.0:i386 \
	&& curl -Lo skype.deb http://www.skype.com/go/getskype-linux-deb-32 \
	&& apt-get purge -y --auto-remove curl \
	&& { dpkg -i skype.deb || true; } \
	&& rm skype.deb \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo enable-shm=no >> /etc/pulse/client.conf

# PulseAudio server.
ENV PULSE_SERVER=/run/pulse/native
ENV PULSE_LATENCY_MSEC=30

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["skype"]
